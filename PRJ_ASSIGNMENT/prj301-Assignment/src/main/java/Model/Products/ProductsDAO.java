/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import prj301demo.utils.DBUtils;

/**
 *
 * @author HP
 */
public class ProductsDAO {
    public List<ProductsDTO> viewAllProduct(){
        List<ProductsDTO>  list = new ArrayList<ProductsDTO>();
        ProductsDTO product = null ;
        
        try {
                
            Connection con = DBUtils.getConnection();
            
            String sql = " SELECT ProductsID , ProductsName , Gender , Size , Color , ProductPrice FROM Products ";
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            
            if (rs!= null) {
                product = new ProductsDTO();
                if (rs.next()) {
                    product.setProductsID(rs.getInt("ProductsID"));
                    product.setProductsName(rs.getString("ProductsName"));
                    product.setGender(rs.getString("Gender"));
                    product.setSize(rs.getString("Size"));
                    product.setColor(rs.getString("Color"));
                    product.setProductPrice(rs.getFloat("ProductPrice"));

                   list.add(product);
                }
            }
            con.close();
                    
            
        } catch (Exception e) {
            System.out.println("ERROR IN SQL PRODUCTDAO"+e.getMessage());
            e.printStackTrace();
        }
                
                
    
        return list;
    }
}
