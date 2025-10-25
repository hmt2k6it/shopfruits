package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
// Bỏ import java.net.URI và java.net.URISyntaxException
// vì chúng ta không dùng chúng nữa

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
    
    // --- ĐÃ SỬA LỖI: Phương thức này giờ đây phân tích chuỗi DATABASE_URL bằng tay ---
    private static Connection getRailwayConnection(String dbUrl)
            throws ClassNotFoundException, SQLException {
        
        System.out.println("Connecting to Railway MySQL...");

        // dbUrl có dạng: mysql://user:password@host:port/database

        // --- BẮT ĐẦU SỬA LỖI PARSING ---
        
        // 1. Bỏ tiền tố "mysql://"
        if (!dbUrl.startsWith("mysql://")) {
            throw new SQLException("Invalid DATABASE_URL: must start with mysql://");
        }
        String connectionString = dbUrl.substring("mysql://".length()); // Bỏ 8 ký tự đầu

        // 2. Tách user:password và host:port/db tại ký tự '@'
        String[] userInfoAndHost = connectionString.split("@", 2);
        if (userInfoAndHost.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing '@' separator.");
        }
        
        String userInfo = userInfoAndHost[0];
        String hostInfo = userInfoAndHost[1];

        // 3. Tách username và password tại ký tự ':'
        String[] userPass = userInfo.split(":", 2);
        if (userPass.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing ':' in user info.");
        }
        String username = userPass[0];
        String password = userPass[1];

        // 4. Tách host:port và database name tại ký tự '/'
        String[] hostPortAndDb = hostInfo.split("/", 2);
        if (hostPortAndDb.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing '/' separator for database name.");
        }
        
        String hostPort = hostPortAndDb[0];
        String dbName = hostPortAndDb[1];
        
        // 5. Tách host và port tại ký tự ':'
        String[] hostAndPort = hostPort.split(":", 2);
        if (hostAndPort.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing ':' separator for port.");
        }
        
        String host = hostAndPort[0];
        String port = hostAndPort[1]; // Giữ port ở dạng String
        
        // --- KẾT THÚC SỬA LỖI PARSING ---

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