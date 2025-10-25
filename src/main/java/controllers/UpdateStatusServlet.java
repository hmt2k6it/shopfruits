package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Dao;

// URL này phải khớp với 'fetch' trong admin.js
@WebServlet("/updateStatus") 
public class UpdateStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        
        try {
            // 1. Lấy 2 tham số (parameters) từ body của fetch
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            String newStatus = req.getParameter("newStatus");

            // 2. Gọi hàm DAO để cập nhật database
            boolean success = dao.updateOrderStatus(orderId, newStatus);
            
            // 3. Phản hồi về cho JavaScript
            if (success) {
                // Gửi chữ "success"
                resp.getWriter().write("success");
            } else {
                // Gửi chữ "failed"
                resp.getWriter().write("failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Gửi "failed" nếu có lỗi (ví dụ: NumberFormatException)
            resp.getWriter().write("failed");
        }
    }
}