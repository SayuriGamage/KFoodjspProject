package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl;
import lk.ijse.koreanfoodjspproject.entity.Product;

import javax.sql.DataSource;
import java.io.IOException;


@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Productdaoimpl productdaoimpl=new Productdaoimpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("did"));

      boolean isdelete= productdaoimpl.deleteProduct(id,dataSource);

      if(isdelete == true){
          resp.sendRedirect("admin/product.jsp");
      } else {
          resp.sendRedirect("admin/product.jsp");
      }
    }
}
