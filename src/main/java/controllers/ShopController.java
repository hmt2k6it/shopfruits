package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import models.Category;
import models.Product;
import models.Season;

@WebServlet(urlPatterns = { "/shop" })
public class ShopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        String activePage = req.getParameter("activePage");
        if (activePage == null) {
            activePage = "1";
        }
        String activeSeason = req.getParameter("activeSeason");
        String activeCate = req.getParameter("activeCate");
        // Lấy dữ liệu từ database
        List<Category> allCategories = dao.getAllCategory();
        List<Season> allSeasons = dao.getAllSeason();
        List<Product> products;
        if (activeSeason != null) {
            products = dao.getProductsBySeason(activeSeason);
        } else {
            if (activeCate == null) {
                products = dao.getAllProduct();
            } else {
                products = dao.getProductsByCategory(activeCate);
            }
        }
        // Xử lý logic
        int pagination = (int) Math.ceil((double) products.size() / 6);
        int startIndex = (Integer.parseInt(activePage) - 1) * 6;
        int endIndex = Math.min(startIndex + 6, products.size());
        List<Product> productPage = products.subList(startIndex, endIndex);
        // Đẩy dữ liệu lên jsp
        req.setAttribute("allCategories", allCategories);
        req.setAttribute("allSeasons", allSeasons);
        req.setAttribute("activePage", activePage);
        req.setAttribute("activeCate", activeCate);
        req.setAttribute("activeSeason", activeSeason);
        req.setAttribute("pagination", pagination);
        req.setAttribute("startIndex", startIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("productPage", productPage);
        req.setAttribute("totalProducts", products.size());

        req.getRequestDispatcher("/views/shop.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}