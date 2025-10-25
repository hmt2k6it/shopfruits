package database;

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
    
    /**
     * Phương thức này xử lý kết nối Cloud (Railway, Aiven,...)
     * bằng cách phân tích chuỗi DATABASE_URL
     */
    private static Connection getCloudConnection(String dbUrl)
            throws ClassNotFoundException, SQLException {
        
        System.out.println("Connecting to Cloud MySQL...");
        System.out.println("Parsing DATABASE_URL: " + dbUrl);

        // dbUrl có dạng: mysql://user:password@host:port/database?params...

        // 1. Bỏ tiền tố "mysql://"
        if (!dbUrl.startsWith("mysql://")) {
            throw new SQLException("Invalid DATABASE_URL: must start with mysql://");
        }
        String connectionString = dbUrl.substring("mysql://".length());

        // 2. Tách user:password và host:port/db... tại ký tự '@'
        String[] userInfoAndHost = connectionString.split("@", 2);
        if (userInfoAndHost.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing '@' separator.");
        }
        
        String userInfo = userInfoAndHost[0];
        String hostInfo = userInfoAndHost[1]; // Ví dụ: host:port/db?param=value

        // 3. Tách username và password tại ký tự ':'
        String[] userPass = userInfo.split(":", 2);
        if (userPass.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing ':' in user info.");
        }
        String username = userPass[0];
        String password = userPass[1];

        // 4. Tách host:port và (database + params) tại ký tự '/' đầu tiên
        String[] hostPortAndDb = hostInfo.split("/", 2);
        if (hostPortAndDb.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing '/' separator for database name.");
        }
        
        String hostPort = hostPortAndDb[0];
        String dbPathAndParams = hostPortAndDb[1]; // Ví dụ: "defaultdb?ssl-mode=REQUIRED" hoặc "railway"
        
        // 5. Tách host và port tại ký tự ':'
        String[] hostAndPort = hostPort.split(":", 2);
        if (hostAndPort.length != 2) {
            throw new SQLException("Invalid DATABASE_URL: missing ':' separator for port.");
        }
        
        String host = hostAndPort[0];
        String port = hostAndPort[1];
        
        // --- SỬA LỖI QUAN TRỌNG ---
        // Tạo chuỗi JDBC URL.
        // Chúng ta giữ nguyên phần dbPathAndParams (bao gồm cả database và tham số)
        // Thay vì tự ý thêm "?useSSL=false" như trước
        String jdbcUrl = "jdbc:mysql://" + host + ":" + port + "/" + dbPathAndParams;
        // --- KẾT THÚC SỬA LỖI ---

        System.out.println("Generated JDBC URL: " + jdbcUrl);

        // Tải driver MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
        System.out.println("Successfully connected to Cloud MySQL!");
        return connection;
    }

    /**
     * Phương thức chính để lấy kết nối.
     * Sẽ tự động kiểm tra biến môi trường "DATABASE_URL".
     * Nếu có, kết nối tới Cloud.
     * Nếu không, kết nối tới localhost.
     */
    public static Connection getConnection() {
        try {
            String dbUrl = System.getenv("DATABASE_URL");
            
            if (dbUrl == null || dbUrl.isEmpty()) {
                // Không có DATABASE_URL, dùng local
                return getLocalConnection();
            } else {
                // Có DATABASE_URL, dùng cloud (Aiven hoặc Railway)
                // Đổi tên hàm gọi
                return getCloudConnection(dbUrl); 
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