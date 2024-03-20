
<%@page import="java.util.List"%>
<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>COLLECTION</title>
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


        <section id="billboard" class="overflow-hidden">

            <button class="button-prev">
                <i class="icon icon-chevron-left"></i>
            </button>
            <button class="button-next">
                <i class="icon icon-chevron-right"></i>
            </button>
            <div class="swiper main-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"
                         style="background-image: url('images/Summerbg.png');background-repeat: no-repeat;background-size: cover;background-position: center;">
                        <div class="banner-content">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h2 class="banner-title" style="color: wheat">Summer Collection</h2>
                                        <p>Welcome to Z-stalk! Discover style, comfort, and endless fashion possibilities. Step in, explore, and let your fashion journey begin. Happy shopping!</p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide"
                         style="background-image: url('images/Fallbg.png');background-repeat: no-repeat;background-size: cover;background-position: center;">
                        <div class="banner-content">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h2 class="banner-title" style="color: cadetblue">Autumn Collection</h2>
                                        <p>Welcome to Z-stalk's Autumn Collection! Explore cozy sweaters, chic outerwear, and more. Embrace the essence of fall in style with us!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--END OF COLLECTION-->







        <section id="featured-products" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h2 class="section-title">SUMMER COLLECTION</h2>
                </div><%
                    List<ProductsDTO> menCollectionSummer = (List<ProductsDTO>) request.getAttribute("menCollectionSummer");

                    for (ProductsDTO products : menCollectionSummer) {
                        
                      

                %>
                <div class="product-item col-lg-3 col-md-4 col-sm-4">
                    <div class="image-holder">

                        <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 400px; width: 500px; ">

                    </div>
                    <div class="cart-concern">
                        <div class="cart-button d-flex justify-content-between align-items-center">
                            <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                                class="icon icon-arrow-io"></i></a>

                        </div>
                    </div>
                    <div class="product-detail">
                        <h3 class="product-title" style=" height: 100px; width: 100%; ">
                            <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                        </h3>
                        <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                    </div>
                </div>
                <% }%> 
            </div>

        </section>

        <section id="latest-collection">
            <div class="container">
                <div class="product-collection row">
                    <div class="col-lg-7 col-md-12 left-content">
                        <div class="collection-item">
                            <div class="products-thumb">
                                <img src="images/homepage/collection-item1.jpg" alt="collection item" class="large-image image-rounded">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 product-entry">
                                <div class="categories">casual collection</div>
                                <h3 class="item-title">street wear.</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim massa diam elementum.</p>
                                <div class="btn-wrap">
                                    <a href="shop.html" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12 right-content flex-wrap">
                        <div class="collection-item top-item">
                            <div class="products-thumb">
                                <img src="images/homepage/main-banner.jpg" alt="collection item" class="small-image image-rounded">
                            </div>
                            <div class="col-md-6 product-entry">
                                <div class="categories">Basic Collection</div>
                                <h3 class="item-title">Basic </h3>
                                <div class="btn-wrap">
                                    <a href="#" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="collection-item bottom-item">
                            <div class="products-thumb">
                                <img src="images/homepage/post-img6.jpg" alt="collection item" class="small-image image-rounded">
                            </div>
                            <div class="col-md-6 product-entry">
                                <div class="categories">Best Selling Product</div>
                                <h3 class="item-title" style="color: white;">woolen hat.</h3>
                                <div class="btn-wrap">
                                    <a href="#" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <section id="selling-products" class="product-store bg-light-grey padding-large">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Collection for Women</h2>
                </div>
                <ul class="tabs list-unstyled">
                    <li data-tab-target="#all" class="active tab">Spring</li>
                    <li data-tab-target="#shoes" class="tab">Summer</li>
                    <li data-tab-target="#tshirts" class="tab">Winter</li>
                    <li data-tab-target="#Autunm" class="tab">Autunm</li>
             
                </ul>
                <div class="tab-content">
                    <div id="all" data-tab-content class="active">
                        <div class="container">
                            <%
                                List<ProductsDTO> womenCollectionSpring = (List<ProductsDTO>) request.getAttribute("womenCollectionSpring");

                                for (ProductsDTO products : womenCollectionSpring) {
                            %>
                            <div class="product-item col-lg-3 col-md-4 col-sm-4">
                                <div class="image-holder">

                                    <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                                </div>
                                <div class="cart-concern">
                                    <div class="cart-button d-flex justify-content-between align-items-center">
                                        <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                                    </div>
                                </div>
                                <div class="product-detail">
                                    <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                        <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                                    </h3>
                                    <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                                </div>
                            </div>
                            <% }%> 
                        </div>
                    </div>
                    <!--END OF -->
                    <div id="shoes" data-tab-content>

                        <div class="container">
                            <%
                                List<ProductsDTO> womenCollectionSummer = (List<ProductsDTO>) request.getAttribute("womenCollectionSummer");

                                for (ProductsDTO products : womenCollectionSummer) {
                            %>
                            <div class="product-item col-lg-3 col-md-4 col-sm-4">
                                <div class="image-holder">

                                    <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                                </div>
                                <div class="cart-concern">
                                    <div class="cart-button d-flex justify-content-between align-items-center">
                                        <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                                    </div>
                                </div>
                                <div class="product-detail">
                                    <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                        <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                                    </h3>
                                    <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                                </div>
                            </div>
                            <% }%> 
                        </div>
                    </div>        
                    <!--END OF SUMMER-->


                    <div id="tshirts" data-tab-content>
                        <div class="container">
                            <%
                                List<ProductsDTO> womenCollectionWinter = (List<ProductsDTO>) request.getAttribute("womenCollectionWinter");

                                for (ProductsDTO products : womenCollectionWinter) {
                            %>
                            <div class="product-item col-lg-3 col-md-4 col-sm-4">
                                <div class="image-holder">

                                    <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                                </div>
                                <div class="cart-concern">
                                    <div class="cart-button d-flex justify-content-between align-items-center">
                                        <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                                    </div>
                                </div>
                                <div class="product-detail">
                                    <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                        <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                                    </h3>
                                    <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                                </div>
                            </div>
                            <% }%> 
                        </div>
                    </div>      
                    <!--END OF WINTER-->

                </div>
            </div>

            <div id="Autunm" data-tab-content >

                <div class="container">
                    <%
                        List<ProductsDTO> womenCollectionAutumn = (List<ProductsDTO>) request.getAttribute("womenCollectionAutumn");

                        for (ProductsDTO products : womenCollectionAutumn) {
                    %>
                    <div class="product-item col-lg-3 col-md-4 col-sm-4">
                        <div class="image-holder">

                            <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                        </div>
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                            </div>
                        </div>
                        <div class="product-detail">
                            <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                            </h3>
                            <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                        </div>
                    </div>
                    <% }%> 
                </div>
            </div>
        </div>

        <!--                           END OF AUTUMN-->

    </div>
