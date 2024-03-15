/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Discount;

/**
 *
 * @author Acer
 */
public class DiscountDTO {
    private String DiscountID;
    private String DiscountName;
    private String DiscountPersent;

    public String getDiscountID() {
        return DiscountID;
    }

    public void setDiscountID(String DiscountID) {
        this.DiscountID = DiscountID;
    }

    public String getDiscountName() {
        return DiscountName;
    }

    public void setDiscountName(String DiscountName) {
        this.DiscountName = DiscountName;
    }

    public String getDiscountPersent() {
        return DiscountPersent;
    }

    public void setDiscountPersent(String DiscountPersent) {
        this.DiscountPersent = DiscountPersent;
    }
    
}
