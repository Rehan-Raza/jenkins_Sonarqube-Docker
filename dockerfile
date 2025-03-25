# Stage 1: Build the application using Maven
FROM maven:3.9.6-amazoncorretto-17 AS build
# Set working directory
WORKDIR /app

# Use Maven with OpenJDK 17 as the base image
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Install Git
RUN apt-get update && apt-get install -y git

# Clone the repository
RUN git clone https://github.com/Rehan-Raza/jenkins_Sonarqube-Docker.git

# Set working directory to the cloned repository
WORKDIR /jenkins_Sonarqube-Docker

# Build the project (Skip tests for faster build)
RUN mvn clean install -DskipTests


# Clone the project from GitHub (Replace with your repo URL)
RUN git clone https://github.com/Rehan-Raza/jenkins_Sonarqube-Docker.git

# Build the project (Skip tests for faster build)
RUN mvn clean package -DskipTests

# Stage 2: Use a lightweight JRE for running the application
FROM eclipse-temurin:17-jre

# Set working directory
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose application port (Adjust if needed)
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
