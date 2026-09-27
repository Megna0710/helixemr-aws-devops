# HelixEMR Installation Guide

**Helix Health – Enterprise Electronic Medical Record System**
Version 1.0.0

---

## System Requirements

### Minimum (Development)
| Component | Minimum |
|-----------|---------|
| CPU | 2 cores |
| RAM | 2 GB |
| Disk | 10 GB |
| Java | 21 (Eclipse Temurin) |
| Database | MariaDB 10.11 |
| Servlet Container | Tomcat 11 |

### Recommended (Production)
| Component | Recommended |
|-----------|-------------|
| CPU | 8+ cores |
| RAM | 8 GB |
| Disk | 100 GB SSD |
| Java | 21 (Eclipse Temurin) |
| Database | MariaDB 10.11 cluster |
| Servlet Container | Tomcat 11 cluster behind nginx |

---

## Installation Methods

### Method 1: Docker Compose (Easiest)

```bash
# 1. Download docker-compose.yml
curl -O https://raw.githubusercontent.com/helixhealth/helixemr-core/main/docker-compose.yml

# 2. Create .env file
cat > .env <<EOF
HELIX_DB_PASSWORD=SecureDbPass123!
HELIX_ADMIN_USER_PASSWORD=SecureAdminPass123!
TAG=1.0.0
EOF

# 3. Start
docker compose up -d

# 4. Monitor startup
docker compose logs -f app

# 5. Access when healthy
open http://localhost:8080/helixemr
```

### Method 2: Traditional WAR Deployment

#### Step 1 – Set up MariaDB

```sql
CREATE DATABASE helixemr CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'helixemr'@'localhost' IDENTIFIED BY 'your_secure_password';
GRANT ALL PRIVILEGES ON helixemr.* TO 'helixemr'@'localhost';
FLUSH PRIVILEGES;
```

#### Step 2 – Configure Tomcat

Add to `$CATALINA_HOME/conf/context.xml`:

```xml
<Resource name="jdbc/helixemr"
          auth="Container"
          type="javax.sql.DataSource"
          driverClassName="org.mariadb.jdbc.Driver"
          url="jdbc:mariadb://localhost:3306/helixemr"
          username="helixemr"
          password="your_secure_password"
          maxTotal="20"
          maxIdle="10"
          minIdle="5"/>
```

#### Step 3 – Deploy WAR

```bash
# Build
./mvnw package -DskipTests

# Deploy
cp webapp/target/helixemr.war $CATALINA_HOME/webapps/

# Start Tomcat
$CATALINA_HOME/bin/startup.sh
```

#### Step 4 – First Run Setup

Navigate to http://your-server:8080/helixemr/setup and follow the wizard.

---

## Environment Variables Reference

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `HELIX_DB_HOSTNAME` | Yes | `db` | Database hostname |
| `HELIX_DB_PORT` | No | `3306` | Database port |
| `HELIX_DB_NAME` | No | `helixemr` | Database name |
| `HELIX_DB_USERNAME` | Yes | `helixemr` | DB username |
| `HELIX_DB_PASSWORD` | Yes | — | DB password |
| `HELIX_ADMIN_USER_PASSWORD` | Yes | — | Initial admin password |
| `HELIXEMR_DATA` | No | `/var/lib/helixemr` | Data directory |
| `JAVA_OPTS` | No | See Dockerfile | JVM options |

---

## Production Hardening

### HTTPS / TLS

Always run HelixEMR behind an HTTPS-terminating reverse proxy in production.

Nginx example:

```nginx
server {
    listen 443 ssl http2;
    server_name emr.yourhospital.org;

    ssl_certificate     /etc/ssl/certs/emr.crt;
    ssl_certificate_key /etc/ssl/private/emr.key;
    ssl_protocols       TLSv1.2 TLSv1.3;

    location /helixemr/ {
        proxy_pass http://localhost:8080/helixemr/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
    }
}
```

### `web.xml` – Enable Secure Cookies

Change in `webapp/src/main/webapp/WEB-INF/web.xml`:
```xml
<secure>true</secure>
```

### Database Backups

```bash
# Daily backup (add to cron)
mysqldump -u helixemr -p helixemr | gzip > /backups/helixemr-$(date +%Y%m%d).sql.gz
```

---

## Troubleshooting

### Application won't start

1. Check logs: `docker compose logs app` or `$CATALINA_HOME/logs/catalina.out`
2. Verify database connectivity: `mysql -h db -u helixemr -p helixemr`
3. Ensure `HELIX_ADMIN_USER_PASSWORD` meets complexity requirements (8+ chars, digit, uppercase)

### Out of Memory

Increase JVM heap in `JAVA_OPTS`: `-Xmx2g -Xms1g`

### Database migration fails

Check Liquibase logs and ensure the DB user has DDL privileges.

---

## Upgrading

```bash
# Pull new version
docker compose pull

# Stop, upgrade, restart
docker compose down
docker compose up -d

# Liquibase handles schema migrations automatically on startup
```

---

*© 2024 Helix Health | support@helixhealth.io*
