package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Dao;

@WebServlet("/userCURD")
public class UserCURDServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Dao dao = new Dao();

        try {
            if ("delete".equals(action)) {
                // --- Logic Xóa (đã có) ---
                int userId = Integer.parseInt(req.getParameter("userId"));
                dao.deleteUser(userId);

            } else if ("editRole".equals(action)) {
                // --- (THÊM MỚI) Logic Sửa Quyền ---
                int userId = Integer.parseInt(req.getParameter("userId"));
                int isAdmin = Integer.parseInt(req.getParameter("isAdmin")); // Lấy 0 hoặc 1
                
                dao.updateUserRole(userId, isAdmin); // Gọi hàm DAO mới
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Quay lại trang dashboard (URL của AdminDashboardServlet)
        resp.sendRedirect("dashboard");
    }
}