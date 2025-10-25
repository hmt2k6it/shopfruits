package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dao dao = new Dao();
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean userExists = dao.checkUser(username);

        if (userExists) {

            req.setAttribute("mess", "Tên đăng nhập này đã được sử dụng!");

            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);

        } else {

            dao.createAccount(username, password, email);
            HttpSession session = req.getSession();
            session.setAttribute("mess", "Đăng ký thành công! Vui lòng đăng nhập.");

            resp.sendRedirect("login");
        }
    }
}
