FROM maven:4.0.0-openjdk-21 AS build

WORKDIR /app

COPY VeterinerYonetimSistemi/pom.xml /app

COPY VeterinerYonetimSistemi/src /app/src

RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:21-jdk

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]