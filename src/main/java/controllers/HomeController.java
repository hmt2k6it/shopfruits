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

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        String activePage = req.getParameter("activePage");
        if (activePage == null) {
            activePage = "1";
        }
        // Lấy dữ liệu từ database
        List<Product> allProducts = dao.getAllProduct();
        // Xử lý logic pagination
        int pagination = (int) Math.ceil((double) allProducts.size() / 8);
        int startIndex = (Integer.parseInt(activePage) - 1) * 8;
        int endIndex = Math.min(startIndex + 8, allProducts.size());
        List<Product> productPage = allProducts.subList(startIndex, endIndex);
        // Gửi dữ liệu cho req
        req.setAttribute("activePage", activePage);
        req.setAttribute("pagination", pagination);
        req.setAttribute("productPage", productPage);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}