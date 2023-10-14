FROM ubuntu:latest   AS build
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y 
 
 

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline
copy src ./src

CMD ["./mvnw", "spring-boot:run"]
 