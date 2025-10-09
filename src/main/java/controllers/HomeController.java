package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import models.Product;

@WebServlet(urlPatterns = { "/" })
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "home";
        req.setAttribute("page", page);
        Dao dao = new Dao();
        String activeCategory = req.getParameter("activeCategory");
        if (activeCategory == null)
            activeCategory = "0";
        String activePage = req.getParameter("activePage");
        int currentPage = 1;
        if (activePage != null) {
            try {
                currentPage = Integer.parseInt(activePage);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }
        List<Product> currentCategoryProducts = dao.getProductsByCategory(Integer.parseInt(activeCategory));
        int totalProducts = currentCategoryProducts.size();
        int totalPages = (int) Math.ceil((double) totalProducts / 8);
        int startIndex = (currentPage - 1) * 8;
        int endIndex = Math.min(startIndex + 8, totalProducts);
        List<Product> pageProducts = new ArrayList<>(currentCategoryProducts.subList(startIndex, endIndex));
        req.setAttribute("activeCategory", activeCategory);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("pageProducts", pageProducts);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}