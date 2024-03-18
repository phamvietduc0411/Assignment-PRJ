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

    public List<ProductsDTO> viewAllProduct() {
        List<ProductsDTO> list = new ArrayList<ProductsDTO>();
        ProductsDTO product = null;

        try {

            Connection con = DBUtils.getConnection();

            String sql = " SELECT ProductsID , ProductsName , Gender , Size , Color , ProductPrice FROM Products ";

            PreparedStatement stm = con.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            if (rs != null) {

                while (rs.next()) {
                    product = new ProductsDTO();
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
            System.out.println("ERROR IN SQL PRODUCTDAO" + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    public List<ProductsDTO> collection(String nameCollection, String gender) {
        List<ProductsDTO> listCollection = new ArrayList<ProductsDTO>();
        ProductsDTO collection = null;
        try {
            Connection con = DBUtils.getConnection();

            String sql = " SELECT ProductsID , ProductsName , Gender , Size ,Color ,ProductPrice , Img "
                    + "FROM Products "
                    + "INNER JOIN Category ON Products.CategoryId = Category.CategoryID "
                    + "WHERE Collections = ? AND Gender = ? ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, nameCollection);
            stm.setString(2, gender);

            ResultSet rs = stm.executeQuery();
            
            if (rs!= null) {
                while (rs.next()) {
                    collection = new ProductsDTO();
                    
                    collection.setProductsID(rs.getInt("ProductsID"));
                    collection.setProductsName(rs.getString("ProductsName"));
                    collection.setGender(rs.getString("Gender"));
                    collection.setSize(rs.getString("Size"));
                    collection.setColor(rs.getString("Color"));
                    collection.setProductPrice(rs.getFloat("ProductPrice"));
                    collection.setImg(rs.getString("Img"));
                    
                    listCollection.add(collection);
                }
            }
            
            con.close();
        } catch (Exception e) {
            System.out.println("ERROR  SQL WHEN QUERY COLLECTION" +  e.getMessage());
            e.printStackTrace();
        }
        return listCollection;
    }
}
