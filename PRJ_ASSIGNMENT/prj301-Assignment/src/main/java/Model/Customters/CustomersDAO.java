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

            String sql = " SELECT  CustomerName , username FROM Customers WHERE username = ? AND password = ?  ";

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
    
    public static void addUser(CustomersDTO customer) throws SQLException {
        String sql = "INSERT INTO Customers (username, password, CustomerName, PhoneNumber, Address, Gender, Email) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getCustomerName());
            statement.setString(4, customer.getPhoneNumber());
            statement.setString(5, customer.getAddress());
            statement.setString(6, customer.getGender());
            statement.setString(7, customer.getEmail());

            statement.executeUpdate();
        }
    }

}
