package lk.ijse.koreanfoodjspproject.dao.impl;

import lk.ijse.koreanfoodjspproject.entity.Category;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Categorydaoimpl {
    public List<Category> getAllCategories(Connection connection) {
        List<Category> categories = new ArrayList<Category>();
        String sql = "select * from category";

        try {
            PreparedStatement pstm=connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                categories.add(category);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }

    public boolean saveCategories(String name, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("insert into category(name) values(?)");
            pstm.setString(1, name);
            int ft=pstm.executeUpdate();
            if (ft>0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean updateCategories(int id, String categoryName, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("update category set name=? where id=?");
            pstm.setString(1, categoryName);
            pstm.setInt(2, id);
            int ft=pstm.executeUpdate();
            if (ft>0) {
                return true;
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean deletecategory(int id, DataSource dataSource) {
        try {
            Connection connection=dataSource.getConnection();
            PreparedStatement pstm=connection.prepareStatement("delete from category where id=?");
            pstm.setInt(1, id);
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
