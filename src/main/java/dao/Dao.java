package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import models.Product;
import models.Category;
import database.JDBCUtil;

public class Dao {

    // Lấy tất cả sản phẩm
    public ArrayList<Product> getAllProducts() {
        return getProductsByCategory(0); // 0 có nghĩa là tất cả
    }

    // Lấy sản phẩm theo cate_id
    public ArrayList<Product> getProductsByCategory(int cateId) {
        ArrayList<Product> products = new ArrayList<>();
        try (Connection conn = JDBCUtil.getConnection();
                Statement st = conn.createStatement()) {

            String sql = "SELECT p.*, c.category_name " +
                    "FROM products p " +
                    "JOIN categories c ON p.cate_id = c.category_id";

            if (cateId > 0) { // nếu cateId > 0 thì lọc theo category
                sql += " WHERE p.cate_id = " + cateId;
            }

            try (ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    Category category = new Category(
                            rs.getInt("cate_id"),
                            rs.getString("category_name"));

                    products.add(new Product(
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getLong("product_price"),
                            rs.getString("product_img"),
                            rs.getString("product_des"),
                            category));
                }
            }

        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
        return products;
    }

    // Lấy tất cả category
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        try (Connection conn = JDBCUtil.getConnection();
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM categories")) {

            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("category_id"),
                        rs.getString("category_name")));
            }

        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
        return categories;
    }

    public static void main(String[] args) {
        Dao dao = new Dao();

        System.out.println("=== Tất cả sản phẩm ===");
        for (Product p : dao.getAllProducts()) {
            System.out.println(p.getCategory().getCategoryId() + " - " + p.getCategory().getCategoryName());
        }

        System.out.println("\n=== Sản phẩm rau (cate_id = 2) ===");
        for (Product p : dao.getProductsByCategory(1)) {
            System.out.println(p.getCategory().getCategoryId() + " - " + p.getCategory().getCategoryName());
        }
    }
}
