# -------- Stage 1: Build --------
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copy pom first for dependency caching
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build Spring Boot jar
RUN mvn clean package -DskipTests


# -------- Stage 2: Runtime --------
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy fat jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Spring Boot default port
EXPOSE 8081

# Run app
ENTRYPOINT ["java", "-jar", "app.jar"]
