chcp 65001
@REM usage: sonar demo
set JAVA_HOME=C:\jdk\jdk-11

gradlew -S -x test sonarqube
