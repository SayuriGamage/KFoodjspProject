package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/log-out")
public class logOutServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String userEmail = (String) session.getAttribute("loginEmail");
            Connection connection=dataSource.getConnection();
            PreparedStatement ps=connection.prepareStatement("delete from users where email=?");
            ps.setString(1,userEmail);
           int ft= ps.executeUpdate();
            if(ft>0){
                resp.sendRedirect("index.jsp");
            } else {
                resp.sendRedirect("customer/home.jsp");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
