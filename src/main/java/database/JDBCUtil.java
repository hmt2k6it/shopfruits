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
    
    // --- THAY ĐỔI: Phương thức này giờ đây để kết nối MySQL trên Railway ---
    private static Connection getRailwayConnection(String dbUrl)
            throws URISyntaxException, ClassNotFoundException, SQLException {
        
        System.out.println("Connecting to Railway MySQL...");

        // dbUrl có dạng: mysql://user:password@host:port/database
        // Cần chuyển nó thành URI để phân tích
        URI dbUri = new URI(dbUrl);

        String userInfo = dbUri.getUserInfo();
        if (userInfo == null || !userInfo.contains(":")) {
            throw new SQLException("Invalid database user info in DATABASE_URL environment variable.");
        }

        String username = userInfo.split(":")[0];
        String password = userInfo.split(":")[1];
        String host = dbUri.getHost();
        int port = dbUri.getPort();
        String dbName = dbUri.getPath().substring(1); // Bỏ dấu / ở đầu

        if (host == null || port == -1 || dbName.isEmpty()) {
             throw new SQLException("Invalid database URL format in DATABASE_URL environment variable.");
        }

        // Tạo chuỗi JDBC URL cho MySQL
        // Dạng: jdbc:mysql://host:port/database
        String jdbcUrl = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useSSL=false";

        // Tải driver MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
        System.out.println("Successfully connected to Railway MySQL!");
        return connection;
    }

    /**
     * Phương thức chính để lấy kết nối.
     * Sẽ tự động kiểm tra biến môi trường "DATABASE_URL".
     * Nếu có, kết nối tới Railway.
     * Nếu không, kết nối tới localhost.
     */
    public static Connection getConnection() {
        try {
            String dbUrl = System.getenv("DATABASE_URL");
            
            if (dbUrl == null || dbUrl.isEmpty()) {
                // Không có DATABASE_URL, dùng local
                return getLocalConnection();
            } else {
                // Có DATABASE_URL, dùng Railway
                // --- THAY ĐỔI: Gọi getRailwayConnection thay vì getRenderConnection ---
                return getRailwayConnection(dbUrl); 
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