/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Category.CategoryDTO;
import Model.Products.ProductsDAO;
import Model.Products.ProductsDTO;
import Model.Storage.StorageDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class AdminController extends HttpServlet {

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
//        ProductName=&
//Gender=Men&
//        Size=Men&
//        Color=&
//        Img=&
//        ProductPrice
//        =&Collections
//        =&CategoryName=
//        &AvailableQuantity=
//        &Descriptions=
            String action = request.getParameter("action");

            String productName = request.getParameter("ProductName");
            String gender = request.getParameter("Gender");
            String size = request.getParameter("Size");
            String color = request.getParameter("Color");
            String img = request.getParameter("Img");
            String Price = request.getParameter("ProductPrice");
            String collection = request.getParameter("Collections");
            String categoryName = request.getParameter("CategoryName");
            String availableQuantity = request.getParameter("AvailableQuantity");
            String descriptions = request.getParameter("Descriptions");

            System.out.println("action" + action);
            if (action.equals("insert")) {
                
                StorageDTO storage = new StorageDTO();
                int number = 0;
                try {
                   number = Integer.parseInt(availableQuantity);
                } catch (Exception e) {
                    System.out.println("");
                }
                storage.setAvailableQuantity(number);
                
                CategoryDTO category = new CategoryDTO();
                category.setCategoryName(categoryName);
                category.setCollections(collection);
                category.setDescriptions(descriptions);
                
                ProductsDAO productsDAO = new ProductsDAO();
                ProductsDTO product = new ProductsDTO();
                product.setProductsName(productName);
                product.setGender(gender);
                product.setSize(size);
                product.setColor(color);
                product.setImg(img);

                float price = 0;
                try {
                    price = Float.parseFloat(Price);
                } catch (Exception e) {
                    System.out.println("Error when format PRODUCT PRICE");
                }
                product.setProductPrice(price);
                
                productsDAO.Insert(product,storage,category);
                
                

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
