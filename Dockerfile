# =============================================================================
#  HelixEMR Docker Image
#  Helix Health – Enterprise Electronic Medical Record System
#  Copyright (C) 2024 Helix Health <https://helixhealth.io>
#  Mozilla Public License, v. 2.0
# =============================================================================

# ─── Build Stage ──────────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jdk-jammy AS builder

LABEL stage=builder

WORKDIR /build

# Install Maven directly (avoids wrapper downloading Maven zip at build time)
RUN apt-get update -q && \
    apt-get install -y --no-install-recommends maven && \
    rm -rf /var/lib/apt/lists/*

# Copy Maven wrapper and POMs first (cache dependency downloads)
COPY .mvn/             .mvn/
COPY mvnw              mvnw
COPY pom.xml           pom.xml
COPY bom/pom.xml       bom/pom.xml
COPY tools/pom.xml     tools/pom.xml
COPY test/pom.xml      test/pom.xml
COPY api/pom.xml       api/pom.xml
COPY web/pom.xml       web/pom.xml
COPY webapp/pom.xml    webapp/pom.xml
COPY liquibase/pom.xml liquibase/pom.xml

RUN mvn dependency:resolve -P skip-all-checks --fail-at-end -q || true

# Copy source
COPY api/     api/
COPY web/     web/
COPY webapp/  webapp/
COPY liquibase/ liquibase/
COPY tools/   tools/
COPY test/    test/
COPY bom/     bom/

# Build the WAR (skip tests in Docker build – run separately in CI)
RUN mvn package -P skip-all-checks -DskipTests -q

# ─── Runtime Stage ────────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jre-jammy AS runtime

LABEL maintainer="Helix Health Engineering <engineering@helixhealth.io>"
LABEL org.opencontainers.image.title="HelixEMR"
LABEL org.opencontainers.image.description="Helix Health Electronic Medical Record System"
LABEL org.opencontainers.image.vendor="Helix Health"
LABEL org.opencontainers.image.url="https://helixhealth.io"
LABEL org.opencontainers.image.licenses="MPL-2.0"
LABEL org.opencontainers.image.version="1.0.0"

ENV DEBIAN_FRONTEND=noninteractive

# Install Tomcat 11
ENV CATALINA_HOME=/opt/tomcat
ENV TOMCAT_VERSION=11.0.2

RUN apt-get update -q && \
    apt-get install -y --no-install-recommends curl wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${CATALINA_HOME} && \
    wget -q "https://archive.apache.org/dist/tomcat/tomcat-11/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
         -O /tmp/tomcat.tar.gz && \
    tar -xzf /tmp/tomcat.tar.gz --strip-components=1 -C ${CATALINA_HOME} && \
    rm /tmp/tomcat.tar.gz && \
    rm -rf ${CATALINA_HOME}/webapps/ROOT \
           ${CATALINA_HOME}/webapps/examples \
           ${CATALINA_HOME}/webapps/docs \
           ${CATALINA_HOME}/webapps/host-manager \
           ${CATALINA_HOME}/webapps/manager

# Create non-root user
RUN groupadd -r helixemr && useradd -r -g helixemr -d /opt/helixemr helixemr

# HelixEMR data directory
ENV HELIXEMR_DATA=/var/lib/helixemr
RUN mkdir -p ${HELIXEMR_DATA}/logs \
             ${HELIXEMR_DATA}/storage \
             ${HELIXEMR_DATA}/modules && \
    chown -R helixemr:helixemr ${HELIXEMR_DATA} ${CATALINA_HOME}

# Deploy WAR
COPY --from=builder /build/webapp/target/helixemr.war \
     ${CATALINA_HOME}/webapps/helixemr.war

# Environment variables (can be overridden at runtime)
ENV OMRS_DB_TYPE=mariadb
ENV HELIX_DB_HOSTNAME=db
ENV HELIX_DB_PORT=3306
ENV HELIX_DB_NAME=helixemr
ENV HELIX_DB_USERNAME=helixemr
ENV HELIX_DB_PASSWORD=helixemr
ENV HELIX_ADMIN_USER_PASSWORD=Admin1234!
ENV JAVA_OPTS="-Xmx1g -Xms512m -server \
    -Djava.security.egd=file:/dev/./urandom \
    -Dfile.encoding=UTF-8 \
    -Dhelixemr.application.data.directory=${HELIXEMR_DATA}"

# Health check
HEALTHCHECK --interval=30s --timeout=15s --start-period=120s --retries=5 \
    CMD curl -sf http://localhost:8080/helixemr/health/alive || exit 1

USER helixemr

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "exec ${CATALINA_HOME}/bin/catalina.sh run"]
