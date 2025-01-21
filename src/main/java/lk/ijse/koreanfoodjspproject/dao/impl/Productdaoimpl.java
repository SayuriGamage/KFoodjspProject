package lk.ijse.koreanfoodjspproject.dao.impl;

import lk.ijse.koreanfoodjspproject.entity.Product;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Productdaoimpl {
    public List<Product> getAllProducts(Connection connection) {
        List<Product> products = new ArrayList<Product>();
        String sql = "select * from product";
        try {
            PreparedStatement pst=connection.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getString("price"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }


    public boolean saveProduct(Product product, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("insert into product(name,category,price,image) values(?,?,?,?)");
            pstm.setString(1,product.getName());
            pstm.setString(2,product.getCategory());
            pstm.setString(3,product.getPrice());
            pstm.setString(4,product.getImage());
            int ft=pstm.executeUpdate();
            if (ft>0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


    public boolean updateProduct(Product product, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            String sql="UPDATE product SET name=?, category=?,price=?, image=? WHERE id = ?";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,product.getName());
            pstm.setString(2,product.getCategory());
            pstm.setString(3,product.getPrice());
            pstm.setString(4,product.getImage());
            pstm.setInt(5,product.getId());
            int ft=pstm.executeUpdate();
            if (ft>0) {
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean deleteProduct(int id, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            String sql="delete from product where id = ?";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setInt(1,id);
            int ft=pstm.executeUpdate();
            if (ft>0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
