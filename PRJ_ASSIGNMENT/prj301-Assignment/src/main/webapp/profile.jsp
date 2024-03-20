<%-- 
    Document   : profile
    Created on : 20-03-2024, 00:03:53
    Author     : Acer
--%>

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
        <header id="header">
            <form action="./PageController" method="GET">
                <input name="action" value="search" hidden>
                <input type="text" name="keyword" >
                <button type="submit" value="Search">Search</button>
            </form>
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
                                                    href="about.jsp" class="item-anchor" data-effect="About">About
                                                </a>
                                            </li>

                                            <li>
                                                <a 
                                                    href="cart.jsp" class="item-anchor" data-effect="Contact">Cart
                                                </a>
                                            </li>
                                            
                                            <li class="menu-item has-sub">
                                                <a href="./PageController?action=profile" class="item-anchor d-flex align-item-center" data-effect="Blog">Profile<i
                                                        class="icon icon-chevron-down"></i>
                                                </a>
                                            </li>
                                       
                                            <!--logout customer-->     
                                            <li>
                                                <a
                                                    href="./PageController?action=loguot"
                                                    class="item-anchor" data-effect="Contact" target="_blank"> <b>Logout</b>
                                                </a>
                                            </li>        
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
<!--        <section id="billboard" class="overflow-hidden">

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
        </section>-->
        <div>
            <h1>Customer Profile</h1>
        </div>
        <div>
            <p>Customer ID: ${customers.customerID}</p>
        </div>
        <div>
            <p>Username: ${customer.username}</p>
        </div>
        <div>
            <p>Name: ${customer.CustomerName}</p>
        </div>
        <div>
            <p>Phone Number: ${customer.phoneNumber}</p>
        </div>
        <div>
            <p>Address: ${customer.address}</p>
        </div>
        
        <div>
            <p>Gender: ${customer.gender}</p>
        </div>
        
        <div>
            <p>Email: ${customer.email}</p>
        </div>
        
        
        
        
        
        
        
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/script.js"></script>
        
    </body>
</html>