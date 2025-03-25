# Stage 1: Build the application using Maven
FROM maven:3.8.7-eclipse-temurin-17 AS build


# Set working directory
WORKDIR /app

# Clone the project from GitHub (Replace with your repo URL)
RUN git clone https://github.com/your-username/your-repo.git .

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
