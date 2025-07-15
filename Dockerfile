FROM maven:3.8-openjdk-17 AS build

WORKDIR /build
COPY . .

# Change directory before running mvn
WORKDIR /build/TiffinServiceBackend
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk

WORKDIR /app

# Copy final jar
COPY --from=build /build/TiffinServiceBackend/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
