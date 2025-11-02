# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the target directory to the container
# We use a wildcard to match the jar file name
COPY target/*.jar app.jar

# Make port 8080 available
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]