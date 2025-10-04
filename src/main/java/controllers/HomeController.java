package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import models.Product;

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();

        // Lấy tất cả sản phẩm
        ArrayList<Product> allProducts = dao.getAllProducts();
        // Lấy từng loại sản phẩm theo category_id
        ArrayList<Product> vegetableProducts = dao.getProductsByCategory(1);
        ArrayList<Product> fruitProducts = dao.getProductsByCategory(2);
        ArrayList<Product> breadProducts = dao.getProductsByCategory(3);
        ArrayList<Product> meatProducts = dao.getProductsByCategory(4);

        // Gán dữ liệu vào request
        req.setAttribute("allProducts", allProducts);
        req.setAttribute("vegetableProducts", vegetableProducts);
        req.setAttribute("fruitProducts", fruitProducts);
        req.setAttribute("breadProducts", breadProducts);
        req.setAttribute("meatProducts", meatProducts);

        // Chuyển sang JSP
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
