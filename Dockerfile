FROM openjdk:8-jre-alpine
ARG NAME
RUN echo $NAME
COPY $NAME/build/libs/demo-1.0.0.war app.war
RUN mkdir config
ENTRYPOINT java -server $JAVA_OPTS -jar app.war