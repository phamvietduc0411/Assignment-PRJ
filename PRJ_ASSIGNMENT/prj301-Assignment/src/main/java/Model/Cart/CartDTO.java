/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Cart;

import Model.CartItem.CartItemDTO;
import java.util.List;

/**
 *
 * @author DELL
 */
public class CartDTO {
    private int cartId;
    private int CustomerId;
    private List<CartItemDTO> cartItems;

    public CartDTO(int cartId, int CustomerId, List<CartItemDTO> cartItems) {
        this.cartId = cartId;
        this.CustomerId = CustomerId;
        this.cartItems = cartItems;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(int CustomerId) {
        this.CustomerId = CustomerId;
    }


    public List<CartItemDTO> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItemDTO> cartItems) {
        this.cartItems = cartItems;
    }
}
