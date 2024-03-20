/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Category.CategoryDAO;
import Model.Category.CategoryDTO;
import Model.Customters.CustomersDAO;
import Model.Customters.CustomersDTO;
import Model.Products.ProductsDAO;
import Model.Products.ProductsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class PageController extends HttpServlet {

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
            String action = request.getParameter("action");

//            CategoryDAO categoryDAO = new CategoryDAO();
            if (action.equals("productDetails")) {
                CategoryDAO categoryDAO = new CategoryDAO();
// can sua lai
                Integer CategoryID = null;
                try {
                    CategoryID = Integer.parseInt(request.getParameter("CategoryID"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CategoryDTO category = null;
                if (CategoryID != null) {
                    category = categoryDAO.load(CategoryID);

                }
                request.setAttribute("category", category);
                request.getRequestDispatcher("productDetails.jsp").forward(request, response);
            } else if (action.equals("collection")) {

                ProductsDAO productDAO = new ProductsDAO();
                List<ProductsDTO> menCollectionSummer = productDAO.collection("Summer", "Men");
                List<ProductsDTO> menCollectionAutumn = productDAO.collection("Autumn", "Men");
                List<ProductsDTO> menCollectionSpring = productDAO.collection("Spring", "Men");
                List<ProductsDTO> menCollectionWinter = productDAO.collection("Winter", "Men");

                List<ProductsDTO> womenCollectionSummer = productDAO.collection("Summer", "Women");
                List<ProductsDTO> womenCollectionAutumn = productDAO.collection("Autumn", "Women");
                List<ProductsDTO> womenCollectionSpring = productDAO.collection("Spring", "Women");
                List<ProductsDTO> womenCollectionWinter = productDAO.collection("Winter", "Women");

                request.setAttribute("menCollectionSummer", menCollectionSummer);
                request.setAttribute("menCollectionAutumn", menCollectionAutumn);
                request.setAttribute("menCollectionSpring", menCollectionSpring);
                request.setAttribute("menCollectionWinter", menCollectionWinter);
//                
                request.setAttribute("womenCollectionSummer", womenCollectionSummer);
                request.setAttribute("womenCollectionAutumn", womenCollectionAutumn);
                request.setAttribute("womenCollectionSpring", womenCollectionSpring);
                request.setAttribute("womenCollectionWinter", womenCollectionWinter);

                request.getRequestDispatcher("collection.jsp").forward(request, response);
            } else if (action.equals("search")) {
                String keyword = request.getParameter("keyword");

                ProductsDAO productsDAO = new ProductsDAO();
                List<ProductsDTO> result = productsDAO.SearchProByName(keyword);
                request.setAttribute("result", result);

                request.getRequestDispatcher("searchingproducts.jsp").forward(request, response);
            } else if (action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                    request.setAttribute("error", "Logout successfully!");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }

            } else if (action != null && action.equals("profile")) {
                String profile = request.getParameter("profile");
                
                CustomersDAO customersDAO = new CustomersDAO();
                CustomersDTO customers = customersDAO.getCustomerProfile(profile);
                request.setAttribute("customers", customers);
                
                request.getRequestDispatcher("profile.jsp").forward(request, response);
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
