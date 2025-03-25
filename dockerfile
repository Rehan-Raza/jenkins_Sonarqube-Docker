# Stage 1: Build the application using Maven
FROM maven:3.9.6-amazoncorretto-17 AS build
# Set working directory
WORKDIR /app

# Expose application port (Adjust if needed)
EXPOSE 8081

