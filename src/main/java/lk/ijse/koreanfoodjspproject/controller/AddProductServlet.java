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
        String name = req.getParameter("pname");
        String category = req.getParameter("category");
        String price = req.getParameter("price");
        String image=req.getParameter("images");

        System.out.println(name+" "+category+" "+price+" "+image);

        Product product=new Product(name,category,price,image);
        boolean save=productdaoimpl.saveProduct(product,dataSource);
        if(save == true){
            resp.sendRedirect("admin/product.jsp");
        }else {
            resp.sendRedirect("admin/product.jsp");
        }
    }
}
/*
package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.koreanfoodjspproject.entity.Product;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddProductServlet", value = "/product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class AddProductServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    private static final String UPLOAD_DIR = "product_images"; // Directory to save images

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost in ProductServlet");

        // Get form data
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String category = req.getParameter("category");


        // Handle file upload
        Part filePart = req.getPart("images");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        if (fileName != null && !fileName.isEmpty()) {
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath); // Save file on server

            try (Connection connection = dataSource.getConnection()) {
                String sql = "INSERT INTO product (name, category,price, image) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                    stmt.setString(1, name);
                    stmt.setString(3, category);
                    stmt.setString(2, price);
                    stmt.setString(4,"../"+ UPLOAD_DIR + "/" + fileName);

                    int result = stmt.executeUpdate();
                    if (result > 0) {
                        resp.sendRedirect("admin/product.jsp?success=Product saved successfully");
                    } else {
                        resp.sendRedirect("admin/product.jsp?error=Failed to save product");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("admin/product.jsp?error=Database error");
            }
        } else {
            resp.sendRedirect("admin/product.jsp?error=Image upload failed");
        }
    }

}

*/
