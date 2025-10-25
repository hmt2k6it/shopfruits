package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import models.Product;

@WebServlet(urlPatterns = { "/search" })
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        req.setCharacterEncoding("UTF-8");
        // Lấy dữ liệu từ request
        String productName = req.getParameter("productName");
        // Lấy dữ liệu từ database
        List<Product> productByName = dao.getProductByName(productName);
        // Gửi dữ liệu lên jsp
        req.setAttribute("allProducts", productByName);
        req.setAttribute("productName", productName);
        req.getRequestDispatcher("/views/shop.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
