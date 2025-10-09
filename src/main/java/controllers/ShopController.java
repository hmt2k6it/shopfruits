package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import models.Category;
import models.Product;

@WebServlet(urlPatterns = { "/shop" })
public class ShopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "shop";
        req.setAttribute("page", page);
        Dao dao = new Dao();
        Map<String, Integer> categoryWithSize = dao.getCategoryWithSize();
        List<Category> allCategories = dao.getAllCategory();
        String activeCategory = req.getParameter("activeCategory");
        if (activeCategory == null || "0".equals(activeCategory)) {
            activeCategory = "1";
        }
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
        int totalPages = (int) Math.ceil((double) totalProducts / 12);
        int startIndex = (currentPage - 1) * 12;
        int endIndex = Math.min(startIndex + 12, totalProducts);
        List<Product> pageProducts = new ArrayList<>(currentCategoryProducts.subList(startIndex, endIndex));
        req.setAttribute("pageProducts", pageProducts);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("categoryWithSize", categoryWithSize);
        req.setAttribute("allCategories", allCategories);
        req.setAttribute("activeCategory", activeCategory);
        req.setAttribute("currentPage", currentPage);
        req.getRequestDispatcher("/views/shop.jsp").forward(req, resp);
    }

}