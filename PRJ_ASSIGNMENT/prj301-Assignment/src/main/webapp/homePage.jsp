<%@page import="java.util.List"%>
<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>ZStalk-Shop</title>
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

        <div class="preloader-wrapper">
            <div class="preloader">
            </div>            
        </div>


        <h3> Hello  ${sessionScope.customer.username}</h3>
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
                                                    href="./PageController?action=load&customerid=${customer.customerID}" class="item-anchor" data-effect="Contact">Cart
                                                </a>
                                            </li>

                                            <li class="menu-item has-sub">
                                                <a href="./PageController?action=profile&cusId=${sessionScope.customer.customerID}" class="item-anchor d-flex align-item-center" data-effect="Blog">Profile<i
                                                        class="icon icon-chevron-down"></i>
                                                </a>
                                            </li>

                                            <!--logout customer-->     
                                            <li>
                                                <a  href="./PageController?action=logout"  class="item-anchor" data-effect="Contact" > <b>Logout</b>


                                                </a>
                                            </li>        
                                        </ul>
                                    </div>
                                    <form class="search-bar" action="./PageController" method="POST" style="text-align: end;">
                                        <input name="action" value="search" hidden>
                                        <input type="text" name="keyword" >
                                        <button type="submit" value="Search">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </header>

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
                                        <div class="btn-wrap">
                                            <a href="./PageController?action=collection" class="btn btn-light btn-medium d-flex align-items-center" tabindex="0">Shop it
                                                now <i class="icon icon-arrow-io"></i>
                                            </a>
                                        </div>
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
                                        <div class="btn-wrap">
                                            <a href="./PageController?action=collection" class="btn btn-light btn-light-arrow btn-medium d-flex align-items-center"
                                               tabindex="0">Shop it now <i class="icon icon-arrow-io"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="featured-products" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h2 class="section-title">T-Shirt</h2>
                    <div class="btn-wrap">
                        <a href="./PageController?action=view" class="d-flex align-items-center">View all products <i
                                class="icon icon icon-arrow-io"></i></a>
                    </div>
                </div>
                <%
                    List<ProductsDTO> tShirtList = (List<ProductsDTO>) request.getAttribute("tShirtList");

                    for (ProductsDTO products : tShirtList) {
                %>

                <div class="product-item col-lg-3 col-md-6 col-sm-6">

                    <div class="image-holder">

                        <img src="<%= products.getImg()%>" alt="Books" class="product-image">
                    </div>
                    <div class="cart-concern">
                        <div class="cart-button d-flex justify-content-between align-items-center">
                            <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                                    class="icon icon-arrow-io"></i></a>


                        </div>
                    </div>
                    <div class="product-detail">
                        <h3 class="product-title">
                            <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                        </h3>
                        <div class="item-price text-primary">$50.00</div>
                    </div>
                </div>
                <%}%>
            </div>

        </div>

        <div class="swiper-pagination"></div>
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
                        <img src="images/homepage/banner-image3.jpg" alt="collection item" class="small-image image-rounded">
                    </div>
                    <div class="col-md-6 product-entry">
                        <div class="categories">Basic Collection</div>
                        <h3 class="item-title">Basic shoes.</h3>
                        <div class="btn-wrap">
                            <a href="shop.html" class="d-flex align-items-center"> Coming soon<i class="icon icon-arrow-io"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="collection-item bottom-item">
                    <div class="products-thumb">
                        <img src="images/homepage/collection-item3.jpg" alt="collection item" class="small-image image-rounded">
                    </div>
                    <div class="col-md-6 product-entry">
                        <div class="categories">Best Selling Product</div>
                        <h3 class="item-title">woolen hat.</h3>
                        <div class="btn-wrap">
                            <a href="#" class="d-flex align-items-center">Coming soon <i class="icon icon-arrow-io"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="featured-products" class="product-store padding-large">
    <div class="container">
        <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
            <h2 class="section-title">Sweater</h2>
            <div class="btn-wrap">
                <a href="./PageController?action=view" class="d-flex align-items-center">View all products <i
                        class="icon icon icon-arrow-io"></i></a>
            </div>
        </div>
        <%
            List<ProductsDTO> sweaterList = (List<ProductsDTO>) request.getAttribute("sweaterList");

            for (ProductsDTO products : sweaterList) {
        %>

        <div class="product-item col-lg-3 col-md-6 col-sm-6">

            <div class="image-holder">

                <img style="height: 500px; width: 500px;"  src="<%= products.getImg()%>" alt="Books" class="product-image">
            </div>
            <div class="cart-concern">
                <div class="cart-button d-flex justify-content-between align-items-center">
                    <a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}">add to cart <i
                            class="icon icon-arrow-io"></i></a>


                </div>
            </div>
            <div class="product-detail">
                <h3 class="product-title">
                    <a href="PageController?action=productDetails&productID=<%= products.getProductsID()%>"><%= products.getProductsName()%></a>
                </h3>
                <div class="item-price text-primary">$50.00</div>
            </div>
        </div>
        <%}%>
    </div>

</div>

<div class="swiper-pagination"></div>
</div>
</section>



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

                            </div>
                        </div>
                        <div class="discount">10% Off</div>
                        <div class="product-detail">
                            <h3 class="product-title">
                                <a href="single-product.html">Full sleeve cover shirt</a>
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
                                >
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

<hr>


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
