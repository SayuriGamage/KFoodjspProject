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


@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Productdaoimpl productdaoimpl=new Productdaoimpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("uid"));
        String name = req.getParameter("uname");
        String category = req.getParameter("ucategory");
        String price = req.getParameter("uprice");
        String image=req.getParameter("uimage");

        Product product=new Product(id,name,category,price,image);

        boolean isUpdate=productdaoimpl.updateProduct(product,dataSource);
        if(isUpdate == true){
            resp.sendRedirect("admin/product.jsp");
        } else {
            resp.sendRedirect("admin/product.jsp");
        }

    }
}
