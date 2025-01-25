package lk.ijse.koreanfoodjspproject.dao.impl;

import lk.ijse.koreanfoodjspproject.entity.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Userdaoimpl {
    public static List<User> getAllCustomers(Connection connection) {
        List<User> users = new ArrayList<>();
        String sql = "select * from users where role = 'customer'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));

                users.add(user);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    public User loginCheck(String email, String password, DataSource dataSource) {
        User use=null;

        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement ps=connection.prepareStatement("select * from users where email=? and password=?");
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
              use=new User();
              use.setId(rs.getInt("id"));
              use.setName(rs.getString("name"));
              use.setEmail(rs.getString("email"));
              use.setPassword(rs.getString("password"));
              use.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return use;
    }


    public boolean saveCustomer(User user, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("insert into users(name,email,password,role) values(?,?,?,?)");
            pstm.setString(1,user.getName());
            pstm.setString(2,user.getEmail());
            pstm.setString(3,user.getPassword());
            pstm.setString(4,user.getRole());
            int ft=pstm.executeUpdate();
           if(ft>0){
               return true;
           }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


    public User getUserName(Connection connection, String email) {
        try {
            PreparedStatement pstm=connection.prepareStatement("select * from users where email=?");
            pstm.setString(1,email);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
                User user=new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean saveCustomers(User user, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("insert into users(name,email,password,role) values(?,?,?,?)");
            pstm.setString(1,user.getName());
            pstm.setString(2,user.getEmail());
            pstm.setString(3,user.getPassword());
            pstm.setString(4,user.getRole());
            int ft=pstm.executeUpdate();
            if(ft>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean updateCustomer(User user, DataSource dataSource) {

        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("update users set name=?,email=?,password=?,role=? where id=?");
            pstm.setString(1,user.getName());
            pstm.setString(2,user.getEmail());
            pstm.setString(3,user.getPassword());
            pstm.setString(4,user.getRole());
            pstm.setInt(5,user.getId());
            int ft=pstm.executeUpdate();
            if(ft>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

       return false;
    }

    public boolean deleteCustomer(int id, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("delete from users where id=?");
            pstm.setInt(1,id);
            int ft=pstm.executeUpdate();
            if(ft>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean validUserCheck(String email, DataSource dataSource) {
        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("select * from users where email=?");
            pstm.setString(1, email);

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

}
