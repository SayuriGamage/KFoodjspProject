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


@WebServlet(name = "AddProductServlet",value = "/product")

public class AddProductServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Productdaoimpl productdaoimpl=new Productdaoimpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String category = req.getParameter("category");
        String price = req.getParameter("price");
        String image=req.getParameter("images");

        Product product=new Product(name,category,price,image);
        boolean save=productdaoimpl.saveProduct(product,dataSource);
        if(save == true){
            resp.sendRedirect("admin/home.jsp");
        }else {
            resp.sendRedirect("admin/product.jsp");
        }
    }
}
