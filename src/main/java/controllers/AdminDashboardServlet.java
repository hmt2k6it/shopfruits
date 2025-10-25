package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import models.Account;
import models.Category;
import models.Product;
import models.Season;
import models.Order;

@WebServlet(urlPatterns = { "/dashboard" })
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Dao dao = new Dao();

        Account account = (Account) session.getAttribute("account");

        if (account == null || account.getIs_admin() != 1) {

            resp.sendRedirect("home");
            return;
        }

        List<Product> allProducts = dao.getAllProduct();
        List<Account> allUsers = dao.getAllUsers();
        List<Order> allOrders = dao.getAllOrders();
        List<Category> allCategories = dao.getAllCategory();
        List<Season> allSeasons = dao.getAllSeason();
        req.setAttribute("allCategories", allCategories);
        req.setAttribute("allSeasons", allSeasons);
        req.setAttribute("allProducts", allProducts);
        req.setAttribute("allUsers", allUsers);
        req.setAttribute("allOrders", allOrders);

        req.getRequestDispatcher("views/admin.jsp").forward(req, resp);
    }
}