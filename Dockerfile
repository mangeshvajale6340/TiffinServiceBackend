# Use official OpenJDK image
FROM openjdk:17

# Set the working directory
WORKDIR /app

# Copy all project files
COPY . .

# Build the project
RUN ./mvnw clean package -DskipTests

# Run the app
CMD ["java", "-jar", "target/yourappname.jar"]
