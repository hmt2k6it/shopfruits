package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import models.Product;
import database.JDBCUtil;

public class Dao {
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM products";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getLong("product_price"),
                        rs.getString("product_img"),
                        rs.getString("product_des"),
                        rs.getInt("cate_id")));
            }
            JDBCUtil.closeConnection(conn);
        } catch (java.sql.SQLException e) {
            System.err.println("SQL Error retrieving products: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public ArrayList<Product> getVegetableProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM products WHERE cate_id = 2";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getLong("product_price"),
                        rs.getString("product_img"),
                        rs.getString("product_des"),
                        rs.getInt("cate_id")));
            }
            JDBCUtil.closeConnection(conn);
        } catch (java.sql.SQLException e) {
            System.err.println("SQL Error retrieving products: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public ArrayList<Product> getFruitProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM products WHERE cate_id = 1";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getLong("product_price"),
                        rs.getString("product_img"),
                        rs.getString("product_des"),
                        rs.getInt("cate_id")));
            }
            JDBCUtil.closeConnection(conn);
        } catch (java.sql.SQLException e) {
            System.err.println("SQL Error retrieving products: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public ArrayList<Product> getBreadProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM products WHERE cate_id = 3";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getLong("product_price"),
                        rs.getString("product_img"),
                        rs.getString("product_des"),
                        rs.getInt("cate_id")));
            }
            JDBCUtil.closeConnection(conn);
        } catch (java.sql.SQLException e) {
            System.err.println("SQL Error retrieving products: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public ArrayList<Product> getMeatProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM products WHERE cate_id = 4";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getLong("product_price"),
                        rs.getString("product_img"),
                        rs.getString("product_des"),
                        rs.getInt("cate_id")));
            }
            JDBCUtil.closeConnection(conn);
        } catch (java.sql.SQLException e) {
            System.err.println("SQL Error retrieving products: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public static void main(String[] args) {
        Dao dao = new Dao();
        ArrayList<Product> products = dao.getVegetableProducts();
        for (Product product : products) {
            System.out.println(product);
        }
    }
}