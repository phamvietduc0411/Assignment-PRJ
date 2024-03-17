/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Customters;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
    public CustomersDTO createAccount(String username, String CustomerName, String Email, String password,  String PhoneNumber, String Address, String Gender ) {

        CustomersDTO customer = null;

        try {
            Connection con = DBUtils.getConnection();

            String sql = "INSERT INTO Customer (username, CustomerName, Email, password, PhoneNumber, Address, Gender ) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?) ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, CustomerName);
            stmt.setString(3, Email);
            stmt.setString(4, password);
            stmt.setString(5, PhoneNumber);
            stmt.setString(6, Address);
            stmt.setString(7, Gender);
            
            
            ResultSet rs = stmt.executeQuery();
            if(rs != null){
               if(rs.next()){
                   customer = new CustomersDTO();
                   customer.setUsername("username");
                   customer.setCustomerName("CustomerName");
                   customer.setEmail("Email");
                   customer.setPassword("password");
                   customer.setPhoneNumber("PhoneNumber");
                   customer.setAddress("Address");
                   customer.setGender("Gender");
               }
            }
            con.close();
                
        } catch (Exception e) {
            System.out.println("Error in SQL query WHEN Register. Details:");    
            e.printStackTrace();
        }
        return customer;
    }
}
