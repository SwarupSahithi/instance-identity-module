# First stage: build
FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build the Jenkins plugin (produces .hpi file)
RUN mvn clean package -DskipTests

# Second stage: minimal runtime
FROM eclipse-temurin:17-jre

# Copy the .hpi file from the build stage
COPY --from=build /app/target/*.hpi /app/

WORKDIR /app
