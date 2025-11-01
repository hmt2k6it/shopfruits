package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.JDBCUtil;
import models.Account;
import models.Cart;
import models.Category;
import models.Item;
import models.Order;
import models.OrderDetail;
import models.Product;
import models.Season;

public class Dao {
    public List<Product> getAllProduct() {
        return getListProduct(null, null); //
    }

    public List<Product> getListProduct(String condition, List<Object> params) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT product_id, product_name, product_des, product_img, product_price, categories.category_id, categories.category_name, seasons.season_id, seasons.season_name "
                +
                "FROM products " +
                "JOIN categories ON products.category_id = categories.category_id " +
                "JOIN seasons ON products.season_id = seasons.season_id ";
        if (condition != null) {
            sql = sql + condition;
        }
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);) {

            // Thêm code để set tham số
            if (params != null) {
                for (int i = 0; i < params.size(); i++) {
                    ps.setObject(i + 1, params.get(i));
                }
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // ... (code cũ giữ nguyên)
                products.add(
                        new Product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("product_des"),
                                rs.getString("product_img"), rs.getLong("product_price"),
                                new Category(rs.getInt("category_id"), rs.getString("category_name")),
                                new Season(rs.getInt("season_id"), rs.getString("season_name"))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getProductByName(String productName) {
        String condition = " WHERE product_name LIKE ?";
        List<Object> params = new ArrayList<>();
        params.add("%" + productName + "%");
        return getListProduct(condition, params);
    }

    public List<Product> getProductsByCategory(String id) {
        String condition = " WHERE products.category_id = ?";
        List<Object> params = new ArrayList<>();
        params.add(id); // Giả sử id là Int
        return getListProduct(condition, params);
    }

    public List<Product> getProductsBySeason(String id) {
        String condition = " WHERE products.season_id = ?";
        List<Object> params = new ArrayList<>();
        params.add(id); // Giả sử id là Int
        return getListProduct(condition, params);
    }

    public List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories ";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                categories.add(new Category(rs.getInt("category_id"), rs.getString("category_name")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Season> getAllSeason() {
        List<Season> seasons = new ArrayList<>();
        String sql = "SELECT * FROM seasons ";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                seasons.add(new Season(rs.getInt("season_id"), rs.getString("season_name")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return seasons;
    }

    public Account login(String username, String password) {
        String sql = "SELECT * FROM account " +
                "WHERE username = ? " +
                "AND PASSWORD = ? ";
        try {
            Connection connection = JDBCUtil.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("email"), rs.getInt("is_admin"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkUser(String username) {
        String sql = "SELECT username FROM account WHERE username = ?";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean createAccount(String username, String password, String email) {

        String sql = "INSERT INTO account (username, password, email, is_admin) VALUES (?, ?, ?, 0)";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public Product getProductById(String productId) {
        String sql = "SELECT product_id, product_name, product_des, product_img, product_price, categories.category_id, categories.category_name, seasons.season_id, seasons.season_name "
                +
                "FROM products " +
                "JOIN categories ON products.category_id = categories.category_id " +
                "JOIN seasons ON products.season_id = seasons.season_id " +
                "WHERE product_id = ?";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("product_des"),
                        rs.getString("product_img"), rs.getInt("product_price"),
                        new Category(rs.getInt("category_id"), rs.getString("category_name")),
                        new Season(rs.getInt("season_id"), rs.getString("season_name")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addProductToCart(int userId, int productId, int quantity) {

        String sql = "INSERT INTO cartItems (user_id, product_id, quantity) "
                + "VALUES (?, ?, ?) "
                + "ON DUPLICATE KEY UPDATE "
                + "quantity = quantity + ?;";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
            ps.setInt(4, quantity);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Cart getCartByUserId(int userId) {
        Cart cart = new Cart();
        String query = "SELECT c.product_id, c.quantity, p.product_name, p.product_price, p.product_img "
                + "FROM cartItems c "
                + "JOIN products p ON c.product_id = p.product_id "
                + "WHERE c.user_id = ?";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cart.addItem(
                        new Product(rs.getInt("product_id"), rs.getString("product_name"), null,
                                rs.getString("product_img"), rs.getLong("product_price"), null, null),
                        rs.getInt("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public boolean confirmOrder(Account account, Cart cart, String shippingAddress, String paymentMethod) {
        String sqlOrder = "INSERT INTO orders (user_id, order_date, total_amount, shipping_address, status_order, payment_method) "
                + "VALUES (?, NOW(), ?, ?, 'Pending', ?)";

        String sqlDetail = "INSERT INTO orderdetails (order_id, product_id, quantity, price_at_purchase) VALUES (?, ?, ?, ?)";
        String sqlDeleteCart = "DELETE FROM cartItems WHERE user_id = ?";
        String sqlUpdateStock = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE product_id = ?";

        Connection connection = null;
        PreparedStatement psOrder = null;
        PreparedStatement psDetail = null;
        PreparedStatement psDeleteCart = null;
        PreparedStatement psUpdateStock = null;
        ResultSet rs = null;

        try {
            connection = JDBCUtil.getConnection();
            connection.setAutoCommit(false);
            psOrder = connection.prepareStatement(sqlOrder, PreparedStatement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, account.getUserId());
            psOrder.setLong(2, cart.getTotalPrice());
            psOrder.setString(3, shippingAddress);
            psOrder.setString(4, paymentMethod);

            psOrder.executeUpdate();

            rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            if (orderId == 0) {
                throw new Exception("Tạo đơn hàng thất bại, không lấy được order_id.");
            }
            psDetail = connection.prepareStatement(sqlDetail);
            psUpdateStock = connection.prepareStatement(sqlUpdateStock);

            for (Item item : cart.getItems()) {
                psDetail.setInt(1, orderId);
                psDetail.setInt(2, item.getProduct().getProductId());
                psDetail.setInt(3, item.getQuantity());
                psDetail.setDouble(4, item.getProduct().getProductPrice());
                psDetail.addBatch();
                psUpdateStock.setInt(1, item.getQuantity());
                psUpdateStock.setInt(2, item.getProduct().getProductId());
                psUpdateStock.addBatch();
            }

            psDetail.executeBatch();
            psUpdateStock.executeBatch();

            psDeleteCart = connection.prepareStatement(sqlDeleteCart);
            psDeleteCart.setInt(1, account.getUserId());
            psDeleteCart.executeUpdate();

            connection.commit();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            return false;

        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (psOrder != null)
                    psOrder.close();
                if (psDetail != null)
                    psDetail.close();
                if (psUpdateStock != null)
                    psUpdateStock.close();
                if (psDeleteCart != null)
                    psDeleteCart.close();
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
    }

    public List<Account> getAllUsers() {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM account";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                accounts.add(new Account(rs.getInt("user_id"), rs.getString("username"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getInt("is_admin")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accounts;
    }

    // 2. HÀM LẤY TẤT CẢ ĐƠN HÀNG
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        // Lấy tên cột cho đúng (ví dụ: status_order, total_amount...)
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getDate("order_date")); // Lấy về java.util.Date
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status_order")); // Giả sử tên cột là status_order
                // ... (set thêm các trường khác)
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    // 3. HÀM THÊM SẢN PHẨM MỚI
    public boolean addProduct(String name, String desc, long price, String categoryId, String seasonId) {
        String sql = "INSERT INTO products (product_name, product_des, product_price, category_id, season_id) "
                + "VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setLong(3, price);
            ps.setString(4, categoryId);
            ps.setString(5, seasonId);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. HÀM SỬA SẢN PHẨM
    public boolean updateProduct(int id, String name, String desc, long price, String categoryId, String seasonId) {
        // Nếu 'image' là null (nghĩa là không upload ảnh mới), thì không cập nhật cột
        // 'product_img'
        String sql = "UPDATE products SET product_name = ?, product_des = ?, product_price = ?, category_id = ? season_id = ? WHERE product_id = ?";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setLong(3, price);
            ps.setString(4, categoryId);
            ps.setString(4, seasonId);
            ps.setInt(6, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. HÀM XÓA SẢN PHẨM
    public boolean deleteProduct(int productId) {
        // Cảnh báo: Phải xóa ở bảng 'cartItems' và 'orderDetails' trước
        // nếu có khóa ngoại, nếu không sẽ lỗi!

        String sqlCart = "DELETE FROM cartItems WHERE product_id = ?";
        String sqlOrderDetails = "DELETE FROM orderdetails WHERE product_id = ?";
        String sqlProduct = "DELETE FROM products WHERE product_id = ?";

        Connection connection = null;
        PreparedStatement psCart = null;
        PreparedStatement psOrderDetails = null;
        PreparedStatement psProduct = null;

        try {
            connection = JDBCUtil.getConnection();
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Xóa khỏi giỏ hàng
            psCart = connection.prepareStatement(sqlCart);
            psCart.setInt(1, productId);
            psCart.executeUpdate();

            // Xóa khỏi chi tiết đơn hàng (Cân nhắc kỹ: Có nên xóa lịch sử không?)
            // Tạm thời tôi comment lại, vì xóa lịch sử đơn hàng là không nên

            psOrderDetails = connection.prepareStatement(sqlOrderDetails);
            psOrderDetails.setInt(1, productId);
            psOrderDetails.executeUpdate();

            // Xóa sản phẩm
            psProduct = connection.prepareStatement(sqlProduct);
            psProduct.setInt(1, productId);
            int result = psProduct.executeUpdate();

            connection.commit(); // Lưu
            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (connection != null)
                    connection.rollback();
            } catch (Exception e2) {
            }
            return false;
        } finally {
            // Đóng tất cả
            try {
                if (psCart != null)
                    psCart.close();
                if (psOrderDetails != null)
                    psOrderDetails.close();
                if (psProduct != null)
                    psProduct.close();
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (Exception e3) {
            }
        }
    }

    public boolean updateUserRole(int userId, int isAdmin) {
        String sql = "UPDATE account SET is_admin = ? WHERE user_id = ?";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, isAdmin); // Set quyền mới (0 hoặc 1)
            ps.setInt(2, userId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int userId) {

        // 4 câu lệnh SQL theo đúng thứ tự (thêm sqlOrderDetails)
        String sqlCart = "DELETE FROM cartItems WHERE user_id = ?";

        // BƯỚC MỚI: Xóa 'con' (orderdetails) trước
        String sqlOrderDetails = "DELETE FROM orderdetails WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)";

        String sqlOrders = "DELETE FROM orders WHERE user_id = ?"; // Xóa 'cha' (orders)
        String sqlAccount = "DELETE FROM account WHERE user_id = ?"; // Xóa 'ông' (account)

        Connection connection = null;
        PreparedStatement psCart = null;
        PreparedStatement psOrderDetails = null; // <-- Thêm PreparedStatement này
        PreparedStatement psOrders = null;
        PreparedStatement psAccount = null;

        try {
            connection = JDBCUtil.getConnection();
            connection.setAutoCommit(false); // Bắt đầu Transaction

            // 1. Xóa giỏ hàng của user
            psCart = connection.prepareStatement(sqlCart);
            psCart.setInt(1, userId);
            psCart.executeUpdate();

            // 2. (MỚI) Xóa chi tiết đơn hàng của user
            psOrderDetails = connection.prepareStatement(sqlOrderDetails);
            psOrderDetails.setInt(1, userId);
            psOrderDetails.executeUpdate();

            // 3. Xóa lịch sử đơn hàng của user
            psOrders = connection.prepareStatement(sqlOrders);
            psOrders.setInt(1, userId);
            psOrders.executeUpdate();

            // 4. Xóa tài khoản user
            psAccount = connection.prepareStatement(sqlAccount);
            psAccount.setInt(1, userId);
            int result = psAccount.executeUpdate();

            // 5. Nếu tất cả thành công, lưu (commit)
            connection.commit();
            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            // 6. Nếu có bất kỳ lỗi nào, hoàn tác (rollback)
            try {
                if (connection != null)
                    connection.rollback();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            return false; // Trả về false báo thất bại

        } finally {
            // 7. Đóng tất cả kết nối và bật lại autoCommit
            try {
                if (psCart != null)
                    psCart.close();
                if (psOrderDetails != null) // <-- Nhớ close()
                    psOrderDetails.close();
                if (psOrders != null)
                    psOrders.close();
                if (psAccount != null)
                    psAccount.close();
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
    }

    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE orders SET status_order = ? WHERE order_id = ?";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, newStatus);
            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. HÀM LẤY CHI TIẾT ĐƠN HÀNG
    public List<OrderDetail> getOrderDetailsById(int orderId) {
        List<OrderDetail> details = new ArrayList<>();
        String sql = "SELECT p.product_name, p.product_img, od.quantity, od.price_at_purchase "
                + "FROM orderdetails od "
                + "JOIN products p ON od.product_id = p.product_id "
                + "WHERE od.order_id = ?";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setProductName(rs.getString("product_name"));
                detail.setProductImage(rs.getString("product_img"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPriceAtPurchase(rs.getLong("price_at_purchase"));
                details.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }

    public boolean removeItemFromCart(int userId, int productId) {
        // Câu lệnh SQL để xóa chính xác 1 hàng
        String sql = "DELETE FROM cartItems WHERE user_id = ? AND product_id = ?";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            // 1. Set tham số cho user_id
            ps.setInt(1, userId);
            // 2. Set tham số cho product_id
            ps.setInt(2, productId);

            // 3. Thực thi lệnh xóa và kiểm tra xem có hàng nào bị ảnh hưởng không
            int rowsAffected = ps.executeUpdate();

            // Trả về true nếu có 1 hàng đã bị xóa
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            // Trả về false nếu có lỗi xảy ra
            return false;
        }
    }

    public boolean updateCartItemQuantity(int userId, int productId, int newQuantity) {
        // Dùng 'ON DUPLICATE KEY UPDATE' để tránh lỗi,
        // nhưng ở đây UPDATE trực tiếp sẽ tốt hơn
        String sql = "UPDATE cartItems SET quantity = ? WHERE user_id = ? AND product_id = ?";

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, newQuantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Account getAccountById(int userId) {
        String sql = "SELECT * FROM account WHERE user_id = ?";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Giả sử Account có constructor hoặc setters đầy đủ
                    // Cần thêm các trường firstName, lastName, phone, address
                    return new Account(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getInt("is_admin")
                    // , rs.getString("firstName"), // Thêm các trường mới
                    // , rs.getString("lastName"),
                    // , rs.getString("phone"),
                    // , rs.getString("address")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 2. Lấy danh sách đơn hàng của một User
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        // Join với user nếu cần lấy tên user
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setOrderDate(rs.getTimestamp("order_date")); // Dùng getTimestamp cho DATETIME
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status_order")); // Khớp tên cột
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    // 3. Cập nhật thông tin profile (KHÔNG cập nhật username, password)
    public boolean updateUserProfile(int userId, String firstName, String lastName, String email, String phone) {
        // Giả sử bảng account có các cột first_name, last_name, phone_number
        // String sql = "UPDATE account SET first_name = ?, last_name = ?, email = ?,
        // phone_number = ? WHERE user_id = ?";

        // Nếu chỉ có email:
        String sql = "UPDATE account SET email = ? WHERE user_id = ?"; // Chỉ cập nhật email ví dụ

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email); // Chỉ email ví dụ
            // ps.setString(1, firstName);
            // ps.setString(2, lastName);
            // ps.setString(3, email);
            // ps.setString(4, phone);
            ps.setInt(2, userId); // userId là tham số cuối

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. Cập nhật mật khẩu
    public boolean updatePassword(int userId, String newHashedPassword) {
        String sql = "UPDATE account SET password = ? WHERE user_id = ?";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, newHashedPassword);
            ps.setInt(2, userId);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        Dao dao = new Dao();
        dao.deleteUser(3);
    }
}
