<%-- 
    Document   : profile
    Created on : 20-03-2024, 00:03:53
    Author     : Acer
--%>
<%@page import="Model.Orders.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Customters.CustomersDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Profile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="zstalk icon" type="image/x-icon" href="images/favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/normalize.css">
        <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" media="all"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <!-- script
          ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>
    <body>
        <header id="header">
            <div id="header-wrap">
                
                <nav class="primary-nav padding-small">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-2 col-md-2">
                                <div class="main-logo">
                                    <a href="homePage.jsp">
                                        <img src="images/logo.png" alt="logo">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-10 col-md-10">
                                <div class="navbar">

                                    <div id="main-nav" class="stellarnav d-flex justify-content-end right">
                                        <ul class="menu-list">

                                            <li class="menu-item has-sub">
                                                <a href="homePage.jsp" class="item-anchor active d-flex align-item-center" data-effect="Home">Home<i
                                                        class="icon icon-chevron-down"></i>
                                                </a>
                                            </li>
                                            
                                            <li class="menu-item has-sub">
                                                <a href="./PageController?action=collection" class="item-anchor d-flex align-item-center" data-effect="Blog">Collection<i
                                                        class="icon icon-chevron-down"></i>
                                                </a>
                                            </li>
                                            
                                            <li>
                                                <a 
                                                    href="about.jsp" class="item-anchor" data-effect="About">About
                                                </a>
                                            </li>

                                            <li>
                                                <a 
                                                    href="cart.jsp" class="item-anchor" data-effect="Contact">Cart
                                                </a>
<<<<<<< Updated upstream
                                            </li>

                                            
<!--                                            <li class="menu-item has-sub">
                                                <a href="./PageController?action=profile" class="item-anchor d-flex align-item-center" data-effect="Blog">Profile<i
                                                        class="icon icon-chevron-down"></i>
                                                </a>
                                            </li>-->
                                           

                                       
                                            <!--logout customer-->     
=======
                                            </li> 
>>>>>>> Stashed changes
                                            <li>
                                                <a
                                                    href="./PageController?action=logout"
                                                    class="item-anchor" data-effect="Contact" target="_blank"> <b>Logout</b>
                                                </a>
                                            </li>        
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </nav>
            </div>
        </header>

        <div>
            <h1>Customer Profile</h1>
        </div>
        <div>
            <h4>Customer ID:  ${sessionScope.customer.customerID} </h4>
        </div>
        <div>
<<<<<<< Updated upstream
            <h4>Username: ${requestScope.customers.username}</h4>
        </div>
        <div>
            <h4>Name: ${requestScope.customers.CustomerName}</h4>
        </div>
        <div>
            <h4>Phone Number: ${requestScope.customers.phoneNumber}</h4>
        </div>
        <div>
            <h4>Address: ${requestScope.customers.address}</h4>
        </div>
        
        <div>
            <h4>Gender: ${requestScope.customers.gender}</h4>
        </div>
        
        <div>
            <h4>Email: ${requestScope.customers.email}</h4>
=======
            <h4>Username: ${sessionScope.customer.username}</h4>
        </div>
        <div>
            <h4>Name: ${sessionScope.customer.customerName}</h4>
        </div>
        <div>
            <h4>Phone Number: ${sessionScope.customer.phoneNumber}</h4>
        </div>
        <div>
            <h4>Address: ${sessionScope.customer.address}</h4>
        </div>
        
        <div>
            <h4>Gender: ${sessionScope.customer.gender}</h4>
        </div>
        
        <div>
            <h4>Email: ${sessionScope.customer.email}</h4>
>>>>>>> Stashed changes
        </div>
        
        <h1>Order History</h1>
    <table border="3">
        <tr>
            <th>Order ID</th>
            <th>Order Date</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Address</th>
            <th>Status</th>
            <th>Freight</th>
            <!-- Add more columns if needed -->
        </tr>
        <% 
            List<OrdersDTO> orderHistory = (List<OrdersDTO>) request.getAttribute("orderHistory");
            if (orderHistory != null && !orderHistory.isEmpty()) {
                for (OrdersDTO order : orderHistory) {
        %>
        <tr>
            <td><%= order.getOrdersID() %></td>
            <td><%= order.getOrdersDate() %></td>
            <td><%= order.getPrice() %></td>
            <td><%= order.getQuantity() %></td>
            <td><%= order.getAddress() %></td>
            <td><%= order.getStatus() %></td>
            <td><%= order.getFreight() %></td>
            <!-- Add more columns if needed -->
        </tr>
        <% 
                }
            } else {
        %>
        <tr>
            <td colspan="7">No orders found.</td>
        </tr>
        <% } %>
    </table>
        
        
        
        
        
        
        
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/script.js"></script>
        
    </body>
</html>
