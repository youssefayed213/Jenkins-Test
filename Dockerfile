#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ADD target/devOpsDemo-0.0.1-SNAPSHOT.jar app.jar

#ENTRYPOINT ["java","-jar","app.jar"]

#EXPOSE 2222
FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
