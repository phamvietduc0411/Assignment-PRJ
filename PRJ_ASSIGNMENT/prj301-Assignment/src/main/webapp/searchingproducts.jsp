
<%@page import="java.util.List"%>
<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Searching Product</title>
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
        <!--        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
                      rel="stylesheet">-->
        <!-- script
          ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>

    <body>
        <jsp:include page="/menu.jsp" flush="true" />
        <div class="preloader-wrapper">
            <div class="preloader">
            </div>            
        </div>


        <section id="featured-products" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h2 class="section-title">Product You looking for</h2>
                </div>
                                        <% List<ProductsDTO> result = (List<ProductsDTO>)request.getAttribute("result");
                        for (ProductsDTO product: result) {                     
%>
                 <div class="product-item col-lg-3 col-md-4 col-sm-1 ">

                        <div class="image-holder">
                            <img src="<%= product.getImg() %>" alt="Books" class="product-image" style="height: 400px; width: 500px;  ">

                        </div>
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                        class="icon icon-arrow-io"></i>
                                </button>
                            </div>
                        </div>
                        <div class="product-detail">
                            <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                <a href="single-product.html"><%= product.getProductsName() %></a>
                            </h3>
                            <div class="item-price text-primary">$<%= product.getProductPrice() %></div>
                        </div>
                           
                    </div>
                     <%}%>     
            </div>
                       
                    
                    </section>

                   

                    <div id="footer-bottom">
                        <div class="container">
                            <div class="d-flex align-items-center flex-wrap justify-content-between">
                                <div class="copyright">
                                    <p>Freebies by <a href="https://templatesjungle.com/">Templates Jungle</a>
                                    </p>
                                </div>
                                <div class="payment-method">
                                    <p>Payment options :</p>
                                    <div class="card-wrap">
                                        <img src="images/homepage/visa-icon.jpg" alt="visa">
                                        <img src="images/homepage/mastercard.png" alt="mastercard">
                                        <img src="images/homepage/american-express.jpg" alt="american-express">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="js/jquery-1.11.0.min.js"></script>
                    <script src="js/plugins.js"></script>
                    <script src="js/script.js"></script>
                    </body>

                    </html>
