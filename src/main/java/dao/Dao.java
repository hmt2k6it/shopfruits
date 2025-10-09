package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.JDBCUtil;
import models.Category;
import models.Product;

public class Dao {

    public List<Product> getAllProducts() {
        return getProductsByCategory(0);
    }

    public List<Product> getProductsByCategory(int cateId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM products " +
                "JOIN categories ON products.cate_id = categories.category_id ";
        if (cateId > 0) {
            sql += "WHERE cate_id = ?";
        }

        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)) {
            if (cateId > 0) {
                ps.setInt(1, cateId);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(new Product(rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("product_des"),
                            rs.getString("product_img"),
                            rs.getLong("product_price"),
                            new Category(rs.getInt("category_id"),
                                    rs.getString("category_name"))));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Map<String, Integer> getCategoryWithSize() {
        Map<String, Integer> categoriesMap = new HashMap<>();
        String sql = "SELECT category_name, "
                + "COUNT(product_id) AS total_products "
                + "FROM categories "
                + "JOIN products ON category_id = cate_id "
                + "GROUP BY category_name;";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                categoriesMap.put(rs.getString("category_name"), rs.getInt("total_products"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoriesMap;
    }

    public List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                categories.add(new Category(rs.getInt("category_id"), rs.getString("category_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
