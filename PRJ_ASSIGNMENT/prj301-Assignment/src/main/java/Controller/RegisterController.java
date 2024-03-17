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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class RegisterController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        
        boolean error = false;
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String CustomerName = request.getParameter("CustomerName");
            String Email = request.getParameter("email");
            String Password = request.getParameter("password");
            String PhoneNumber = request.getParameter("PhoneNumber");
            String Address = request.getParameter("Address");
            String Gender = request.getParameter("Gender");
            
            
            if (action == null || action.equals("register")) {

                CustomersDAO dao = new CustomersDAO();
                CustomersDTO dto = dao.createAccount(username, CustomerName, Email, Password, PhoneNumber, Address, Gender);

                if (dto != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("customerSession", dto);
                    response.sendRedirect("./login.jsp");
                }else {
                    request.setAttribute("error", "Fail");
                    RequestDispatcher rd = request.getRequestDispatcher("signUp.html");
                    rd.forward(request, response);
                }

            }

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
