/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Cart;

import Model.Cart.CartDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301demo.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class CartDAO {
    
    Connection con = DBUtils.getConnection();
    
    public List<CartDTO> getCartItemsByCustomerId(int customerId) throws SQLException {
        List<CartDTO> cartItems = new ArrayList<>();
        String query = "SELECT * FROM Cart WHERE CustomerId = ?";
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
        }
        return cartItems;
    }

    public void addToCart(CartDTO cartItem) throws SQLException {
        String query = "INSERT INTO Cart (CustomerId, ProId, Quantity) VALUES (?, ?, ?)";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, cartItem.getCustomerId());
            statement.setInt(2, cartItem.getProId());
            statement.setInt(3, cartItem.getQuantity());
            statement.executeUpdate();
        }
    }

    public void removeFromCart(int cartItemId) throws SQLException {
        String query = "DELETE FROM Cart WHERE CartId = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, cartItemId);
            statement.executeUpdate();
        }
    }

    public void updateCartItem(CartDTO cartItem) throws SQLException {
        String query = "UPDATE Cart SET Quantity = ? WHERE CartId = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, cartItem.getQuantity());
            statement.setInt(2, cartItem.getCartId());
            statement.executeUpdate();
        }
    }
    
}
