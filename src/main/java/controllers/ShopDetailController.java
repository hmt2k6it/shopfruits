package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import models.Product;

@WebServlet(urlPatterns = { "/shopdetail" })
public class ShopDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        String productId = req.getParameter("productId");
        Product product = dao.getProductById(productId);
        if (product == null) {
            resp.sendRedirect("404");
        } else {
            req.setAttribute("product", product);
            req.getRequestDispatcher("views/shopdetail.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public static void main(String[] args) {
        Dao dao = new Dao();
        Product product = dao.getProductById("1");
        System.out.println(product);
    }
}
