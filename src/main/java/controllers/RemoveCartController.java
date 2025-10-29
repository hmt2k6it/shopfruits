package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; // <-- (Thêm WebServlet)
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import models.Account;
import models.Cart;

@WebServlet("/removeFromCart") // <-- (Thêm URL, phải khớp với link Xóa trong JSP)
public class RemoveCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productIdStr = req.getParameter("productId"); // Đổi tên biến
        HttpSession session = req.getSession(true);
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");

        int productId = 0; // Biến để lưu ID sau khi chuyển đổi

        // SỬA LỖI 2: Kiểm tra và chuyển đổi ID sang int một cách an toàn
        if (productIdStr == null || productIdStr.isEmpty()) {
            resp.sendRedirect("viewCart");
            return;
        }

        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            // Nếu productId không phải là số
            e.printStackTrace();
            resp.sendRedirect("viewCart");
            return;
        }

        // --- Bắt đầu logic ---
        if (account == null) {
            // ----- Logic cho Khách (Guest) -----

            // Phải kiểm tra cart != null cho Guest
            if (cart != null) {
                // SỬA LỖI 1: Gọi hàm deleteItem với 'int'
                cart.deleteItem(productIdStr);
            }
        } else {
            // ----- Logic cho User đã đăng nhập -----
            Dao dao = new Dao();
            dao.removeItemFromCart(account.getUserId(), productId);
        }

        resp.sendRedirect("viewCart");
    }
}