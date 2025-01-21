package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.koreanfoodjspproject.dao.impl.Userdaoimpl;
import lk.ijse.koreanfoodjspproject.entity.User;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/customer-registration")
public class CustomerRegistrationServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    Userdaoimpl userdaoimpl=new Userdaoimpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String password=req.getParameter("Password");

        User user=new User(name,email,password,"customer");

        boolean isSave=userdaoimpl.saveCustomer(user,dataSource);
        if(isSave == true){
            resp.sendRedirect("index.jsp");
        } else {
            resp.sendRedirect("index.jsp");
        }

    }
}
