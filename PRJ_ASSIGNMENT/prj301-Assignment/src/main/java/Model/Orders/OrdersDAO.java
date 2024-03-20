/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Orders;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301demo.utils.DBUtils;

/**
 *
 * @author Acer
 */

public class OrdersDAO {
    
    public boolean createOrder(OrdersDTO order) throws SQLException {
        boolean success = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO Orders (OrdersDate, Price, Quantity, Address, Status, Freight, CustomerId) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setDate(1, new Date(order.getOrdersDate().getTime()));
            stmt.setFloat(2, order.getPrice());
            stmt.setInt(3, order.getQuantity());
            stmt.setString(4, order.getAddress());
            stmt.setString(5, order.getStatus());
            stmt.setString(6, order.getFreight());
            stmt.setInt(7, order.getCustomerId());
            
            int rowsAffected = stmt.executeUpdate();
            success = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return success;
    }
    

     public List<OrdersDTO> getOrderHistory(int customerID)  {
        List<OrdersDTO> orderHistory = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT * FROM Orders WHERE CustomerID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, customerID);
            rs = stmt.executeQuery();
            
           while (rs.next()) {
               
                OrdersDTO order = new OrdersDTO();
                order.setOrdersID(rs.getInt("OrdersID"));
                order.setOrdersDate(rs.getDate("OrdersDate"));
                order.setPrice(rs.getFloat("Price"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setStatus(rs.getString("Status"));
                order.setFreight(rs.getString("Freight"));
                order.setCustomerId(rs.getInt("CustomerId"));
                order.setAddress(rs.getString("Address"));
                
                orderHistory.add(order);
            }
        } catch (SQLException e) {
            System.out.println("ERRON IN  getOrderHistory" +e.getMessage());
            e.printStackTrace();
        }
        
        return orderHistory;
    }
 
     public List<OrdersDTO> checkOrderAdmin() {
        List<OrdersDTO> list = new ArrayList<>();
        
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM Orders WHERE  Status = 'Pending' ";
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                OrdersDTO order = new OrdersDTO();
                order.setOrdersID(resultSet.getInt("OrdersID"));
                order.setOrdersDate(resultSet.getDate("OrdersDate"));
                order.setPrice(resultSet.getFloat("Price"));
                order.setQuantity(resultSet.getInt("Quantity"));
                order.setAddress(resultSet.getString("Address"));
                order.setStatus(resultSet.getString("Status"));
                order.setFreight(resultSet.getString("Freight"));
                order.setCustomerId(resultSet.getInt("CustomerId"));
                list.add(order);
            }

            statement.close();
            con.close();
        } catch (Exception e) {
            System.out.println("ERROR  SQL IN CHECK ORDERS ADMIN "+ e.getMessage());
            e.printStackTrace();
        }

        return list;
    }
     
     public void confirmOrder(String orderId , String status) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "UPDATE Orders SET Status = ? WHERE OrdersID = ? ";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, orderId);
            statement.executeUpdate();
            statement.close();
            con.close();
        } catch (Exception e) {
            System.out.println("ERROR  WHEN COMFIRM ORDER" + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<OrdersDTO> getOrderHistory(String customerID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     
    public List<OrdersDTO> getShippedOrders() {
        List<OrdersDTO> orders = new ArrayList<>();

        try (
            Connection conn = DBUtils.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT o.OrdersID, o.OrdersDate, o.Price, o.Quantity, o.Address AS OrderAddress, o.Status, o.Freight, " +
                "c.CustomerName, c.PhoneNumber, c.Address AS CustomerAddress, c.Gender, c.Email " +
                "FROM Orders o " +
                "JOIN Customers c ON o.CustomerId = c.CustomerID " +
                "JOIN Cart ct ON o.CustomerId = ct.CustomerId " +
                "WHERE o.Status = 'Shipped'"
            );
            ResultSet rs = stmt.executeQuery()
        ) {
            while (rs.next()) {
                OrdersDTO order = new OrdersDTO();
                order.setOrdersID(rs.getInt("OrdersID"));
                order.setOrdersDate(rs.getDate("OrdersDate"));
                order.setPrice(rs.getFloat("Price"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setAddress(rs.getString("OrderAddress"));
                order.setStatus(rs.getString("Status"));
                order.setFreight(rs.getString("Freight"));
                order.setCustomerId(rs.getInt("CustomerId"));
                
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }    
}