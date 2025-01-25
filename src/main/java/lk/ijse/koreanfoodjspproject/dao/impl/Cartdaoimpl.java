package lk.ijse.koreanfoodjspproject.dao.impl;

import lk.ijse.koreanfoodjspproject.entity.Cart;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Cartdaoimpl {


    public boolean addCart(Cart c, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            String sql="insert into cart(pro_id,u_email,pro_name,pro_category,pro_price,image) values(?,?,?,?,?,?)";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setInt(1, c.getPro_id());
            preparedStatement.setString(2, c.getU_email());
            preparedStatement.setString(3, c.getPro_name());
            preparedStatement.setString(4, c.getPro_category());
            preparedStatement.setString(5, c.getPro_price());
            preparedStatement.setString(6, c.getImage());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Cart> loadCartTable(Connection connection, String userEmail) {
        List<Cart> cartList = new ArrayList<>();
        String sql = "select * from cart where u_email=?";
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, userEmail);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Cart cart = new Cart();
                cart.setPro_id(rs.getInt("pro_id"));
                cart.setU_email(rs.getString("u_email"));
                cart.setPro_name(rs.getString("pro_name"));
                cart.setPro_category(rs.getString("pro_category"));
                cart.setPro_price(rs.getString("pro_price"));
                cart.setImage(rs.getString("image"));
                cartList.add(cart);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstm != null) pstm.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return cartList;
    }

    public List<Cart> getCar(Connection connection, String email) {
        try {
            PreparedStatement pstm=connection.prepareStatement("select * from cart where u_email=?");
            pstm.setString(1, email);
            ResultSet rs=pstm.executeQuery();
            List<Cart> cartList = new ArrayList<>();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setPro_id(rs.getInt("pro_id"));
                cart.setU_email(rs.getString("u_email"));
                cart.setPro_name(rs.getString("pro_name"));
                cart.setPro_category(rs.getString("pro_category"));
                cart.setPro_price(rs.getString("pro_price"));
                cart.setImage(rs.getString("image"));
                cartList.add(cart);
            }
            return cartList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void clearCart(Connection connection, String email) {
        try {
            PreparedStatement pstm=connection.prepareStatement("DELETE FROM cart WHERE u_email = ?");
            pstm.setString(1, email);
            pstm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
