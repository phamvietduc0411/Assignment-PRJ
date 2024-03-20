<%@page import="Model.Products.ProductsDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Product Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/productDetails.css">
        <link rel="zstalk icon" type="image/x-icon" href="images/favicon.ico">
       <jsp:include page="/menu.jsp" flush="true" />

    </head>

    <body class="goto-here"> 
        
        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 ftco-animate">
                        <% ProductsDTO products = (ProductsDTO) request.getAttribute("productDetail"); %>
                        <img src="<%=products.getImg() %>" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                        <h3 style="color: #000;"><%=products.getProductsName() %></h3>
                        <p class="price"><span>$<%=products.getProductPrice() %></span></p>
      
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <div class="form-group d-flex">
                                    <div class="select-rap">

                                        <select name="" id="" class="form-control">
                                            <option value="">S</option>
                                            <option value="">M</option>
                                            <option value="">L</option>
                                            <option value="">XL</option>
                                        </select>
                                    </div>
                                    <div class="select-wrap">

                                        <select name="" id="" class="form-control">
                                            <option value="">Red</option>
                                            <option value="">Black</option>
                                            <option value="">White</option>
                                            <option value="">Yellow</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="w-100"></div>
                            <br>
                            <div class="input-group col-md-6 d-flex mb-3">
                                
                                <input type="text" id="quantity" name="quantity" class="quantity form-control input-number"
                                       value="1" min="1" max="100">
                                
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
<!--                                <p style="color: #000;">80 piece available</p>-->
                            </div>
                        </div>
                        <p><a href="./PageController?action=add&productid=<%= products.getProductsID()%>&customerid=${customer.customerID}  x" class="btn btn-black py-3 px-5 mr-2">Add to Cart</a></p>
                    </div>
                </div>
                <div class="row mt-5">

                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content bg-light" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                                 aria-labelledby="day-1-tab">
                                <div class="p-4">
                                   <section id="featured-products" class="product-store padding-large">
                                       <div class="container">
                                           <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                                               <h2 class="section-title">Recommended Product</h2>
                                               <div class="btn-wrap">
                                                   <a href="./PageController?action=view" class="d-flex align-items-center">View all products <i
                                                           class="icon icon icon-arrow-io"></i></a>
                                               </div>
                                           </div>
                                           <div class="swiper product-swiper overflow-hidden">
                                               <div class="swiper-wrapper">
                                                   <div class="swiper-slide">
                                                       <div class="product-item">
                                                           <div class="image-holder">
                                                               <img src="images/shirt/T-Shirt/T-Shirt6.jpg" alt="Books" class="product-image">
                                                           </div>
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
                                                           <div class="product-detail">
                                                               <h3 class="product-title">
                                                                   <a href="single-product.html">Short sleeve T-shirt with a round neck</a>
                                                               </h3>
                                                               <span class="item-price text-primary">$40.00</span>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="swiper-slide">
                                                       <div class="product-item">
                                                           <div class="image-holder">
                                                               <img src="images/shirt/T-Shirt/T-Shirt7.jpg" alt="Books" class="product-image">
                                                           </div>
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
                                                           <div class="product-detail">
                                                               <h3 class="product-title">
                                                                   <a href="single-product.html">Short sleeve T-shirt with print</a>
                                                               </h3>
                                                               <span class="item-price text-primary">$38.00</span>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="swiper-slide">
                                                       <div class="product-item">
                                                           <div class="image-holder">
                                                               <img src="images/shirt/T-Shirt/T-Shirt8.jpg" alt="Books" class="product-image">
                                                           </div>
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
                                                           <div class="product-detail">
                                                               <h3 class="product-title">
                                                                   <a href="single-product.html">Gossip Girl print short sleeve T-shirt</a>
                                                               </h3>
                                                               <span class="item-price text-primary">$44.00</span>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="swiper-slide">
                                                       <div class="product-item">
                                                           <div class="image-holder">
                                                               <img src="images/shirt/T-Shirt/T-Shirt9.jpg" alt="Books" class="product-image">
                                                           </div>
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
                                                           <div class="product-detail">
                                                               <h3 class="product-title">
                                                                   <a href="single-product.html">Short sleeve oversize T-shirt with metallic print</a>
                                                               </h3>
                                                               <span class="item-price text-primary">$33.00</span>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="swiper-pagination"></div>
                                       </div>
                                   </section>
                                </div>
                            </div>
                            <div class="row p-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                    
                    
                    <jsp:include page="/footer.jsp" flush="true" />


    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>

    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>

    <script src="js/aos.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/quantity.js">

    </script>
    
     <script src="js/jquery-1.11.0.min.js"></script>
  <script src="js/plugins.js"></script>
  <script src="js/script.js"></script>

</body>

</html>