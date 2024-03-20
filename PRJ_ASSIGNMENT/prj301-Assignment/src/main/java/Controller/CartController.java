/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Cart.CartDAO;
import Model.Cart.CartDTO;
import Model.OrderDetail.OrderDetailDTO;
import Model.Orders.OrdersDAO;
import Model.Orders.OrdersDTO;
import Model.Products.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj301demo.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("setBill")) {
            // Lấy danh sách các đơn hàng từ giỏ hàng
            List<OrdersDTO> orderList = (List<OrdersDTO>) request.getSession().getAttribute("cart");
            
            // Lưu danh sách các đơn hàng vào cơ sở dữ liệu
            OrdersDAO orderDAO = new OrdersDAO();
            boolean success = orderDAO.saveOrders(orderList);

            if (success) {
                // Xóa giỏ hàng sau khi đã lưu đơn hàng thành công
                request.getSession().removeAttribute("cart");
                // Chuyển hướng về trang chủ hoặc trang thành công
                response.sendRedirect("homePage.jsp");
            } else {
                // Nếu có lỗi xảy ra, hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Failed to save orders!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Nếu không có hành động nào được xác định, chuyển hướng về trang cart.jsp
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
