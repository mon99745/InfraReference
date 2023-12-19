# usage: ./dkrun.sh demo 8080

./setenv.sh
./dksetenv.sh $1 $2

docker stop $NAME
docker rm $NAME
docker run -p $PORT:$PORT --name $NAME -e NAME="$NAME" -e JAVA_OPTS="$JAVA_OPTS"  --restart always -d $FULL_NAME
#docker ps [-a]
