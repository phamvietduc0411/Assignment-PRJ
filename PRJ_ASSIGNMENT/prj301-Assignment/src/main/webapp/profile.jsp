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
 <jsp:include page="/menu.jsp" flush="true" />

        <div>
            <h1>Customer Profile</h1>
        </div>
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

    </div>
    <form action="PageController">
             <input type=hidden name="id" value="${requestScope.playlist.playlistID}">
             <input type=hidden name="action" value="edit">
             <input type=submit value="Edit"></form>    

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
            List<OrdersDTO> orderHistory = (List<OrdersDTO>) request.getAttribute("orderList");

                for (OrdersDTO order : orderHistory) {
        %>
        <tr>
            <td><%= order.getOrdersID()%></td>
            <td><%= order.getOrdersDate()%></td>
            <td><%= order.getPrice()%></td>
            <td><%= order.getQuantity()%></td>
            <td><%= order.getAddress()%></td>
            <td><%= order.getStatus()%></td>
            <td><%= order.getFreight()%></td>
           
        </tr>
        
 
        <% }%>
    </table>







    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/script.js"></script>

</body>
</html>
