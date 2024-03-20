/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Cart;

import Model.CartItem.CartItemDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import prj301demo.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class CartDAO {

    public void addToCart(CartItemDTO cartItem) throws SQLException {
        
        try{
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO cartItem(ProId, quantity, cartID) VALUES (?, ?, ?) ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, cartItem.getProId());
            stmt.setInt(2, cartItem.getQuantity());
            stmt.setInt(3, cartItem.getCartID());
            stmt.executeUpdate();
            con.close();
        } catch(Exception ex){
            System.out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
        
    }
    
}
