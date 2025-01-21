package lk.ijse.koreanfoodjspproject.controller;


import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl;
import lk.ijse.koreanfoodjspproject.entity.Category;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/addCategory")
public class AddCategoryServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Categorydaoimpl categorydaoimpl=new Categorydaoimpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("categoryName");

      boolean isSave=categorydaoimpl.saveCategories(name,dataSource);
        if (isSave == true){
            resp.sendRedirect("admin/category.jsp");
        }else {
            resp.sendRedirect("admin/category.jsp");
        }

    }
}
