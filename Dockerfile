# --- Giai đoạn 1: Xây dựng (Build) dự án ---
# Sử dụng một image có sẵn Maven và Java (chọn phiên bản Java bạn dùng, ví dụ 17)
FROM maven:3.8-openjdk-17 AS build

# Đặt thư mục làm việc bên trong container
WORKDIR /app

# Sao chép file pom.xml vào trước để tận dụng cache của Docker
COPY pom.xml .

# Tải các dependency của dự án
RUN mvn dependency:go-offline

# Sao chép toàn bộ mã nguồn vào
COPY src ./src

# Chạy lệnh build của Maven để tạo ra file .war
# -DskipTests để bỏ qua việc chạy test, giúp build nhanh hơn
RUN mvn clean package -DskipTests


# --- Giai đoạn 2: Chạy (Run) ứng dụng ---
# Sử dụng một image Tomcat nhẹ để chạy file .war
FROM tomcat:9.0-jdk17-slim


# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file .war từ giai đoạn 'build' vào thư mục webapps của Tomcat
# Đổi tên thành ROOT.war để ứng dụng chạy ở đường dẫn gốc (/)
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Cổng 8080 được Tomcat mặc định mở, Render sẽ tự động nhận diện
EXPOSE 8080

# Lệnh để khởi động Tomcat đã được cấu hình sẵn trong image, không cần thêm CMD