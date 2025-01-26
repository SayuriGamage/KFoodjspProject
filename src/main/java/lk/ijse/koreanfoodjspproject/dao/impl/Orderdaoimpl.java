package lk.ijse.koreanfoodjspproject.dao.impl;

import lk.ijse.koreanfoodjspproject.entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Orderdaoimpl {


    public int getOrderId(String email, Connection connection) {
        try {
            PreparedStatement pstm=connection.prepareStatement("select orderId from orders where customerEmail=?");
            pstm.setString(1, email);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
return 0;
    }

    public List<Order> getAllOrders(Connection connection, String date) {
        List<Order> orders = new ArrayList<Order>();
        try {
            PreparedStatement pstm=connection.prepareStatement("select * from orders where orderDate=?");
            pstm.setString(1, date);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("orderId"));
                order.setCustomerEmail(rs.getString("customerEmail"));
                order.setOrderDate(rs.getString("orderDate"));
                order.setTotal(rs.getString("total"));
                order.setCard(rs.getString("card"));
                orders.add(order);
            }
            return orders;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
