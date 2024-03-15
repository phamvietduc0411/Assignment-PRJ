/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Admin;

/**
 *
 * @author Acer
 */
public class ManagerDTO {
    private int ManagerID;
    private String ManagerUsername;
    private String ManagerPassword;
    private String Managername;
    private String Phone;
    private String Address;
    private String Email;

    public int getManagerID() {
        return ManagerID;
    }

    public void setManagerID(int ManagerID) {
        this.ManagerID = ManagerID;
    }

    public String getManagerUsername() {
        return ManagerUsername;
    }

    public void setManagerUsername(String ManagerUsername) {
        this.ManagerUsername = ManagerUsername;
    }

    public String getManagerPassword() {
        return ManagerPassword;
    }

    public void setManagerPassword(String ManagerPassword) {
        this.ManagerPassword = ManagerPassword;
    }

    public String getManagername() {
        return Managername;
    }

    public void setManagername(String Managername) {
        this.Managername = Managername;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    
    
}
