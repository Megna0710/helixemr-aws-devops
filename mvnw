#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Apache Maven Wrapper startup batch script, version 3.3.2
# ----------------------------------------------------------------------------

# If JAVA_HOME is set, use it; otherwise fall through to PATH
if [ -n "$JAVA_HOME" ] ; then
  if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
    JAVACMD="$JAVA_HOME/jre/sh/java"
  else
    JAVACMD="$JAVA_HOME/bin/java"
  fi
  if [ ! -x "$JAVACMD" ] ; then
    die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
  fi
else
  JAVACMD="$(command -v java)"
  if [ ! -x "$JAVACMD" ] ; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
  fi
fi

MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$(pwd)"}
MAVEN_WRAPPER_JAR="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar"
MAVEN_WRAPPER_PROPERTIES="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.properties"

wrapperJarUrl=$(grep -m 1 "^wrapperUrl" "$MAVEN_WRAPPER_PROPERTIES" | tr -d '[:space:]' | cut -d'=' -f2-)
distributionUrl=$(grep -m 1 "^distributionUrl" "$MAVEN_WRAPPER_PROPERTIES" | tr -d '[:space:]' | cut -d'=' -f2-)

MAVEN_USER_HOME=${MAVEN_USER_HOME:-"$HOME/.m2"}
MAVEN_DIST_NAME=$(basename "$distributionUrl" .zip)
MAVEN_DIST_DIR="$MAVEN_USER_HOME/wrapper/dists/$MAVEN_DIST_NAME"
MAVEN_HOME="$MAVEN_DIST_DIR/$MAVEN_DIST_NAME"

if [ ! -d "$MAVEN_HOME" ]; then
  mkdir -p "$MAVEN_DIST_DIR"
  TMP_DOWNLOAD="$MAVEN_DIST_DIR/download.zip"
  echo "Downloading $distributionUrl"
  if command -v curl > /dev/null; then
    curl -fsSL "$distributionUrl" -o "$TMP_DOWNLOAD"
  elif command -v wget > /dev/null; then
    wget -q "$distributionUrl" -O "$TMP_DOWNLOAD"
  else
    die "ERROR: curl or wget required to download Maven"
  fi
  unzip -q "$TMP_DOWNLOAD" -d "$MAVEN_DIST_DIR"
  rm -f "$TMP_DOWNLOAD"
fi

MAVEN_CMD="$MAVEN_HOME/bin/mvn"
exec "$MAVEN_CMD" "$@"
