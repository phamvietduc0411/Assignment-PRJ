/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.CheckOrder;

/**
 *
 * @author Acer
 */
public class CheckOrderDTO {
    
    private int ManagerId;
    private int OrdersId;

    public int getManagerId() {
        return ManagerId;
    }

    public void setManagerId(int ManagerId) {
        this.ManagerId = ManagerId;
    }

    public int getOrdersId() {
        return OrdersId;
    }

    public void setOrdersId(int OrdersId) {
        this.OrdersId = OrdersId;
    }
    
    
}
