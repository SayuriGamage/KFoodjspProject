package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.koreanfoodjspproject.dao.impl.Userdaoimpl;
import lk.ijse.koreanfoodjspproject.entity.User;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user-login")
public class UserLoginServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Userdaoimpl userdaoimpl = new Userdaoimpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("loginEmail");
        String password = req.getParameter("loginPassword");

        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            resp.sendRedirect("admin/home.jsp");
        } else {
            boolean validUser = userdaoimpl.validUserCheck(email, dataSource);
            if (validUser) {
                User us = userdaoimpl.loginCheck(email, password, dataSource);

                if (us != null && us.getEmail().equals(email) && us.getPassword().equals(password)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("loginEmail", email);
                    resp.sendRedirect("customer/home.jsp");
                } else {
                    resp.setContentType("text/html");
                    resp.getWriter().println("<h3>User login failed. Please check your credentials.</h3>");
                }
            } else {
                resp.setContentType("text/html");
                resp.getWriter().println("<h3>User login failed. Email not found.</h3>");
            }
        }
    }
}
