@REM usage: dkrun demo 8080

call ../setenv
call dksetenv %1 %2

docker stop %NAME%
docker rm %NAME%
docker run -p %PORT%:%PORT% --name %NAME% -e NAME="%NAME%" -e JAVA_OPTS="%JAVA_OPTS%" --restart always -d %FULL_NAME%
@REM docker ps [-a]
