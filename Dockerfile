# Stage 1: Build the application with Gradle
FROM openjdk:17-jdk-alpine AS build

WORKDIR /app

# Copy everything from the current directory
COPY . .

# Grant execute permission to gradlew
RUN chmod +x gradlew

# Build the application
RUN ./gradlew shadowJar

# Stage 2: Final Image
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Create non-root user
RUN useradd myuser

# Copy the fat JAR from the build stage (using wildcard)
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Set user and entrypoint
USER myuser
ENTRYPOINT ["java", "-jar", "app.jar"]
