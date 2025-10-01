# Stage 1: Build the project using Maven
FROM maven:3.9.2-eclipse-temurin-17 AS build

# Set working directory inside container
WORKDIR /app

# Copy the project folder into the container
COPY EnglishPracticeApp /app

# Build the project (skip tests)
RUN mvn -B -DskipTests clean package

# Stage 2: Create a smaller runtime image
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy the built jar from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
