# In build stage
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Set Maven local repo to /tmp to avoid persistent volume usage
RUN mvn -Dmaven.repo.local=/tmp/.m2 clean package -DskipTests -Dmaven.test.skip=true -Dskip.hpl=true