</div>

</div>
</section>

<!--END COLLECTION FOR WOMEN-->



<section id="testimonials" class="padding-large no-padding-bottom">
    <div class="container">
        <div class="reviews-content">
            <div class="row d-flex flex-wrap">
                <div class="col-md-2">
                    <div class="review-icon">
                        <i class="icon icon-right-quote"></i>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="swiper testimonial-swiper overflow-hidden">
                        <img src="images/Slogan.jpg"
                    </div>
                    <div class="swiper-arrows">
                        <button class="prev-button">
                            <i class="icon icon-arrow-left"></i>
                        </button>
                        <button class="next-button">
                            <i class="icon icon-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<section id="selling-products" class="product-store bg-light-grey padding-large">
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">Collection for Men</h2>
        </div>
        <ul class="tabs list-unstyled">
            <li data-tab-target="#Spring" class="active tab">Spring</li>
            <li data-tab-target="#Summer" class="tab">Summer</li>
            <li data-tab-target="#Winter" class="tab">Winter</li>
            <li data-tab-target="#Autumn" class="tab">Autumn</li>
        </ul>
        <div class="tab-content">
            <div id="Spring" data-tab-content class="active">
                <div class="container">
                    <%
                        List<ProductsDTO> menCollectionSpring = (List<ProductsDTO>) request.getAttribute("menCollectionSpring");

                        for (ProductsDTO products : menCollectionSpring) {
                    %>
                    <div class="product-item col-lg-3 col-md-4 col-sm-4">
                        <div class="image-holder">

                            <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                        </div>
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                            </div>
                        </div>
                        <div class="product-detail">
                            <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                            </h3>
                            <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                        </div>
                    </div>
                    <% }%> 
                </div>
            </div>
            <!--END OF -->
            <div id="Summer" data-tab-content>

                <div class="container">
                    <%
                        List<ProductsDTO> MenCollectionSummer = (List<ProductsDTO>) request.getAttribute("menCollectionSummer");

                        for (ProductsDTO products : MenCollectionSummer) {
                    %>
                    <div class="product-item col-lg-3 col-md-4 col-sm-4">
                        <div class="image-holder">

                            <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                        </div>
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                            </div>
                        </div>
                        <div class="product-detail">
                            <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                            </h3>
                            <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                        </div>
                    </div>
                    <% }%> 
                </div>
            </div>        
            <!--END OF SUMMER-->


            <div id="Winter" data-tab-content >
                <div class="container">
                    <%
                        List<ProductsDTO> menCollectionWinter = (List<ProductsDTO>) request.getAttribute("menCollectionWinter");

                        for (ProductsDTO products : menCollectionWinter) {
                    %>
                    <div class="product-item col-lg-3 col-md-4 col-sm-4">
                        <div class="image-holder">

                            <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                        </div>
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                              <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                            </div>
                        </div>
                        <div class="product-detail">
                            <h3 class="product-title" style=" height: 100px; width: 100%; ">
                                <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                            </h3>
                            <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                        </div>
                    </div>
                    <% }%> 
                </div>
            </div>      
            <!--END OF WINTER-->

        </div>
    </div>

    <div id="Autumn" data-tab-content>

        <div class="container">
            <%
                List<ProductsDTO> menCollectionAutumn = (List<ProductsDTO>) request.getAttribute("menCollectionAutumn");

                for (ProductsDTO products : menCollectionAutumn) {
            %>
            <div class="product-item col-lg-3 col-md-4 col-sm-4">
                <div class="image-holder">

                    <img src="<%= products.getImg()%>" alt="Books" class="product-image" style="height: 420px; width: 550px; ">

                </div>
                <div class="cart-concern">
                    <div class="cart-button d-flex justify-content-between align-items-center">
                        <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>

                    </div>
                </div>
                <div class="product-detail">
                    <h3 class="product-title" style=" height: 100px; width: 100%; ">
                        <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                    </h3>
                    <div class="item-price text-primary">$ <%= products.getProductPrice()%></div>
                </div>
            </div>
            <% }%> 
        </div>
    </div>
