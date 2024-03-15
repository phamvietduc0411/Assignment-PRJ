/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Products;

/**
 *
 * @author Acer
 */
public class ProductsDTO {
    private int ProductsID;
    private String ProductsName;
    private String Gender;
    private String Collections;
    private String Size;
    private String Color;
    private float ProductPrice;
    private int StorageId;
    private int CategoryId;
    private int BrandsId;

    public int getProductsID() {
        return ProductsID;
    }

    public void setProductsID(int ProductsID) {
        this.ProductsID = ProductsID;
    }

    public String getProductsName() {
        return ProductsName;
    }

    public void setProductsName(String ProductsName) {
        this.ProductsName = ProductsName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getCollections() {
        return Collections;
    }

    public void setCollections(String Collections) {
        this.Collections = Collections;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public float getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(float ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public int getStorageId() {
        return StorageId;
    }

    public void setStorageId(int StorageId) {
        this.StorageId = StorageId;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public int getBrandsId() {
        return BrandsId;
    }

    public void setBrandsId(int BrandsId) {
        this.BrandsId = BrandsId;
    }

}
