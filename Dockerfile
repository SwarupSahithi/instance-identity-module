# Use Maven with JDK 17 base image for building
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set working directory inside container
WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src


# Second stage: minimal runtime image
FROM eclipse-temurin:17-jre

# Copy the built artifact from the build stage
COPY --from=build /app/target/*.hpi /app/

# Set working directory
WORKDIR /app

# (Optional) expose ports if your plugin runs a service (adjust if needed)
# EXPOSE 8080

# (Optional) set default command - depends on how you want to run/use this container
CMD ["bash"]
