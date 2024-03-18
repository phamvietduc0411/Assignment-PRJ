/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Customters.CustomersDAO;
import Model.Customters.CustomersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SignupController extends HttpServlet {

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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String customerName = request.getParameter("CustomerName");
            String phoneNumber = request.getParameter("PhoneNumber");
            String address = request.getParameter("Address");
            String gender = request.getParameter("Gender");
            String email = request.getParameter("Email");
            String agreeTerm = request.getParameter("agree-term");
            
            if(agreeTerm != null && agreeTerm.equals("on")){
                CustomersDTO customer = new CustomersDTO();

                customer.setUsername(username);
                customer.setPassword(password);
                customer.setCustomerName(customerName);
                customer.setPhoneNumber(phoneNumber);
                customer.setAddress(address);
                customer.setGender(gender);
                customer.setEmail(email);

                try {
                    CustomersDAO.addUser(customer);
                    response.sendRedirect("homePage.jsp");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    request.setAttribute("error", "An error occurred. Please try again later.");
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
                }
                response.sendRedirect("homePage.jsp");
            } else {
                request.setAttribute("error", "You must agree to the terms of service.");
                RequestDispatcher rd = request.getRequestDispatcher("signUp.jsp");
                rd.forward(request, response);
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