</div>

<!--                           END OF AUTUMN-->

</div>
</div>

</div>
</div>
</section>


<!--END COLLECTION OF MEN-->

<section id="flash-sales" class="product-store padding-large">

    <div class="container">
        <div class="section-header">
            <h2 class="section-title">Flash sales</h2>
        </div>
        <div class="swiper product-swiper flash-sales overflow-hidden">

            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="product-item">
                        <img src="images/homepage/selling-products9.jpg" alt="Books" class="product-image">
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                        class="icon icon-arrow-io"></i>
                                </button>
                                <button type="button" class="view-btn tooltip
                                        d-flex">
                                   
                            </div>
                        </div>
                        <div class="discount">10% Off</div>
                        <div class="product-detail">
                            <h3 class="product-title">
                                <a href="">Full sleeve cover shirt</a>
                            </h3>
                            <div class="item-price text-primary">
                                <del class="prev-price">$50.00</del>$40.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="product-item">
                        <img src="images/homepage/selling-products10.jpg" alt="Books" class="product-image">
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                        class="icon icon-arrow-io"></i>
                                </button>
                                <button type="button" class="view-btn tooltip
                                        d-flex">
                                    <i class="icon icon-screen-full"></i>
                                    <span class="tooltip-text">Quick view</span>
                                </button>
                                <button type="button" class="wishlist-btn">
                                    <i class="icon icon-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="discount">10% Off</div>
                        <div class="product-detail">
                            <h3 class="product-title">
                                <a href="single-product.html">Long Sleeve T-shirt</a>
                            </h3>
                            <div class="item-price text-primary">
                                <del class="prev-price">$50.00</del>$40.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="product-item">
                        <img src="images/homepage/selling-products11.jpg" alt="Books" class="product-image">
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                        class="icon icon-arrow-io"></i>
                                </button>
                                <button type="button" class="view-btn tooltip
                                        d-flex">
                                    <i class="icon icon-screen-full"></i>
                                    <span class="tooltip-text">Quick view</span>
                                </button>
                                <button type="button" class="wishlist-btn">
                                    <i class="icon icon-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="discount">10% Off</div>
                        <div class="product-detail">
                            <h3 class="product-title">
                                <a href="single-product.html">Grey Check Coat</a>
                            </h3>
                            <div class="item-price text-primary">
                                <del class="prev-price">$55.00</del>$45.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="product-item">
                        <img src="images/homepage/selling-products12.jpg" alt="Books" class="product-image">
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                        class="icon icon-arrow-io"></i>
                                </button>
                                <button type="button" class="view-btn tooltip
                                        d-flex">
                                    <i class="icon icon-screen-full"></i>
                                    <span class="tooltip-text">Quick view</span>
                                </button>
                                <button type="button" class="wishlist-btn">
                                    <i class="icon icon-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="discount">10% Off</div>
                        <div class="product-detail">
                            <h3 class="product-title">
                                <a href="single-product.html">Silk White Shirt</a>
                            </h3>
                            <div class="item-price text-primary">
                                <del class="prev-price">$45.00</del>$35.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="product-item">
                        <img src="images/homepage/selling-products8.jpg" alt="Books" class="product-image">
                        <div class="cart-concern">
                            <div class="cart-button d-flex justify-content-between align-items-center">
                                <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                        class="icon icon-arrow-io"></i>
                                </button>
                                <button type="button" class="view-btn tooltip
                                        d-flex">
                                    <i class="icon icon-screen-full"></i>
                                    <span class="tooltip-text">Quick view</span>
                                </button>
                                <button type="button" class="wishlist-btn">
                                    <i class="icon icon-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="discount">10% Off</div>
                        <div class="product-detail">
                            <h3 class="product-title">
                                <a href="single-product.html">Blue Jeans pant</a>
                            </h3>
                            <div class="item-price text-primary">
                                <del class="prev-price">$45.00</del>$35.00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>

        </div>
    </div>
