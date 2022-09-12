FROM openjdk:11-slim as build

MAINTAINER tuyosistema.com

COPY target/accounts-dockerizada-0.0.1-SNAPSHOT.jar accounts-dockerizada-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/accounts-dockerizada-0.0.1-SNAPSHOT.jar"]