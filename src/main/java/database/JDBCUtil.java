package database;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {

    // Phương thức riêng để xử lý kết nối ở máy local
    private static Connection getLocalConnection() throws ClassNotFoundException, SQLException {
        // --- CẤU HÌNH KẾT NỐI LOCAL MYSQL CỦA BẠN ---
        String url = "jdbc:mysql://localhost:3306/shopfruits?useSSL=false"; // Sửa tên DB nếu cần
        String user = "root";
        String password = "root"; // Sửa password nếu có
        // -----------------------------------------

        System.out.println("Connecting to Local MySQL...");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, user, password);
        System.out.println("Successfully connected to Local MySQL!");
        return connection;
    }
    
    // Phương thức riêng để xử lý kết nối trên Render
    private static Connection getRenderConnection(String dbUrl)
            throws URISyntaxException, ClassNotFoundException, SQLException {
        System.out.println("Connecting to Render PostgreSQL...");
        URI dbUri = new URI(dbUrl);

        String userInfo = dbUri.getUserInfo();
        if (userInfo == null || !userInfo.contains(":")) {
            throw new SQLException("Invalid database user info in DATABASE_URL environment variable.");
        }

        String username = userInfo.split(":")[0];
        String password = userInfo.split(":")[1];

        // ---- SỬA LỖI Ở ĐÂY ----
        int port = dbUri.getPort();
        if (port == -1) {
            port = 5432; // Sử dụng cổng mặc định 5432 của PostgreSQL nếu không được chỉ định
        }
        String jdbcUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + port + dbUri.getPath();
        // ---- KẾT THÚC SỬA LỖI ----

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
        System.out.println("Successfully connected to Render PostgreSQL!");
        return connection;
    }

    public static Connection getConnection() {
        try {
            String dbUrl = System.getenv("DATABASE_URL");
            if (dbUrl == null || dbUrl.isEmpty()) {
                return getLocalConnection();
            } else {
                return getRenderConnection(dbUrl);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect to the database", e);
        }
    }

    public static void closeConnection(Connection c) {
        try {
            if (c != null && !c.isClosed()) {
                c.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}