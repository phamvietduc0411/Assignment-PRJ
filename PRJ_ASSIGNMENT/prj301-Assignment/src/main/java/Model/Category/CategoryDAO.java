/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import prj301demo.utils.DBUtils;

/**
 *
 * @author HP
 */
public class CategoryDAO {
    public CategoryDTO load(int CategoryID) {

        String sql = "SELECT CategoryName , Img , Descriptions From Category WHERE CategoryID = ?  ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, CategoryID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                int categoryID = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");
                String img = rs.getString("Img");
                String  descriptions = rs.getString("Descriptions");
                
                CategoryDTO category = new CategoryDTO();

                category.setCategoryID(categoryID);
                category.setCategoryName(categoryName);
                category.setImg(img);
                category.setDescriptions(descriptions);
                
                return category;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
}
