package lk.ijse.koreanfoodjspproject.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
