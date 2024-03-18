<%-- 
    Document   : searchingproducts
    Created on : 18-03-2024, 23:19:51
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Searching Product</title>
    </head>
    <body>
        <section id="featured-products" class="product-store padding-large">
            <div class="container">
                <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                    <h2 class="section-title">Product you looking for</h2>
                    <div class="btn-wrap">
                        <a href="displayProduct.jsp" class="d-flex align-items-center">View all products <i
                                class="icon icon icon-arrow-io"></i></a>
                    </div>
                </div>
                <div class="swiper product-swiper overflow-hidden">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="product-item">
                                <div class="image-holder">
                                    <img src="images/shirt/T-Shirt/T-Shirt1.jpg" alt="Books" class="product-image">
                                </div>
                                <div class="cart-concern">
                                    <div class="cart-button d-flex justify-content-between align-items-center">
                                        <button type="button" class="btn-wrap cart-link d-flex align-items-center">add to cart <i
                                                class="icon icon-arrow-io"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-detail">
                                    <h3 class="product-title">
                                        <a href="PageController?action=productDetails&CategoryID=31031&size=M">T-Shirt-Bershika1</a>
                                    </h3>
                                    <span class="item-price text-primary">$40.00</span>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="product-item">
                                <div class="image-holder">
                                    <img src="images/homepage/product-item2.jpg" alt="Books" class="product-image">
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
                                        <a href="single-product.html">Volunteer Half blu</a>
                                    </h3>
                                    <span class="item-price text-primary">$38.00</span>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="product-item">
                                <div class="image-holder">
                                    <img src="images/homepage/product-item3.jpg" alt="Books" class="product-image">
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
                                        <a href="single-product.html">Double yellow shirt</a>
                                    </h3>
                                    <span class="item-price text-primary">$44.00</span>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="product-item">
                                <div class="image-holder">
                                    <img src="images/homepage/product-item4.jpg" alt="Books" class="product-image">
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
                                        <a href="single-product.html">Long belly grey pant</a>
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
    </body>
</html>
