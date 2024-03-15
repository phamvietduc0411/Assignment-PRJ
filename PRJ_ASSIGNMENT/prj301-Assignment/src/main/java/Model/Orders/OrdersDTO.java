/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Orders;
import java.sql.Date;

/**
 *
 * @author Acer
 */
public class OrdersDTO {
    private int OrdersID;
    private Date OrdersDate;
    private float Price;
    private String Address;
    private String Status;
    private String Freight;

    public int getOrdersID() {
        return OrdersID;
    }

    public void setOrdersID(int OrdersID) {
        this.OrdersID = OrdersID;
    }

    public Date getOrdersDate() {
        return OrdersDate;
    }

    public void setOrdersDate(Date OrdersDate) {
        this.OrdersDate = OrdersDate;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getFreight() {
        return Freight;
    }

    public void setFreight(String Freight) {
        this.Freight = Freight;
    }
    
}
