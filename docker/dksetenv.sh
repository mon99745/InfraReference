# usage: ./dksetenv.sh demo 8080

#systemctl start docker
#sudo gpasswd -a $USER docker
#sudo chown root:docker /var/run/docker.sock

#HOST=localhost:8080/
export HOST
GROUP=com.example
export GROUP
NAME=$1
export NAME
VERSION=1.0.0
export VERSION
FULL_NAME=$HOST$GROUP/$NAME:$VERSION
export FULL_NAME
PORT=$2
export PORT

JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=demo"
export JAVA_OPTS
