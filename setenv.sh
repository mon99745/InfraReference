#JAVA_HOME="C:/jdk/jdk-11"
export JAVA_HOME

TODAY=`date +%Y%m%d`
export TODAY
TOTIME=`date +%H%M%S`
export TOTIME

JAVA_OPTS="-server"
JAVA_OPTS="$JAVA_OPTS -Xms256m"
JAVA_OPTS="$JAVA_OPTS -Xmx2g"
JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"
JAVA_OPTS="$JAVA_OPTS -Duser.timezone=Asia/Seoul"
JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=local"
#JAVA_OPTS="$JAVA_OPTS -Dspring.config.name=demo"
#JAVA_OPTS="$JAVA_OPTS -Dhazelcast.socket.bind.any=false"

WAR_PATH=build/libs/demo-1.0.0.war

export WAR_PATH
export JAVA_OPTS

VERSION=1.0.0
export VERSION
