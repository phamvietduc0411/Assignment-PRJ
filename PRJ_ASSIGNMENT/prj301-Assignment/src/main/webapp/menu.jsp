
        
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
                                                    href="about.jsp" class="item-anchor" data-effect="About">About
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
                                                <a
                                                    href="./PageController?action=logout"
                                                    class="item-anchor" data-effect="Contact" target="_blank"> <b>Logout</b>
                                                </a>
                                            </li>        
                                        </ul>
                                    </div>
                                    <form class="search-bar" action="./PageController" method="POST" style="text-align: end; padding-left: 55%;">
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

<!--  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">-->
<!--  <link rel="stylesheet" type="text/css" media="all"-->
<!--    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->
  <link rel="stylesheet" type="text/css" href="css/vendor.css">
  <link rel="stylesheet" type="text/css" href="css/menu.css">
  <link rel="stylesheet" type="text/css" href="css/homepage.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
  <!-- script
    ================================================== -->
  <script src="js/modernizr.js"></script>