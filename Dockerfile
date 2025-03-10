# Stage 1: Build the application with Gradle
FROM openjdk:17-jdk-alpine AS build

WORKDIR /app

# Copy everything from the current directory
COPY . .

# Build the application
RUN ./gradlew shadowJar

# Stage 2: Final Image
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Create non-root user
RUN adduser -D myuser

# Copy the fat JAR from the build stage (using wildcard)
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Set user and entrypoint
USER myuser
ENTRYPOINT ["java", "-jar", "app.jar"]
