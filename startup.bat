@REM usage: startup demo
call setenv

echo %WAR_PATH%
java -jar %JAVA_OPTS% build/libs/demo-1.0.0.war
