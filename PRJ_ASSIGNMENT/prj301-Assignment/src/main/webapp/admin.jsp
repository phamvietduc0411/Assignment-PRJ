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
                                                </div>
                                                <div class="card-block">
                                                    <form method="Get" action="./AdminController" class="form-material">
                                                        <input type="hidden" name="action" value="insert"  />
                                                        <div class="form-group form-default">
                                                            <input type="text" name="ProductName" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">ProductName</label>
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
                                                            <label class="float-label">Color</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Img" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Img</label>
                                                        </div>

                                                        <div class="form-group form-default">
                                                            <input type="text" name="ProductPrice" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">ProductPrice</label>
                                                        </div> 
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Collections" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Collections</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="CategoryName" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">CategoryName</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="AvailableQuantity" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">AvailableQuantity</label>
                                                        </div>
                                                        <div class="form-group form-default">
                                                            <input type="text" name="Descriptions" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Descriptions</label>
                                                        </div>

                                                        <input  class="form-submit" type="submit" value="save">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>ADD Admin</h5>
                                                </div>
                                                <div class="card-block">
                                                    <form class="form-material">
                                                        <div class="form-group form-default">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-default</label>
                                                        </div>
                                                        <div class="form-group form-primary">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-primary</label>
                                                        </div>
                                                        <div class="form-group form-success">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-success</label>
                                                        </div>
                                                        <div class="form-group form-danger">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-danger</label>
                                                        </div>
                                                        <div class="form-group form-warning">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-warning</label>
                                                        </div>
                                                        <div class="form-group form-info">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-info</label>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Colored Input With Static Label</h5>
                                                </div>
                                                <div class="card-block">
                                                    <form class="form-material">
                                                        <div class="form-group form-default form-static-label">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-default</label>
                                                        </div>
                                                        <div class="form-group form-primary form-static-label">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-primary</label>
                                                        </div>
                                                        <div class="form-group form-success form-static-label">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-success</label>
                                                        </div>
                                                        <div class="form-group form-danger form-static-label">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-danger</label>
                                                        </div>
                                                        <div class="form-group form-warning form-static-label">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-warning</label>
                                                        </div>
                                                        <div class="form-group form-info form-static-label">
                                                            <input type="text" name="footer-email" class="form-control">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">form-info</label>
                                                        </div>
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

                                        </div>
                                        <table>

                                            <tr>
                                                <td>ProductId</td>

                                            </tr>
                                            <%
                                                List<ProductsDTO> list = (List<ProductsDTO>) request.getAttribute("productlist");

                                                for (ProductsDTO products : list) {
//                                                      
                                            %>

                                            <tr>
                                                <td><%= products.getProductsID()%></td>
                                                <td><%= products.getProductsName()%></td>
                                                <td><%= products.getGender()%></td>
                                                <td><%= products.getSize()%></td>
                                                <td><%= products.getProductPrice()%></td>



                                            </tr>
                                            <% }%> 

                                        </table>       

                                    </div>
                                </div>
                                <!-- Page body end -->
                            </div>


                            </body>

                            </html>