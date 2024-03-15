/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Brands;

/**
 *
 * @author HP
 */
public class BrandsDTO {
    private int BrandID;
    private String BrandName;
    private String Contacts;
    private String Region;
    private String Address;

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getContacts() {
        return Contacts;
    }

    public void setContacts(String Contacts) {
        this.Contacts = Contacts;
    }

    public String getRegion() {
        return Region;
    }

    public void setRegion(String Region) {
        this.Region = Region;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
}
