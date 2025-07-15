# Use a valid and available Maven image
FROM maven:3.8-openjdk-17 AS build

WORKDIR /app

COPY . .

# Build the project and skip tests
RUN mvn clean package -DskipTests

# Run the app with JDK
FROM openjdk:17-jdk

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
