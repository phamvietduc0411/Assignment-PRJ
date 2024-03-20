<%-- 
    Document   : editprofile
    Created on : 20-03-2024, 23:38:14
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT</title>
    </head>
    <body>
        <form action="PageController" method="get">
        <table>
         
         <div>
            <h1>Customer Profile</h1>
        </div>
            <h4>Username:<input name="username" value="${sessionScope.customer.username}"></h4>
        </div>
        <div>
            <h4>Name:<input name="customername" value="${sessionScope.customer.customerName}"> </h4>
        </div>
        <div>
            <h4>Phone Number: <input name="phonenumber" value="${sessionScope.customer.phoneNumber}" ></h4>
        </div>
        <div>
            <h4>Address: <input name="address" value="${sessionScope.customer.address}" </h4>
        </div>
        
        <div>
            <h4>Gender: <input name="gender" value="${sessionScope.customer.gender}"> </h4>
        </div>
        
        <div>
            <h4>Email: <input name="email" value="${sessionScope.customer.email}" </h4>

        </div>
         <tr><td colspan="2">
                 <input name="action" value="update" type="hidden">
                <input type="submit" value="Save">
         </td></tr>
         </table>
        
         
        
         </form>
    </body>
</html>
