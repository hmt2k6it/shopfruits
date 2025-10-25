package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson; // <-- CẦN THƯ VIỆN GSON
import dao.Dao;
import models.OrderDetail; // Import model của bạn

@WebServlet("/getOrderDetails") // URL mà JS gọi
public class GetOrderDetailsServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        Dao dao = new Dao();
        
        try {
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            
            // 1. Gọi hàm DAO
            List<OrderDetail> details = dao.getOrderDetailsById(orderId);
            
            // 2. Dùng Gson để chuyển List thành chuỗi JSON
            String json = new Gson().toJson(details);
            
            // 3. Gửi JSON về cho JavaScript
            resp.getWriter().write(json);
            
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu lỗi, gửi về một mảng JSON rỗng
            resp.getWriter().write("[]"); 
        }
    }
}