FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY target/*.jar app.jar
COPY wait-for-it.sh wait-for-it.sh

RUN chmod +x wait-for-it.sh

ENTRYPOINT ["sh","-c","./wait-for-it.sh mysql:3306 --timeout=60 --strict -- java -jar app.jar"]

