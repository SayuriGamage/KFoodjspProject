package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.koreanfoodjspproject.dao.impl.Categorydaoimpl;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/deleteCategory")
public class DeleteCategoryServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    Categorydaoimpl categorydaoimpl=new Categorydaoimpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("Id"));

        boolean delete=categorydaoimpl.deletecategory(id,dataSource);
        if(delete == true){
            resp.sendRedirect("admin/category.jsp");
        } else {
            resp.sendRedirect("admin/category.jsp");
        }
    }
}
