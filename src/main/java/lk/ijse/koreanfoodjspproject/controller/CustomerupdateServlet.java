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

@WebServlet("/updateCustomer")
public class CustomerupdateServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Userdaoimpl userdaoimpl = new Userdaoimpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         int id= Integer.parseInt(req.getParameter("customerId"));
         String name=req.getParameter("ucustomerName");
         String email=req.getParameter("ucustomerEmail");
         String password=req.getParameter("editCustomerPassword");

        User user=new User(id,name,email,password,"customer");
        boolean update=userdaoimpl.updateCustomer(user,dataSource);
        if(update){
            resp.sendRedirect("admin/customers.jsp");

        } else {
            resp.sendRedirect("admin/customers.jsp");
        }
    }
}
