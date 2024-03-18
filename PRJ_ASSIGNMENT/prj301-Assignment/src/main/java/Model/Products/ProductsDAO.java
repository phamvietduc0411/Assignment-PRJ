/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301demo.utils.DBUtils;
import Model.Products.ProductsDTO;
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

    public List<ProductsDTO> collection(String nameCollection) {
        List<ProductsDTO> listCollection = new ArrayList<ProductsDTO>();
        ProductsDTO collection = null;
        try {
            
        } catch (Exception e) {
        }
        return listCollection;
    }
    public List<ProductsDTO> SearchProByName(String ProductsName) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ProductsDTO> result = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT ProductsID, ProductsName, Gender, Size, Color, ProductPrice, Img "
                        + "FROM Products "
                        + "WHERE ProductsName LIKE ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + ProductsName + "%");
                rs = stm.executeQuery();
                while(rs.next()){
                    if(result == null){
                        result = new ArrayList<ProductsDTO>();
                    }
                    ProductsDTO dto = new ProductsDTO();
                    dto.setProductsID(rs.getInt("ProductsID"));
                    dto.setProductsName("ProductsName");
                    dto.setGender("Gender");
                    dto.setSize("Size");
                    dto.setColor("Color");
                    dto.setProductPrice(rs.getFloat("ProductPrice"));
                    dto.setI
                    
                    
                }
            }
        } finally {

        }
    }
}
