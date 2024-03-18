/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Admin.ManagerDAO;
import Model.Admin.ManagerDTO;
import Model.Customters.CustomersDAO;
import Model.Customters.CustomersDTO;
import Model.Products.ProductsDAO;
import Model.Products.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class LoginController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
//         get parameter
            String action = request.getParameter("option");
            String username = request.getParameter("userName");
            String password = request.getParameter("password");
            
            if (action.equals("login")) {
                ManagerDAO managerDAO = new ManagerDAO();
                ManagerDTO manager = managerDAO.login(username, password);

                CustomersDAO customerDAO = new CustomersDAO();
                CustomersDTO customer = customerDAO.login(username, password);
                if (manager != null) {
                    ProductsDAO productDAO = new ProductsDAO();
                    List<ProductsDTO> list = productDAO.viewAllProduct();

                    request.setAttribute("productlist", list);
                    HttpSession session = request.getSession(true);
                    session.setAttribute("manager", manager);
                    RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                    rd.forward(request, response);
                } else if (customer != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("customerSession", customer);
                    response.sendRedirect("./homePage.jsp");

                } else {
                    request.setAttribute("error", "Username or password is incorrect");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
