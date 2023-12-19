# usage: ./dkbuild.sh demo

./dksetenv.sh $1

#./build.sh $1
docker rmi -f $FULL_NAME
docker build -t $FULL_NAME --build-arg NAME=$NAME ..
#docker images [-a]
