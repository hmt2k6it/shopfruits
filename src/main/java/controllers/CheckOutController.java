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

@WebServlet(urlPatterns = { "/checkout" })
public class CheckOutController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(true);
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            resp.sendRedirect("login");
            return;
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect("viewCart");
            return;
        }
        String shippingAddress = req.getParameter("shippingAddress");
        String shippingPhone = req.getParameter("shippingPhone");
        String paymentMethod = req.getParameter("paymentMethod");
        shippingAddress = shippingAddress + " " + shippingPhone;
        Dao dao = new Dao();
        boolean confirm = dao.confirmOrder(account, cart, shippingAddress, paymentMethod);
        if (confirm) {
            session.removeAttribute("cart");
            resp.sendRedirect("viewCart");
        } else {
            resp.sendRedirect("viewCart");
        }
    }
}
