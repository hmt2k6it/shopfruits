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
        ArrayList<Product> allProducts = dao.getAllProduct();
        ArrayList<Product> vegetableProducts = dao.getVegetableProducts();
        ArrayList<Product> fruitProducts = dao.getFruitProducts();
        ArrayList<Product> breadProducts = dao.getBreadProducts();
        ArrayList<Product> meatProducts = dao.getMeatProducts();
        req.setAttribute("allProducts", allProducts);
        req.setAttribute("vegetableProducts", vegetableProducts);
        req.setAttribute("fruitProducts", fruitProducts);
        req.setAttribute("breadProducts", breadProducts);
        req.setAttribute("meatProducts", meatProducts);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
