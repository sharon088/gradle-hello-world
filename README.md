# gradle-hello-world
# Java Hello World using the Gradle Wrapper and the Kotlin DSL
This is a Hello World project that contains the most important parts of the Gradle build scripts.

# Tasks
```
build - Compiles Hello World and creates JAR files.
2 jar files will be created:
- gradle-hello-world-all.jar - this jar contains everything.
- gradle-hello-world.jar - this is regular jar, it contains only the project's classes.
```

# Build
```
./gradlew build
The jar files located ar gradle-hello-world/build/libs/
make the runnable jar executable then, use "java -jar gradle-hello-world-all.jar"
```

# Docker
This Project includes a Dockerfile that can be used to build and run the application inside a container.
## Build and Run with Docker
1. Build the Docker image:
you can build the Docker iamge the following command:
```
docker build -t your-dockerhub-username/gradle-hello-world .
```
2. Run the Docker container:
After building the image, you can run the container:
```
docker run your-dockerhub-username/gradle-hello-world
```
