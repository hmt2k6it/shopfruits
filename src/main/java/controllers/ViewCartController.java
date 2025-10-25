package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import models.Account;
import models.Cart;
@WebServlet(urlPatterns={"/viewCart"})
public class ViewCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        HttpSession session = req.getSession(true);
        Account account = (Account) session.getAttribute("account");
        Cart cart = null;
        if (account != null) {
            cart = dao.getCartByUserId(account.getUserId());
            session.setAttribute("cart", cart);
        } else {
            cart = (Cart) session.getAttribute("cart");
        }
        if (cart == null) {
            cart = new Cart();

        }
        req.setAttribute("cart", cart);
        req.getRequestDispatcher("views/cart.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
