<%@page import="java.util.List"%>
<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>ADMIN</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <link rel="zstalk icon" type="image/x-icon" href="images/favicon.ico">
        
        <style>a{
                background-color: black;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 20px;
                text-decoration: none;

            }

            a[href='login?action=logout']:hover {
                background-color: red;
                text-decoration: none;
            }</style>

    </head>

    <body>
        <div style="display: flex;  justify-content: space-between">
            <h3> Hello  ${sessionScope.manager.managername}</h3>
            <a href='./login?option=logout'>Logout</a>
        </div>

        <div class="pcoded-main-container">

            <div class="pcoded-inner-content">
                <!-- Main-body start -->
                <div class="main-body">
                    <div class="page-wrapper">

                        <!-- Page body start -->
                        <div class="page-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">

                                            <h5>Check Order</h5>

                                        </div>
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>orderID</th>
                                                    <th>orderdate</th>
                                                    <th>price</th>
                                                    <th>quantity</th>
                                                    <th>address</th>
                                                    <th>status</th>
                                                    <th>freight</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Rows for data will go here -->
                                            </tbody>
                                        </table>
                                    </div> 
                                    <div class="row">


                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Add product</h5>
                                                    <%String success = (String) request.getAttribute("success");%>

                                                    <% if (success != null) {%>
                                                    <h4 style="color: red"><%= success%></h4>

                                                    <%}%>
                                                </div>
                                                <div class="card-block">
                                                    <form method="Get" action="./AdminController" class="form-material">
                                                        <input type="hidden" name="action" value="insert"  />
                                                        <div class="form-group form-default">
                                                            <input type="text" name="ProductName" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label >ProductName</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <select name="Gender"   >
                                                                <option value="Men">Men</option>
                                                                <option value="Women">Women</option>
                                                            </select>
                                                            <span class="form-bar"></span>

                                                        </div>
                                                        <div class="form-group form-default">
                                                            <select  name="Size" >
                                                                <option value="S">S</option>
                                                                <option value="M">M</option>
                                                                <option value="L">L</option>
                                                                <option value="XL">XL</option>
                                                            </select>
                                                            <span class="form-bar"></span>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Color" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label >Color</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Img" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label >Img</label>
                                                        </div>

                                                        <div class="form-group form-default">
                                                            <input type="text" name="ProductPrice" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label >ProductPrice</label>
                                                        </div> 
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Collections" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label>Collections</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="CategoryName" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label>CategoryName</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="AvailableQuantity" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label>AvailableQuantity</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Descriptions" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label >Descriptions</label>
                                                        </div>

                                                        <input  class="form-submit" type="submit" value="save">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <!-- Basic Form Inputs card end -->
                                </div>
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>View All Product</h5>
                                             <%String delete = (String) request.getAttribute("delete");%>

                                                    <% if (delete != null) {%>
                                                    <h4 style="color: red"><%= delete %></h4>

                                                    <%}%>

                                        </div>
                                        <table>

                                            <tr>
                                                <td class="card-header">ProductId</td>
                                                <td class="card-header">Product Name</td>
                                                <td class="card-header">Gender</td>
                                                <td class="card-header">Price</td>

                                            </tr>
                                            <%
                                                List<ProductsDTO> list = (List<ProductsDTO>) request.getAttribute("productlist");

                                                for (ProductsDTO products : list) {
                                            %>

                                            <tr>
                                                <td class="card-header" style="width: 200px;"><%= products.getProductsID()%></td>
                                                <td class="card-header"  style="width: 400px;"><%= products.getProductsName()%></td>
                                                <td class="card-header" style="width: 200px;"> <%= products.getGender()%></td>                                            
                                                <td class="card-header"><%= products.getProductPrice()%></td>



                                                <td> <form action ="./AdminController" method="GET">
                                                        <input name="action" value="delete" type="hidden">
                                                        <input name="productName" value="<%= products.getProductsName() %>" type="hidden">
                                                        <input name="categoryID" value="<%= products.getCategoryId()%>" type="hidden">
                                                        <input name="storageID" value="<%= products.getStorageId()%>" type="hidden">
                                                        <input type="submit" value="delete">
                                                    </form></td>  



                                            </tr>
                                            <% }%> 

                                        </table>       

                                    </div>
                                </div>
                                <!-- Page body end -->
                            </div>


                            </body>

                            </html>