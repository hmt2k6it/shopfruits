package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

// Khai báo WebServlet và MultipartConfig
@WebServlet("/productCURD")
public class ProductCURDServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Dao dao = new Dao();

        // Lấy hành động (add, edit, delete) từ input ẩn
        String action = req.getParameter("action");

        if (action == null) {
            resp.sendRedirect("admin");
            return;
        }

        try {
            switch (action) {
                case "add":
                    addProduct(req, dao);
                    break;
                case "edit":
                    editProduct(req, dao);
                    break;
                case "delete":
                    deleteProduct(req, dao);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Có thể setAttribute lỗi ra trang admin
        }

        // Sau khi thực hiện xong, quay lại trang admin
        resp.sendRedirect("dashboard");
    }

    // --- Hàm xử lý THÊM ---
    private void addProduct(HttpServletRequest req, Dao dao) throws IOException, ServletException {
        String name = req.getParameter("productName");
        long price = Long.parseLong(req.getParameter("productPrice"));
        String desc = req.getParameter("productDescription");
        String categoryId = req.getParameter("categoryId");
        String seasonId = req.getParameter("seasonId");

        dao.addProduct(name, desc, price, categoryId, seasonId);
    }

    // --- Hàm xử lý SỬA ---
    private void editProduct(HttpServletRequest req, Dao dao) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("productName");
        long price = Long.parseLong(req.getParameter("productPrice"));
        String desc = req.getParameter("productDescription");
        String categoryId = req.getParameter("categoryId");
        String seasonId = req.getParameter("seasonId");

        dao.updateProduct(id, name, desc, price, categoryId, seasonId);
    }

    // --- Hàm xử lý XÓA ---
    private void deleteProduct(HttpServletRequest req, Dao dao) {
        int id = Integer.parseInt(req.getParameter("productId"));
        dao.deleteProduct(id);
    }
}