/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import prj301demo.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class OrderDetailDAO {
    
    // Xử lý thanh toán và thêm vào bảng OrderDetail
    public void processPayment(int customerId, int cartId, int paymentId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Kết nối đến cơ sở dữ liệu
            connection = DBUtils.getConnection();

            // Chuẩn bị câu lệnh SQL để thêm dữ liệu vào bảng OrderDetail từ giỏ hàng
            String sql = " INSERT INTO OrderDetail (CustomerId, CartId, ProductId, Quantity, PaymentId) " +
                         " SELECT ?, ?, ProductId, Quantity, ? FROM Cart WHERE CustomerId = ? ";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            statement.setInt(2, cartId);
            statement.setInt(3, paymentId);
            statement.setInt(4, customerId);

            // Thực thi câu lệnh SQL
            statement.executeUpdate();

            // Xóa các mục trong giỏ hàng sau khi xử lý thanh toán
            sql = " DELETE FROM Cart WHERE CustomerId = ? ";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
    }
    
}
