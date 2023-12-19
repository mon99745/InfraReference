@REM usage: dklogs demo

call dksetenv %1

docker logs -f --tail 100 $NAME
