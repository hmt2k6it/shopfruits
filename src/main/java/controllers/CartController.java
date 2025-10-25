package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;
import models.Cart;
import models.Product;
import dao.Dao;

@WebServlet(urlPatterns = { "/cart" })
public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        HttpSession session = req.getSession(true);

        String productId = req.getParameter("productId");
        int quantity = 1;

        Product product = dao.getProductById(productId);
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int userId = account.getUserId();
            dao.addProductToCart(userId, product.getProductId(), quantity);

        } else {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            cart.addItem(product, quantity);

            // Cập nhật lại giỏ hàng vào session
            session.setAttribute("cart", cart);
        }

        // 5. Chuyển hướng người dùng (Redirect)
        // Về trang chủ hoặc trang sản phẩm (tốt hơn là trang vừa gửi request)
        String referer = req.getHeader("Referer"); // Lấy URL của trang trước đó
        if (referer != null && !referer.isEmpty()) {
            resp.sendRedirect(referer);
        } else {
            // Dự phòng nếu không lấy được
            resp.sendRedirect("home");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Gọi doPost để xử lý cho cả 2 phương thức GET và POST
        // (Nên dùng POST cho hành động "thêm", nhưng GET cũng hoạt động)
        doPost(req, resp);
    }
}