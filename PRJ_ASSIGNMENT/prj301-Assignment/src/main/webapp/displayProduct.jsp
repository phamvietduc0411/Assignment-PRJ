<%@page import="Model.Products.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!DOCTYPE html>
<html lang="en-US" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>All Product</title>

        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
        <link rel="manifest" href="assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">

        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="css/theme.min.css" rel="stylesheet" />
        <link href="images/shirt/"



    </head>

    <body>
        <jsp:include page="/menu.jsp" flush="true" />
        <section class="py-11 bg-light-gradient border-bottom border-white border-5">
        </section>

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="py-0" id="header" style="margin-top: -23rem !important;">
            <div class="container">
                <div class="row g-0">
                    <div class="col-md-6">
                        <div class="card card-span h-100 text-white"> <img class="img-fluid" src="images/homepage/cat-item1.jpg" width="790" alt="..." />
                            <div class="card-img-overlay d-flex flex-center"> <a class="btn btn-lg btn-light" href="#nav-men-tab">For Him</a></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-span h-100 text-white"> <img class="img-fluid" src="images/homepage/cat-item2.jpg" width="790" alt="..." />
                            <div class="card-img-overlay d-flex flex-center"> <a class="btn btn-lg btn-light" href="#nav-women-tab">For Her </a></div>
                        </div>
                    </div>
                </div>
            </div><!-- end of .container-->
        </section><!-- <section> close ============================-->
        <!-- ============================================-->


        <section class="py-0">
            <div class="container">
                <div class="row h-100">
                    <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
                        <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Best Seller</h5>
                    </div>
                    <div class="col-12">
                        <div class="carousel slide" id="carouselFlashSales" data-bs-touch="false" data-bs-interval="false">
                            <div class="carousel-inner">
                                <div class="row h-100 align-items-center g-2">
                                    <%
                                        List<ProductsDTO> bestSeller = (List<ProductsDTO>) request.getAttribute("bestSeller");
                                        for (ProductsDTO products : bestSeller) {
                                    %>
                                    <div class="col-sm-6 col-md-3 mb-4 mb-md-0 h-100">

                                        <img class="img-fluid h-100 w-100 product-image" style="width: 350px !important; height: 400px !important;" src="<%= products.getImg()%>" alt="." />
                                    
                                        <div class="card-body ps-0 bg-200">
                                               <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                                            <div class="fw-bold">

                                                <span class="text-primary">$<%= products.getProductPrice()%></span>
                                            </div>
                                        </div>

                                    </div>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="py-0">
            <div class="container">
                <div class="row h-100">
                    <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
                        <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Jean</h5>
                    </div>
                    <div class="col-12">
                        <div class="carousel slide" id="carouselFlashSales" data-bs-touch="false" data-bs-interval="false">
                            <div class="carousel-inner">
                                <div class="row h-100 align-items-center g-2">
                                    <%
                                        List<ProductsDTO> jean = (List<ProductsDTO>) request.getAttribute("jean");
                                        for (ProductsDTO products : jean) {
                                    %>
                                    <div class="col-sm-6 col-md-3 mb-4 mb-md-0 h-100">

                                        <img class="img-fluid h-100 w-100 product-image" style="width: 350px !important; height: 400px !important;" src="<%= products.getImg()%>" alt="." />
                                        
                                        <div class="card-body ps-0 bg-200">
                                           <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                                            <div class="fw-bold">

                                                <span class="text-primary">$<%= products.getProductPrice()%></span>
                                            </div>
                                        </div>

                                    </div>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                                
                                
                                   <section class="py-0">
            <div class="container">
                <div class="row h-100">
                    <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
                        <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">BaggyPull</h5>
                    </div>
                    <div class="col-12">
                        <div class="carousel slide" id="carouselFlashSales" data-bs-touch="false" data-bs-interval="false">
                            <div class="carousel-inner">
                                <div class="row h-100 align-items-center g-2">
                                    <%
                                        List<ProductsDTO> baggyPull = (List<ProductsDTO>) request.getAttribute("baggyPull");
                                        for (ProductsDTO products : baggyPull) {
                                    %>
                                    <div class="col-sm-6 col-md-3 mb-4 mb-md-0 h-100">

                                        <img class="img-fluid h-100 w-100 product-image" style="width: 350px !important; height: 400px !important;" src="<%= products.getImg()%>" alt="." />
                                        
                                        <div class="card-body ps-0 bg-200">
                                           <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                                            <div class="fw-bold">

                                                <span class="text-primary">$<%= products.getProductPrice()%></span>
                                            </div>
                                        </div>

                                    </div>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


















    </main>
<jsp:include page="/footer.jsp" flush="true" />



    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="js/popper.min.js"></script>
    <script src="js/displayProduct.js"></script>
    <script src="js/is.min.js"></script>
    <!--<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="js/feather.min.js"></script>-->
    <script>
        feather.replace();
    </script>
    <script src="assets/js/theme.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
</body>

</html>
