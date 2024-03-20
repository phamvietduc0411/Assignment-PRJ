/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.CartItem;

/**
 *
 * @author DELL
 */
public class CartItemDTO {
    private int itemId;
    private int quantity;
    private int ProId;
    private int cartID;

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProId() {
        return ProId;
    }

    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    
}
