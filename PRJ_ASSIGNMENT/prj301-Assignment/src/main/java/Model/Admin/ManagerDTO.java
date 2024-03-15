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
    private String username;
    private String password;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
