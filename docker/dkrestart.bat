@REM usage: dkrestart demo

call dksetenv %1

docker restart %NAME%
