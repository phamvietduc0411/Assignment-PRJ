<%@page import="java.util.List"%>
<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    
    <head>
        <title>ADMIN</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />



        <!-- Required      <th>ProductName</th>
                            <th>Gender</th>
                            <th>Size</th>
                            <th>Color</th>
                            <th>Price</th> Fremwork -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">


        <!-- Style.css      <th>ProductName</th>
                            <th>Gender</th>
                            <th>Size</th>
                            <th>Color</th>
                            <th>Price</th>-->
        <link rel="stylesheet" type="text/css" href="css/admin.css">


    </head>

    <body>
        <p>Login user: ${sessionScope.manager.managerID}</p>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>View All Product</h5>

                </div>
                <table>
                    
                        <tr>
                            <td>ProductId</td>
  
                        </tr>
                        <%
                    List<ProductsDTO> list = (List<ProductsDTO>)request.getAttribute("productlist");
                    for (ProductsDTO products : list)    
                %>             
                <tr>
                  <td><%= products.getProductsID()  %></td>
                 
                      
                        </tr>
                         <%} %> 
                   
                </table>       

            </div>
        </div>
    </body>

</html>