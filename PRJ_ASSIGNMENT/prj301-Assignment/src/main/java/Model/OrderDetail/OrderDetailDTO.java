/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.OrderDetail;

/**
 *
 * @author Acer
 */
public class OrderDetailDTO {
    private float Amount;
    private int TotalQuantity;
    private int OrdersId;
    private int PaysId;
    private int ProId;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(float Amount, int TotalQuantity, int OrdersId, int PaysId, int ProId) {
        this.Amount = Amount;
        this.TotalQuantity = TotalQuantity;
        this.OrdersId = OrdersId;
        this.PaysId = PaysId;
        this.ProId = ProId;
    }

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float Amount) {
        this.Amount = Amount;
    }

    public int getTotalQuantity() {
        return TotalQuantity;
    }

    public void setTotalQuantity(int TotalQuantity) {
        this.TotalQuantity = TotalQuantity;
    }

    public int getOrdersId() {
        return OrdersId;
    }

    public void setOrdersId(int OrdersId) {
        this.OrdersId = OrdersId;
    }

    public int getPaysId() {
        return PaysId;
    }

    public void setPaysId(int PaysId) {
        this.PaysId = PaysId;
    }

    public int getProId() {
        return ProId;
    }

    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    
}
