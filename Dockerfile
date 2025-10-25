# --- Giai đoạn 1: Xây dựng (Build) dự án ---
FROM maven:3.8-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests


# --- Giai đoạn 2: Chạy (Run) ứng dụng ---
# SỬA LỖI Ở DÒNG NÀY (PHIÊN BẢN CUỐI CÙNG)
FROM tomcat:9.0-jdk17

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file .war từ giai đoạn 'build' vào thư mục webapps của Tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080