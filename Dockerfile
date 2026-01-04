# Dockerfile (multi-stage build)
# Stage 1: build
FROM maven:3.8.8-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml mvnw ./
COPY .mvn .mvn
COPY src ./src
RUN mvn -B package -DskipTests

# Stage 2: runtime
FROM eclipse-temurin:17-jre-jammy
ARG JAR_FILE=target/*.jar
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]