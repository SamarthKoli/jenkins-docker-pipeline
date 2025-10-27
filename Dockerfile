FROM openjdk
WORKDIR /app
COPY target/jenkinsdocker-1.jar app.jar
CMD ["java", "-jar", "app.jar"]
