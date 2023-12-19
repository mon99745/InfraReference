# usage: ./sonar.sh demo test

JAVA_HOME="C:/jdk/jdk-11"

./gradlew -S -x test sonarqube
