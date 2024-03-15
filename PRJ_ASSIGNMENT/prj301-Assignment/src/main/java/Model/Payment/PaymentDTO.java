/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Payment;

/**
 *
 * @author Acer
 */
public class PaymentDTO {
    private int PaymentID;
    private String PaymentName;

    public int getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(int PaymentID) {
        this.PaymentID = PaymentID;
    }

    public String getPaymentName() {
        return PaymentName;
    }

    public void setPaymentName(String PaymentName) {
        this.PaymentName = PaymentName;
    }
    
}
