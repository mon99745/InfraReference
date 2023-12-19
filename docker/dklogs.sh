# usage: ./dklogs.sh demo

./dksetenv.sh

docker logs -f --tail 100 demo
