# usage: ./sonar.sh didm test

JAVA_HOME="C:/jdk/jdk-11"

./gradlew -S -x test sonarqube
