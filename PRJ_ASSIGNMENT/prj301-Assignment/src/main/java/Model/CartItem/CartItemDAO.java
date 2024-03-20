/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.CartItem;

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
public class CartItemDAO {
    
    public List<CartItemDTO> getCartItems(int cartId) throws SQLException {
        List<CartItemDTO> cartItems = new ArrayList<>();
        Connection con = DBUtils.getConnection();
        String sql = " SELECT * FROM cartItem WHERE cartID = ? ";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, cartId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    CartItemDTO cartItem = new CartItemDTO();
                    cartItem.setItemId(resultSet.getInt("itemId"));
                    cartItem.setProId(resultSet.getInt("ProId"));
                    cartItem.setQuantity(resultSet.getInt("quantity"));
                    cartItem.setCartID(resultSet.getInt("cartID"));
                    cartItems.add(cartItem);
                }
            }
        }
        return cartItems;
    }
    
}
