/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Products;

import Model.Category.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301demo.utils.DBUtils;
import Model.Products.ProductsDTO;
import Model.Storage.StorageDTO;

/**
 *
 * @author HP
 */
public class ProductsDAO {

    public List<ProductsDTO> viewAllProduct() {
        List<ProductsDTO> list = new ArrayList<ProductsDTO>();
        ProductsDTO product = null;

        try {

            Connection con = DBUtils.getConnection();

            String sql = " SELECT ProductsID , ProductsName , Gender , Size , Color , ProductPrice ,StorageId,CategoryId FROM Products WHERE Size = 'M' ";

            PreparedStatement stm = con.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            if (rs != null) {

                while (rs.next()) {
                    product = new ProductsDTO();
                    product.setProductsID(rs.getInt("ProductsID"));
                    product.setProductsName(rs.getString("ProductsName"));
                    product.setGender(rs.getString("Gender"));
                    product.setSize(rs.getString("Size"));
                    product.setColor(rs.getString("Color"));
                    product.setProductPrice(rs.getFloat("ProductPrice"));
                    product.setStorageId(rs.getInt("StorageId"));
                    product.setCategoryId(rs.getInt("CategoryId"));
                    list.add(product);
                }
            }
            con.close();

        } catch (Exception e) {
            System.out.println("ERROR IN SQL PRODUCTDAO" + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }
    
    
    public ProductsDTO productDetails(String productid) {
        
        ProductsDTO product = null;

        try {

            Connection con = DBUtils.getConnection();

            String sql = " SELECT ProductsID , ProductsName , Gender , Size,Img , Color , ProductPrice ,StorageId,CategoryId FROM Products WHERE ProductsID = ?  ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, productid);
            ResultSet rs = stm.executeQuery();
            
            

            if (rs != null) {

                while (rs.next()) {
                    product = new ProductsDTO();
                    product.setProductsID(rs.getInt("ProductsID"));
                    product.setProductsName(rs.getString("ProductsName"));
                    product.setGender(rs.getString("Gender"));
                    product.setSize(rs.getString("Size"));
                    product.setColor(rs.getString("Color"));
                    product.setProductPrice(rs.getFloat("ProductPrice"));
                    product.setStorageId(rs.getInt("StorageId"));
                    product.setCategoryId(rs.getInt("CategoryId"));
                    product.setImg(rs.getString("Img"));
                   
                }
            }
            con.close();

        } catch (Exception e) {
            System.out.println("ERROR IN SQL PRODUCTDAO" + e.getMessage());
            e.printStackTrace();
        }

        return product;
    }
    
public List<ProductsDTO> findProductsByKeyword(String keyword) {
    List<ProductsDTO> productList = new ArrayList<>();

    try {
        Connection con = DBUtils.getConnection();
        String sql = "SELECT ProductsID, ProductsName,Img ,Gender, Size, Color, ProductPrice, StorageId, CategoryId " +
                     "FROM Products " +
                     "WHERE ProductsName LIKE ?  AND Size = 'M'";

        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, "%" + keyword + "%");

        ResultSet rs = stm.executeQuery();

        while (rs.next()) {
            ProductsDTO product = new ProductsDTO();
            product.setProductsID(rs.getInt("ProductsID"));
            product.setProductsName(rs.getString("ProductsName"));
            product.setGender(rs.getString("Gender"));
            product.setSize(rs.getString("Size"));
            product.setColor(rs.getString("Color"));
            product.setProductPrice(rs.getFloat("ProductPrice"));
            product.setStorageId(rs.getInt("StorageId"));
            product.setCategoryId(rs.getInt("CategoryId"));
            product.setImg(rs.getString("Img"));
            productList.add(product);
            System.out.println("-------"+productList.size());
        }

        con.close();
    } catch (Exception e) {
        System.out.println("Error occurred while executing SQL query: " + e.getMessage());
        e.printStackTrace();
    }

    return productList;
}



    public List<ProductsDTO> collection(String nameCollection, String gender) {

        List<ProductsDTO> listCollection = new ArrayList<ProductsDTO>();
        ProductsDTO collection = null;
        try {
            Connection con = DBUtils.getConnection();

            String sql = " SELECT ProductsID , ProductsName , Gender , Size ,Color ,ProductPrice , Img "
                    + "FROM Products "
                    + "INNER JOIN Category ON Products.CategoryId = Category.CategoryID "
                    + "WHERE Collections = ? AND Gender = ?  AND Size = 'M' ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, nameCollection);
            stm.setString(2, gender);

            ResultSet rs = stm.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    collection = new ProductsDTO();
                    collection.setProductsID(rs.getInt("ProductsID"));
                    collection.setProductsName(rs.getString("ProductsName"));
                    collection.setGender(rs.getString("Gender"));
                    collection.setSize(rs.getString("Size"));
                    collection.setColor(rs.getString("Color"));
                    collection.setProductPrice(rs.getFloat("ProductPrice"));
                    collection.setImg(rs.getString("Img"));

                    listCollection.add(collection);
                }
            }
            con.close();

        } catch (Exception e) {
            System.out.println("ERROR  SQL WHEN QUERY COLLECTION" + e.getMessage());
            e.printStackTrace();
        }
        return listCollection;
    }

    public List<ProductsDTO> SearchProByName(String keyword) {
        List<ProductsDTO> list = new ArrayList<ProductsDTO>();
        ProductsDTO product = null;
        try {
            Connection con = con = DBUtils.getConnection();

            String sql = "SELECT ProductsID, ProductsName, Gender, Size, Color, ProductPrice, Img "
                    + "FROM Products "
                    + "WHERE ProductsName LIKE  ?  AND Size = 'M'  ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, "%" + keyword + "%");

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                ProductsDTO dto = new ProductsDTO();
                dto.setProductsID(rs.getInt("ProductsID"));
                dto.setProductsName(rs.getString("ProductsName"));
                dto.setGender(rs.getString("Gender"));
                dto.setSize(rs.getString("Size"));
                dto.setColor(rs.getString("Color"));
                dto.setProductPrice(rs.getFloat("ProductPrice"));
                dto.setImg(rs.getString("Img"));

                list.add(dto);

            }
        } catch (Exception e) {
            System.out.println("ERROR IN SQL WHEN SEARCH" + e.getMessage());
            e.printStackTrace();
        }
        return list;

    }

    public void Insert(ProductsDTO product, StorageDTO storage, CategoryDTO category) {
        insertProduct(product);
        insertStorage(storage);
        insertCategory(category);
    }

    private void insertProduct(ProductsDTO product) {

        String sql = "INSERT INTO Products (ProductsID, ProductsName, Gender, Size, Color, ProductPrice, Img, StorageId, CategoryId)\n"
                + "VALUES ((SELECT ISNULL(MAX(ProductsID), 0) FROM Products) + 1, ?, ? , ? ,? , ? , ? ,"
                + "        (SELECT ISNULL(MAX(StorageID), 0) FROM Storage), \n"
                + "        (SELECT ISNULL(MAX(CategoryID), 0) FROM Category)); ";
        try {

            Connection con = DBUtils.getConnection();
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, product.getProductsName());
            stm.setString(2, product.getGender());
            stm.setString(3, product.getSize());
            stm.setString(4, product.getColor());
            stm.setFloat(5, product.getProductPrice());
            stm.setString(6, product.getImg());

            stm.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            System.out.println("Insert PRODUCT error!" + ex.getMessage());
            ex.printStackTrace();
        }

    }

    private void insertStorage(StorageDTO storage) {

        String sql = "INSERT INTO Storage (StorageID, AvailableQuantity)"
                + "VALUES ((SELECT ISNULL(MAX(StorageID), 0) FROM Storage) + 1, ? );";
        try {

            Connection con = DBUtils.getConnection();
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, storage.getAvailableQuantity());

            stm.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            System.out.println("Insert StorageDTO error!" + ex.getMessage());
            ex.printStackTrace();
        }

    }

    private void insertCategory(CategoryDTO category) {

        String sql = "INSERT INTO Category (CategoryID, CategoryName, Collections, Descriptions)\n"
                + "VALUES ((SELECT ISNULL(MAX(CategoryID), 0) FROM Category) + 1, ? , ? , ? );";
        try {

            Connection con = DBUtils.getConnection();
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, category.getCategoryName());
            stm.setString(2, category.getCollections());
            stm.setString(3, category.getDescriptions());

            stm.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            System.out.println("Insert CategoryDTO error!" + ex.getMessage());
            ex.printStackTrace();
        }

    }

    public void delete(String productName) {
        try {
            Connection con = DBUtils.getConnection();

            String sqlSelect = "SELECT CategoryID, StorageID FROM Products WHERE ProductsName = ?";
            PreparedStatement selectStm = con.prepareStatement(sqlSelect);
            selectStm.setString(1, productName);
            ResultSet rs = selectStm.executeQuery();

            int categoryId = 0;
            int storageId = 0;
            if (rs.next()) {
                categoryId = rs.getInt("CategoryID");
                storageId = rs.getInt("StorageID");
            }
            rs.close();
            selectStm.close();

            deleteProduct(productName, con);

            if (categoryId != 0) {
                deleteCategory(categoryId, con);
            }
            if (storageId != 0) {
                deleteStorage(storageId, con);
            }

            con.close();
        } catch (Exception e) {
            System.out.println("ERROR WHEN DELETE PRODUCT: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void deleteProduct(String productName, Connection con) throws SQLException {
        String sql = "DELETE FROM Products WHERE ProductsName = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, productName);
        stm.executeUpdate();
        stm.close();
    }

    private void deleteCategory(int categoryID, Connection con) throws SQLException {
        String sql = "DELETE FROM Category WHERE CategoryID = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setInt(1, categoryID);
        stm.executeUpdate();
        stm.close();
    }

    private void deleteStorage(int storageID, Connection con) throws SQLException {
        String sql = "DELETE FROM Storage WHERE StorageID = ?";
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setInt(1, storageID);
        stm.executeUpdate();
        stm.close();
    }

    public List<ProductsDTO> bestseller() {
    List<ProductsDTO> list = new ArrayList<ProductsDTO>();
    ProductsDTO product = null;

    try {
        Connection con = DBUtils.getConnection();

        String sql = "SELECT TOP 8 p.ProductsID, p.ProductsName, p.Gender, p.Size, p.Color,p.Img, p.ProductPrice, p.StorageId, p.CategoryId " +
                     "FROM Products p " +
                     "INNER JOIN OrderDetail od ON p.ProductsID = od.ProId " +
                     "GROUP BY p.ProductsID, p.ProductsName, p.Gender, p.Size, p.Color, p.ProductPrice, p.StorageId, p.CategoryId,p.Img " +
                     "ORDER BY SUM(od.TotalQuantity) DESC";

        PreparedStatement stm = con.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();

        while (rs.next()) {
            product = new ProductsDTO();
            product.setProductsID(rs.getInt("ProductsID"));
            product.setProductsName(rs.getString("ProductsName"));
            product.setGender(rs.getString("Gender"));
            product.setSize(rs.getString("Size"));
            product.setColor(rs.getString("Color"));
            product.setProductPrice(rs.getFloat("ProductPrice"));
            product.setStorageId(rs.getInt("StorageId"));
            product.setCategoryId(rs.getInt("CategoryId"));
            product.setImg(rs.getString("Img"));
            list.add(product);
        }

        con.close();

    } catch (Exception e) {
        System.out.println("ERROR IN SQL PRODUCTDAO: " + e.getMessage());
        e.printStackTrace();
    }

    return list;
}

}
