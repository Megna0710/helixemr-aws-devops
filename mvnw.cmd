@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF)
@REM Apache Maven Wrapper startup batch script, version 3.3.2
@REM ----------------------------------------------------------------------------
@IF "%__MVNW_ARG0_NAME__%"=="" (SET "BASE_DIR=%~dp0") ELSE SET "BASE_DIR=%__MVNW_ARG0_NAME__%"

@SET WRAPPER_PROPERTIES=%BASE_DIR%.mvn\wrapper\maven-wrapper.properties
@FOR /F "usebackq tokens=2 delims==" %%A IN (`findstr /i "distributionUrl" "%WRAPPER_PROPERTIES%"`) DO (SET DIST_URL=%%A)

@SET MAVEN_USER_HOME=%USERPROFILE%\.m2
@FOR %%A IN ("%DIST_URL%") DO SET DIST_NAME=%%~nA
@SET MAVEN_HOME=%MAVEN_USER_HOME%\wrapper\dists\%DIST_NAME%\%DIST_NAME%

@IF NOT EXIST "%MAVEN_HOME%\bin\mvn.cmd" (
    @MKDIR "%MAVEN_USER_HOME%\wrapper\dists\%DIST_NAME%" 2>NUL
    @curl -fsSL "%DIST_URL%" -o "%MAVEN_USER_HOME%\wrapper\dists\%DIST_NAME%\download.zip"
    @tar -xf "%MAVEN_USER_HOME%\wrapper\dists\%DIST_NAME%\download.zip" -C "%MAVEN_USER_HOME%\wrapper\dists\%DIST_NAME%"
    @DEL "%MAVEN_USER_HOME%\wrapper\dists\%DIST_NAME%\download.zip"
)

@"%MAVEN_HOME%\bin\mvn.cmd" %*
