# 1. Build Stage
FROM maven:3.8-openjdk-17 AS build

WORKDIR /build

# Copy everything
COPY . .

# Set this to the folder where pom.xml exists
WORKDIR /build/TiffinServiceBackend

RUN mvn clean package -DskipTests

# 2. Run Stage
FROM openjdk:17-jdk

WORKDIR /app

COPY --from=build /build/TiffinServiceBackend/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
