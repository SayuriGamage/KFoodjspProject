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

@WebServlet("/addCustomer")
public class CustomersAddServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Userdaoimpl userdaoimpl=new Userdaoimpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("customerName");
        String email=req.getParameter("customerEmail");
        String password=req.getParameter("customerPassword");

        User user=new User(name,email,password,"customer");
        boolean save=userdaoimpl.saveCustomers(user,dataSource);
        if(save){
            resp.sendRedirect("admin/customers.jsp");
        } else {
            resp.sendRedirect("admin/customers.jsp");
        }
    }
}
