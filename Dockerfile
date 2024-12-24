# 1단계: 빌드 단계
FROM maven:3.8.5-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2단계: 실행 단계
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
