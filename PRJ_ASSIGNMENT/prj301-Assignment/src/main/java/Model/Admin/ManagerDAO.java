/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import prj301demo.utils.DBUtils;

/**
 *
 * @author HP
 */
public class ManagerDAO {

    public ManagerDTO login(String username, String password) {
        ManagerDTO manager = null;

        try {
            Connection con = DBUtils.getConnection();

            String sql = " SELECT ManagerID , Managername FROM Manager WHERE username = ? AND password = ? ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            if (rs != null) {
                manager = new ManagerDTO();
                if (rs.next()) {
                    manager.setManagerID(rs.getInt("ManagerID"));
                    manager.setManagername("Managername");
                }
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Error in SQL WHEN ADMIN LOGIN" + e.getMessage());
            e.printStackTrace();
        }
        return manager;
    }
}
