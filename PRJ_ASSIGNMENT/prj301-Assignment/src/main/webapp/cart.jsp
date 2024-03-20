<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shopping cart</title>

        <!-- Google Font -->
        <link rel="zstalk icon" type="image/x-icon" href="images/favicon.ico">
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/cart.css" type="text/css">

        <style>
            h1 {
                text-align: center; 
                margin-top: 50px; 
                margin-bottom: 50px; 
                font-weight: 600;
            }
            productImg{
                height: 50px;
                width: 90px;
            }
        </style>
    </head>
    <jsp:include page="/menu.jsp" flush="true" />
    <body>   

        <h1 >Shopping Cart</h1>
        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th >Products</th>
                                        <th >ProductsName</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Loop through each cart item -->
                                <c:forEach items="${cartItems}" var="item">
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img style="height: 180px; width: 140px" src="images/paint/baggy/baggy1.jpg" alt="${item.productName}">

                                        </td>
                                        <td 
                                            <h5>${item.productName}  produc name</h5></td>
                                        <td class="shoping__cart__price">
                                            $${item.price}
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <h4>1</h4>

                                                </div>
                                        </td>
                                        <td class="shoping__cart__total">
                                            $${item.total}
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="homePage.jsp" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            <a href="./CartController?action=update" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                                Upadate Cart</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__continue">
                            <div class="shoping__discount">
                                <h5>Discount Codes</h5>
                                <form action="./CartController?action=discount">
                                    <input type="text" placeholder="Enter your coupon code">
                                    <button type="submit" class="site-btn">APPLY COUPON</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <li>Subtotal <span>$454.98</span></li>
                                <li>Total <span>$454.98</span></li>
                            </ul>
                            <a href="./CartController?action=setBill" class="primary-btn">PROCEED TO CHECKOUT</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->



        <!-- Js Plugins -->
        <script src="js/jquery-3.0.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/cart.js"></script>


    </body>
    <jsp:include page="/footer.jsp" flush="true" />

</html>