</section>

<section class="shoppify-section-banner">
    <div class="container">
        <div class="product-collection">
            <div class="left-content collection-item">
                <div class="products-thumb">
                    <img src="images/homepage/model.jpg" alt="collection item" class="large-image image-rounded">
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 product-entry">
                    <div class="categories">Denim collection</div>
                    <h3 class="item-title">The casual selection.</h3>
                    <p>Vel non viverra ligula odio ornare turpis mauris. Odio aliquam, tincidunt ut vitae elit risus. Tempor
                        egestas condimentum et ac rutrum dui, odio.</p>
                    <div class="btn-wrap">
                        <a href="shop.html" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="quotation" class="align-center padding-large">
    <div class="inner-content">
        <h2 class="section-title divider">Quote of the day</h2>
        <blockquote>
            <q>It's true, I don't like the whole cutoff-shorts-and-T-shirt look, but I think you can look fantastic in
                casual clothes.</q>
            <div class="author-name">- Dr. Seuss</div>
        </blockquote>
    </div>
</section>



<section id="shipping-information">
    <hr>
    <div class="container">
        <div class="row d-flex flex-wrap align-items-center justify-content-between">
            <div class="col-md-3 col-sm-6">
                <div class="icon-box">
                    <i class="icon icon-truck"></i>
                    <h4 class="block-title">
                        <strong>Free shipping</strong> Over $200
                    </h4>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="icon-box">
                    <i class="icon icon-return"></i>
                    <h4 class="block-title">
                        <strong>Money back</strong> Return within 7 days
                    </h4>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="icon-box">
                    <i class="icon icon-tags1"></i>
                    <h4 class="block-title">
                        <strong>Buy 4 get 5th</strong> 50% off
                    </h4>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="icon-box">
                    <i class="icon icon-help_outline"></i>
                    <h4 class="block-title">
                        <strong>Any questions?</strong> experts are ready
                    </h4>
                </div>
            </div>
        </div>
    </div>
    <hr>
</section>

<footer id="footer">
    <div class="container">
        <div class="footer-menu-list">
            <div class="row d-flex flex-wrap justify-content-between">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-menu">
                        <h5 class="widget-title">Ultras</h5>
                        <ul class="menu-list list-unstyled">
                            <li class="menu-item">
                                <a href="about.html">About us</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Conditions </a>
                            </li>
                            <li class="menu-item">
                                <a href="blog.html">Our Journals</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Careers</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Affiliate Programme</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Ultras Press</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-menu">
                        <h5 class="widget-title">Customer Service</h5>
                        <ul class="menu-list list-unstyled">
                            <li class="menu-item">
                                <a href="faqs.html">FAQ</a>
                            </li>
                            <li class="menu-item">
                                <a href="contact.html">Contact</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Privacy Policy</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Returns & Refunds</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Cookie Guidelines</a>
                            </li>
                            <li class="menu-item">
                                <a href="#">Delivery Information</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-menu">
                        <h5 class="widget-title">Contact Us</h5>
                        <p>Do you have any questions or suggestions? <a href="#" class="email">ourservices@ultras.com</a>
                        </p>
                        <p>Do you need assistance? Give us a call. <br>
                            <strong>+57 444 11 00 35</strong>
                        </p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-menu">
                        <h5 class="widget-title">Forever 2018</h5>
                        <p>Cras mattis sit ornare in metus eu amet adipiscing enim. Ullamcorper in orci, ultrices integer eget
                            arcu. Consectetur leo dignissim lacus, lacus sagittis dictumst.</p>
                        <div class="social-links">
                            <ul class="d-flex list-unstyled">
                                <li>
                                    <a href="#">
                                        <i class="icon icon-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon icon-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon icon-youtube-play"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon icon-behance-square"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
</footer>

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
