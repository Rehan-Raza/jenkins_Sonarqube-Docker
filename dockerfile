# Stage 1: Build the application using Maven
FROM maven:3.9.6-amazoncorretto-17 AS build
# Set working directory
WORKDIR /app

# Install Git
RUN apt-get update && apt-get install -y git

# Build the project (Skip tests for faster build)
RUN mvn clean package -DskipTests

# Expose application port (Adjust if needed)
EXPOSE 8081

# Start the application
ENTRYPOINT ["java", "app.jar"]
