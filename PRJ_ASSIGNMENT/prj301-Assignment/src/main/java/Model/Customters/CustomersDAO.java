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

            String sql = " SELECT  *  FROM Customers WHERE username = ? AND password = ?  ";

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
                    customers.setPhoneNumber(rs.getString("PhoneNumber"));
                    customers.setAddress(rs.getString("Address"));
                    customers.setGender(rs.getString("Gender"));
                    customers.setEmail(rs.getString("Email"));
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
            String sql = "INSERT INTO Customers (username, password, CustomerName, PhoneNumber, Address, Gender, Email) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";
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
    
    public CustomersDTO load (int customerID){
        String sql = " SELECT * FROM Customers WHERE customerID = ? ";
        try{
           Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String customerName = rs.getString("CustomerName");
                String phoneNumber = rs.getString("PhoneNumber");
                String address = rs.getString("Address");
                String gender = rs.getString("Gender");
                String email = rs.getString("Email");
                
                CustomersDTO customers = new CustomersDTO();
                customers.setCustomerID(customerID);
                customers.setUsername(username);
                customers.setPassword(password);
                customers.setCustomerName(customerName);
                customers.setPhoneNumber(phoneNumber);
                customers.setAddress(address);
                customers.setGender(gender);
                customers.setEmail(email);
                return customers;
                
            }
        }
        catch(SQLException ex){
            System.out.println("Query playlist error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean update(CustomersDTO customers){
        String sql = " UPDATE Customers SET username = ?, customerName = ?, phoneNumber = ?, address = ?, gender = ?, email = ?  WHERE customerID = ? ";
        
        
        try {
            
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);                      
            
            
            ps.setString(1, customers.getUsername());
            ps.setString(2, customers.getCustomerName());
            ps.setString(3, customers.getPhoneNumber());
            ps.setString(4, customers.getAddress());
            ps.setString(5, customers.getGender());
            ps.setString(6, customers.getEmail());
            ps.setInt(7, customers.getCustomerID());
            
            
            
          
            ps.executeUpdate();
            conn.close();

           
	}
        catch (SQLException ex) {
            System.out.println("Update PlayList error!" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

}
