package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.koreanfoodjspproject.dao.impl.Userdaoimpl;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/deleteCustomer")
public class CustomerdeleteServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Userdaoimpl userdaoimpl=new Userdaoimpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          int id=Integer.parseInt(req.getParameter("customerId"));

          boolean delete=userdaoimpl.deleteCustomer(id,dataSource);
          if(delete == true){
              resp.sendRedirect("admin/customers.jsp");
          }else {
              resp.sendRedirect("admin/customers.jsp");
          }
    }
}
