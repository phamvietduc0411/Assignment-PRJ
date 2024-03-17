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


    </head>

    <body>
        <p>Login user: ${sessionScope.manager.managerID}</p>



        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <nav class="pcoded-navbar">
                    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                </nav>


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
                                                        <form class="form-material">
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ProductID</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ProductName</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Gender</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Collections</label>
                                                            </div>

                                                            <div class="form-group form-default">
                                                                <input type="password" name="footer-email" class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Size</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ProductPrice</label>
                                                            </div> 
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control"
                                                                       disabled>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">AvailableQuantity</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control"
                                                                       maxlength="6">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">StorageID</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <textarea class="form-control"></textarea>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">CategoryName</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <textarea class="form-control"></textarea>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Img</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <textarea class="form-control"></textarea>
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
                                                
                                                <a href="PageController?action=view"><h5>View All Product</h5></a>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- Page body end -->
                        </div>
                      

                        </body>

                        </html>