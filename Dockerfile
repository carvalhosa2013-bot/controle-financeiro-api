FROM maven:3.9.11-eclipse-temurin-17 AS build

WORKDIR /build

COPY controle-financeiro-api-final.zip /tmp/project.zip

RUN mkdir /project && cd /project && jar xf /tmp/project.zip

RUN mvn -q -DskipTests package -f /project/pom.xml

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /project/target/controle-financeiro-api-0.0.2-SNAPSHOT.jar app.jar

EXPOSE 10000

ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT:-10000} -jar /app/app.jar"]
