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

            String sql = " SELECT  CustomerName FROM Customers WHERE CustomerUser = ? AND CustomerPassword = ?  ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    customers = new CustomersDTO();
                    customers.setCustomUser(rs.getString("CustomerUser"));
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
}
