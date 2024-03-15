/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Category;

/**
 *
 * @author Acer
 */
public class CategoryDTO {
    private int CategoryID;
    private String CategoryName;
    private String Img;
    private String Descriptions;

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public String getDescriptions() {
        return Descriptions;
    }

    public void setDescriptions(String Descriptions) {
        this.Descriptions = Descriptions;
    }
    
}
