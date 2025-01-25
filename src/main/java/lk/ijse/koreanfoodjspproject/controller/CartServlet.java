package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.koreanfoodjspproject.dao.impl.Cartdaoimpl;
import lk.ijse.koreanfoodjspproject.dao.impl.Productdaoimpl;
import lk.ijse.koreanfoodjspproject.entity.Cart;
import lk.ijse.koreanfoodjspproject.entity.Product;

import javax.sql.DataSource;
import java.io.IOException;


@WebServlet(name = "CartServlet",value = "/cart")
public class CartServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("pro_id"));
       String email=req.getParameter("u_email");

        Productdaoimpl productdaoimpl=new Productdaoimpl();
        Product product=productdaoimpl.getProductdetails(id,dataSource);

        Cart c=new Cart();
        c.setPro_id(id);
        c.setU_email(email);
        c.setPro_name(product.getName());
        c.setPro_category(product.getCategory());
        c.setPro_price(product.getPrice());
        c.setImage(product.getImage());

        Cartdaoimpl cartdaoimpl=new Cartdaoimpl();
        boolean f=cartdaoimpl.addCart(c,dataSource);
        HttpSession session=req.getSession();

        if (f){
           session.setAttribute("addCart","add to cart");
           resp.sendRedirect("customer/home.jsp");
        }else {
            session.setAttribute("addCart","add to cart");
            resp.sendRedirect("customer/home.jsp");
        }
    }
}
