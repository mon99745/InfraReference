@REM usage: dkbuild demo

call dksetenv %1
@REM call build %1

docker image prune -f
docker rmi -f %FULL_NAME%
docker build -t %FULL_NAME% ..
@REM docker images [-a]