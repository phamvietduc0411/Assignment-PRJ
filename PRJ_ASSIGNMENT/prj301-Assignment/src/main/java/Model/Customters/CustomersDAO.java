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

            String sql = " SELECT  CustomerName ,CustomerID , username FROM Customers WHERE username = ? AND password = ?  ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    customers = new CustomersDTO();
                    customers.setCustomerID(rs.getInt("CustomerID"));
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
    
    public boolean createCustomer(CustomersDTO customer) {
        
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO Customers (username, password, CustomerName, PhoneNumber, Address, Gender, Email) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, customer.getUsername());
            stmt.setString(2, customer.getPassword());
            stmt.setString(3, customer.getCustomerName());
            stmt.setString(4, customer.getPhoneNumber());
            stmt.setString(5, customer.getAddress());
            stmt.setString(6, customer.getGender());
            stmt.setString(7, customer.getEmail());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public CustomersDTO getCustomerProfile(String profile) {
        CustomersDTO customer = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM Customers WHERE customerID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, profile);
            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    customer = new CustomersDTO();
                    customer.setCustomerID(rs.getInt("customerID"));
                    customer.setUsername(rs.getString("username"));
                    customer.setPassword(rs.getString("password"));
                    customer.setCustomerName(rs.getString("CustomerName"));
                    customer.setPhoneNumber(rs.getString("PhoneNumber"));
                    customer.setAddress(rs.getString("Address"));
                    customer.setGender(rs.getString("Gender"));
                    customer.setEmail(rs.getString("Email"));
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }


    
}
