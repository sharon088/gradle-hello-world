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

# GitHub Actions CI/CD
This project is set up with GitHub Actions to automate the process of building, versioning, and pushing the Docker image to Docker Hub.

## Workflow Steps:
1. <ins>Version increment:</ins>\
Each time you push to the `Master` branch, the pipeline increments the version of the application in build.gradle.kts by updating the PATCH version (e.g., from `1.0.0` to `1.0.1`).
2. <ins>Build and Push Docker image:</ins>\
The workflow builds the Docker image and pushes it to Docker Hub with the updated version tag.
3. <ins>Run the Docker Container:</ins>\
The pipeline runs the Docker container to ensure that the built image works as expected.
4. <ins>Commit and Push Changes:</ins>\
After the image is built and pushed, the workflow commits and pushes the updated `build.gradle.kts` file with the new version.

> [!NOTE]
> - Secrets Required:
>	- `DOCKERHUB_USERNAME` - Your Docker Hub username for login.
>	- `DOCKERHUB_TOKEN` - Your Docker hub token (for authentication).
> - Vars Required:
>	- `DOCKER_TAG_USER_NAME` - Your Docker Hub username for tagging.
>	- `DOCKER_IMAGE_NAME` - Your image name.
> - Docker Image Tags: The image is tagged using the format: your-dockerhub-username/gradle-hello-world: new-version
