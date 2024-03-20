/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Cart;

import Model.Products.ProductsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import prj301demo.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class CartDAO {
    
    private Connection con = DBUtils.getConnection();

    // Thêm một mục vào giỏ hàng
    public void addToCart(int customerID , int productID ) {
        String query = "INSERT INTO cart (CustomerId, ProId, Quantity) VALUES (?, ?, 1 )";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, customerID);
            statement.setInt(2, productID);
            statement.executeUpdate();
        }catch (Exception e){
            System.out.println("ERRON IN ADD TO CARD" + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public List<ProductsDTO> viewCart(int customerId) {
    List<ProductsDTO> list = new ArrayList<>();
    ProductsDTO product = null;
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    try {
        con = DBUtils.getConnection();

        String sql = "SELECT p.Img, p.ProductsName, p.ProductPrice "
            + "FROM Products p INNER JOIN Cart c ON p.ProductsID = c.ProId "
            + "WHERE c.CustomerId = ?";
        
        stm = con.prepareStatement(sql);
        stm.setInt(1, customerId);

        rs = stm.executeQuery();

        while (rs.next()) {
            product = new ProductsDTO();
            product.setImg(rs.getString("Img"));
            product.setProductsName(rs.getString("ProductsName"));
            product.setProductPrice(rs.getFloat("ProductPrice"));
            list.add(product);
        }
    } catch (Exception e) {
        System.out.println("ERROR IN SQL PRODUCTDAO: " + e.getMessage());
        e.printStackTrace();
    }

    return list;
    }


    // Xóa một mục khỏi giỏ hàng
//    public void removeFromCart(int cartId) throws SQLException {
//        String query = "DELETE FROM cart WHERE CartId = ?";
//        try (PreparedStatement statement = connection.prepareStatement(query)) {
//            statement.setInt(1, cartId);
//            statement.executeUpdate();
//        }
//    }
    
}
