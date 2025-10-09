# --- Giai đoạn 1: Xây dựng (Build) dự án ---
# Dòng mới
FROM maven:3.9.5-eclipse-temurin-21

# Hoặc một phiên bản chính thức khác của Maven với JDK 21
# FROM maven:3-openjdk-21

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