chcp 65001
@REM usage: dksetenv demo 8080

@REM set HOST=localhost:8080/
set NAME=%1
set GROUP=com.example
set VERSION=1.0.0
set FULL_NAME=%HOST%%GROUP%/%NAME%:%VERSION%
set PORT=%2

set JAVA_OPTS=%JAVA_OPTS% -Dspring.profiles.active=demo
