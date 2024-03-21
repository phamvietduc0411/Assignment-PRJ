/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Cart;

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

//     Lấy tất cả các mục trong giỏ hàng cho một khách hàng cụ thể
    public List<CartDTO> getCartItemsByCustomerId(int customerId){
        List<CartDTO> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE CustomerId = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, customerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    CartDTO cartItem = new CartDTO();
                    cartItem.setCartId(resultSet.getInt("CartId"));
                    cartItem.setCustomerId(resultSet.getInt("CustomerId"));
                    cartItem.setProId(resultSet.getInt("ProId"));
                    cartItem.setQuantity(resultSet.getInt("Quantity"));
                    cartItems.add(cartItem);
                }
            }
        } catch(Exception e){
            System.out.println("ERROR: " + e.getMessage());
            e.printStackTrace();
        }
        return cartItems;
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
