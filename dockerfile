# Use an official OpenJDK runtime as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app



# Expose application port (default 8080 for Spring Boot)
EXPOSE 8081

# Command to run the application
CMD ["java", "-jar", "app.jar"]
