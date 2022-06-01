#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ADD target/devOpsDemo-0.0.1-SNAPSHOT.jar app.jar

#ENTRYPOINT ["java","-jar","app.jar"]

#EXPOSE 2222
FROM openjdk:8-jdk-alpine
RUN curl -sSL https://get.docker.com/ | sh
VOLUME /var/lib/docker
COPY target/devOpsDemo-0.0.1-SNAPSHOT.jar /app.jar
CMD ["java","-jar","/app.jar"]
EXPOSE 2222
