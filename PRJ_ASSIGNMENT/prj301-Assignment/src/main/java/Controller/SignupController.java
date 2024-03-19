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
        
        String agreeTerm = request.getParameter("agree-term");
        if (agreeTerm != null && agreeTerm.equals("on")) {
            CustomersDTO customer = new CustomersDTO();
            customer.setUsername(request.getParameter("newuser"));
            customer.setPassword(request.getParameter("password"));
            customer.setCustomerName(request.getParameter("CustomerName"));
            customer.setPhoneNumber(request.getParameter("PhoneNumber"));
            customer.setAddress(request.getParameter("Address"));
            customer.setGender(request.getParameter("Gender"));
            customer.setEmail(request.getParameter("Email"));

            CustomersDAO customersDAO = new CustomersDAO();
            boolean created = customersDAO.createCustomer(customer);
            if (created) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Failed to create user. Please try again.");
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            }
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
