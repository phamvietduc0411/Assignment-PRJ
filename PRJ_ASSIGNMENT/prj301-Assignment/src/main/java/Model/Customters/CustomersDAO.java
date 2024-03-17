/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Customters;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import prj301demo.utils.DBUtils;

/**
 *
 * @author HP
 */
public class CustomersDAO {

    public CustomersDTO login(String username, String password) {

        CustomersDTO customers = null;

        try {
            Connection con = DBUtils.getConnection();

            String sql = " SELECT  CustomerName FROM Customers WHERE username = ? AND password = ?  ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    customers = new CustomersDTO();
                 
                    customers.setUsername(rs.getString("username"));
                    customers.setCustomerName(rs.getString("CustomerName"));
                }
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error in SQL query WHEN Login. Details:" + e.getMessage());
            e.printStackTrace();
        }

        return customers;
    }
    
    public Integer insert(CustomersDTO customner) {
        String sql = "INSERT INTO Customers (CustomerID, username, password, CustomerName, PhoneNumber, Address, Gender, Email) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";
        try {

            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, customner.getCustomerID());
            ps.setString(2, customner.getUsername());
            ps.setString(3, customner.getPassword());
            ps.setString(4, customner.getCustomerName());
            ps.setString(5, customner.getPhoneNumber());
            ps.setString(6, customner.getAddress());
            ps.setString(7, customner.getGender());
            ps.setString(8, customner.getEmail());

            ps.executeUpdate();
            con.close();
            return customner.getCustomerID();
        } catch (SQLException ex) {
            System.out.println("Insert Student error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
