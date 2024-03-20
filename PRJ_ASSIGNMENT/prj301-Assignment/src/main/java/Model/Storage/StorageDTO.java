/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Storage;

/**
 *
 * @author Acer
 */
public class StorageDTO {
    private int StorageID;
    private int AvailableQuantity;

    public int getStorageID() {
        return StorageID;
    }

    public void setStorageID(int StorageID) {
        this.StorageID = StorageID;
    }

    public int getAvailableQuantity() {
        return AvailableQuantity;
    }

    public void setAvailableQuantity(int AvailableQuantity) {
        this.AvailableQuantity = AvailableQuantity;
    }
    
}
