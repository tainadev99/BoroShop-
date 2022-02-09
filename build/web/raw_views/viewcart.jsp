<%-- 
    Document   : header
    Created on : Nov 12, 2019, 2:56:56 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>BASKETBALL STORE</title>

    <!-- Favicon  -->
    <link rel="icon" href="raw_views/img_2/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="raw_views/css/core-style.css">
    <link rel="stylesheet" href="raw_views/style.css">
    <style>
        .product-details-img img{
            width: 600px;
            height: 600px;
            
        }
        .product-details-img{
            margin-bottom: 300px;
            height: 500px;
            margin-left: 150px;
 
        }
        .img-detail{
            margin-bottom: 10px;
        }
        tbody img{
            width: 50px;
            height: 50px;
        }
        .bloc_left_price {
    color: #c01508;
    text-align: center;
    font-weight: bold;
    font-size: 150%;
}
.category_block li:hover {
    background-color: #007bff;
}
.category_block li:hover a {
    color: #ffffff;
}
.category_block li a {
    color: #343a40;
}
.add_to_cart_block .price {
    color: #c01508;
    text-align: center;
    font-weight: bold;
    font-size: 200%;
    margin-bottom: 0;
}
.add_to_cart_block .price_discounted {
    color: #343a40;
    text-align: center;
    text-decoration: line-through;
    font-size: 140%;
}
.product_rassurance {
    padding: 10px;
    margin-top: 15px;
    background: #ffffff;
    border: 1px solid #6c757d;
    color: #6c757d;
}
.product_rassurance .list-inline {
    margin-bottom: 0;
    text-transform: uppercase;
    text-align: center;
}
.product_rassurance .list-inline li:hover {
    color: #343a40;
}
.reviews_product .fa-star {
    color: gold;
}
.pagination {
    margin-top: 20px;
}
    </style>
</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <c:set scope="request" value="${requestScope.product}" var="p"></c:set>
       <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="home">BASKETBALL STORE</a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="shop">Shop</a>
                                <div class="megamenu">
                                    <c:forEach items="${requestScope.listcate}" var="cate">
                                    <ul class="single-mega cn-col-4">
                                        <li class="title"><a href="shop?cate=${cate.id}">${cate.name}</a></li>
                                        <c:forEach items="${cate.listSub}" var="sub">
                                        <li><a href="shop?subcate=${sub.id}">${sub.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                    </c:forEach>
<!--                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Men's Collection</li>
                                        <li><a href="shop.html">T-Shirts</a></li>
                                        <li><a href="shop.html">Polo</a></li>
                                        <li><a href="shop.html">Shirts</a></li>
                                        <li><a href="shop.html">Jackets</a></li>
                                        <li><a href="shop.html">Trench</a></li>
                                    </ul>
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Kid's Collection</li>
                                        <li><a href="shop.html">Dresses</a></li>
                                        <li><a href="shop.html">Shirts</a></li>
                                        <li><a href="shop.html">T-shirts</a></li>
                                        <li><a href="shop.html">Jackets</a></li>
                                        <li><a href="shop.html">Trench</a></li>
                                    </ul>-->
                                </div>
                            </li>
                            <li><a href="#">Brand</a>
                                <ul class="dropdown">
                                    <c:forEach items="${requestScope.listbrand}" var="brand">
                                        <li><a href="shop?brand=${brand.id}">${brand.name}</a></li>
                                    </c:forEach>
                                    
                                    
                                </ul>
                            </li>
                            <li><a href="contact">Contact</a></li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form action="shop" method="post">
                        <input type="search" name="name" id="headerSearch" placeholder="Type for search">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <!-- Favourite Area -->
                <div class="favourite-area">
                    <a href="#"><img src="raw_views/img_2/core-img/heart.svg" alt=""></a>
                </div>
                <!-- User Login Info -->
                <div class="user-login-info">
                    <a href="${sessionScope.customer eq null?"login":"profile"}"><img src="raw_views/img_2/core-img/user.svg" alt=""></a>
                </div>
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href="viewcart" id="essenceCartBtn"><img src="raw_views/img_2/core-img/bag.svg" alt=""> <span>
                            <c:if test="${sessionScope.cart ne null}">
                                <c:if test="${sessionScope.cart.size!=0}">
                                ${sessionScope.cart.size}</c:if>
                            </c:if>
                        </span></a>
                    
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">
            <c:if test="${requestScope.message ne null}" >NOT ENOUGH QUANTITY</c:if>
            <c:if test="${requestScope.message eq null}" >VIEW YOUR CART</c:if>
           </h1>
     </div>
</section>
<form action="viewcart" method="POST">
<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Size</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col" class="text-right">Price</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.cart.lines}" var="p">
                        <tr>
                            <td><img src="raw_views/img/${p.product.intfo.image}" /> </td>
                            <td>${p.product.intfo.name}</td>
                            <td>${p.product.size.name}</td>
                            <td><input  name="quantity_${p.id}" class="form-control" type="number" value="${p.quantity}" /></td>
                            <td class="text-right">$${Math.round(p.product.intfo.realprice*p.quantity)}</td>
                            <td class="text-right"><button onclick="return confirm('Do you want delete?')" type="submit" name="action" value="delete_${p.id}" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Sub-Total</td>
                            <td class="text-right">$${requestScope.cart.total}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Shipping</td>
                            <td class="text-right">Free</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right"><strong>$${requestScope.cart.total}</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-4  col-md-4">
                    <button type="submit" name="action" value="continue" class="btn btn-block btn-light">Continue Shopping</button>
                </div>
                <div class="col-sm-4 col-md-4 text-right">
                    <button onload="myfunc();" type="submit"  name="action" value="update" class="btn btn-lg btn-block btn-success text-uppercase">Update Cart</button>
                </div>
                <div class="col-sm-4 col-md-4 text-right">
                    <button type="submit" name="action" value="checkout" class="btn btn-lg btn-block btn-success text-uppercase">Checkout</button>
                </div>
            </div>
        </div>
                        
    </div>
</div>
</form>
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="#"><img src="raw_views/img_2/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <ul>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area mb-30">
                        <ul class="footer_widget_menu">
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Payment Options</a></li>
                            <li><a href="#">Shipping and Delivery</a></li>
                            <li><a href="#">Guides</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Use</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row align-items-end">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area">
                        <div class="footer_heading mb-30">
                            <h6>Subscribe</h6>
                        </div>
                        <div class="subscribtion_form">
                            <form action="#" method="post">
                                <input type="email" name="mail" class="mail" placeholder="Your email here">
                                <button type="submit" class="submit"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area">
                        <div class="footer_social_area">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>

<div class="row mt-5">
                <div class="col-md-12 text-center">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>

        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->
    <script>

    </script>
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="raw_views/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="raw_views/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="raw_views/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="raw_views/js/plugins.js"></script>
    <!-- Classy Nav js -->
    <script src="raw_views/js/classy-nav.min.js"></script>
    <!-- Active js -->
    <script src="raw_views/js/active.js"></script>

</body>

</html>