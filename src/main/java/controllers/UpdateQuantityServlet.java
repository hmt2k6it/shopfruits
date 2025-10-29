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

@WebServlet("/updateQuantity")
public class UpdateQuantityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");

        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            if (quantity < 1) {
                quantity = 1; // Đảm bảo an toàn
            }

            HttpSession session = req.getSession(true);
            Account account = (Account) session.getAttribute("account");
            Dao dao = new Dao();

            if (account == null) {
                // --- Xử lý cho Khách (Guest) ---
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart != null) {
                    // (Bạn cần thêm hàm updateItemQuantity vào Cart.java)
                    cart.updateItemQuantity(productId, quantity);
                }
            } else {
                // --- Xử lý cho User đăng nhập ---
                // (Bạn cần thêm hàm updateCartItemQuantity vào Dao.java)
                dao.updateCartItemQuantity(account.getUserId(), productId, quantity);
            }

            // Trả về JSON báo thành công
            resp.getWriter().write("{\"status\": \"success\"}");

        } catch (Exception e) {
            e.printStackTrace();
            // Trả về JSON báo lỗi
            resp.getWriter().write("{\"status\": \"failed\"}");
        }
    }
}