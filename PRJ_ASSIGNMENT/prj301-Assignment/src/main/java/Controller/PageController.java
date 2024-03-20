/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Cart.CartDAO;
import Model.Cart.CartDTO;
import Model.Category.CategoryDAO;
import Model.Category.CategoryDTO;
import Model.Customters.CustomersDAO;
import Model.Customters.CustomersDTO;
import Model.Orders.OrdersDAO;
import Model.Orders.OrdersDTO;
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
            
            ProductsDAO productDAO = new ProductsDAO();
            
            if (action.equals("productDetails")) {
                CategoryDAO categoryDAO = new CategoryDAO();
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
            } else if (action.equals("view")) {
                
                List<ProductsDTO> bestSellList = productDAO.bestseller();
                request.setAttribute("bestSeller", bestSellList);
                request.getRequestDispatcher("displayProduct.jsp").forward(request, response);
                
            } else if (action.equals("collection")) {
                
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
                List<ProductsDTO> result = productDAO.SearchProByName(keyword);
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

                int customerID = 0;
                
                 try {
                    customerID = Integer.parseInt(request.getParameter("cusId"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                
                OrdersDAO orderDAO = new OrdersDAO();
                
                List<OrdersDTO> orderList =  orderDAO.getOrderHistory(customerID);
                request.setAttribute("orderList", orderList);
                request.getRequestDispatcher("profile.jsp").forward(request, response);

            } else if(action.equals("add")) {

                String cusId = request.getParameter("cusId");                
                System.out.println("" + cusId);
                
                int customerid = 0;
                try {
                   customerid  = Integer.parseInt(request.getParameter("cusId"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                OrdersDAO orderDAO = new OrdersDAO();
                List<OrdersDTO> orderList = orderDAO.getOrderHistory(customerid);
                System.out.println("-=-------"+orderList.size());
                request.setAttribute("orderList", orderList);            
                request.getRequestDispatcher("profile.jsp").forward(request, response);       
            } else if (action.equals("add")) {
                
                int customerid = 0;
                int productid = 0;
                try {
                    customerid = Integer.parseInt(request.getParameter("customerid"));
                    productid = Integer.parseInt(request.getParameter("productid"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                
                CartDAO cartDAO = new CartDAO();
                cartDAO.addToCart(customerid, productid);
                request.getRequestDispatcher("homePage.jsp").forward(request, response);
            } else if(action.equals("load")){
                int customerid = 0;
                try {
                    customerid = Integer.parseInt(request.getParameter("customerid"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                
                CartDAO cartDAO = new CartDAO();
                List<ProductsDTO> itemInCart = cartDAO.viewCart(customerid);
                request.setAttribute("itemList", itemInCart);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
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
