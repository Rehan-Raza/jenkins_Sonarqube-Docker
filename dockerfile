# Use an official OpenJDK runtime as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file into the container
COPY /root/.jenkins/workspace/jenkins-maven/target/*.jar app.jar

# Expose application port (default 8080 for Spring Boot)
EXPOSE 8081

# Command to run the application
CMD ["java", "-jar", "app.jar"]
