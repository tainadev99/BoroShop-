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

</head>

<body>
    <!-- ##### Header Area Start ##### -->
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
    <!-- ##### Header Area End ##### -->

    <!-- ##### Right Side Cart Area ##### -->
    

        
    <!-- ##### Right Side Cart End ##### -->

    <!-- ##### Welcome Area Start ##### -->
    <section class="welcome_area bg-img background-overlay" style="background-image: url(raw_views/img_2/bg-img/banner-main.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Welcome Area End ##### -->

    <!-- ##### Top Catagory Area Start ##### -->
    <div class="top_catagory_area section-padding-80 clearfix">
        <div class="container">
            <div class="row justify-content-center">
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(raw_views/img_2/bg-img/banner-clothes2.jpg);">
                        <div class="catagory-content">
                            <a href="shop?cate=4">Clothing</a>
                        </div>
                    </div>
                </div>
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(raw_views/img_2/bg-img/banner-shoes2.jpg);">
                        <div class="catagory-content">
                            <a href="shop?cate=1">Shoes</a>
                        </div>
                    </div>
                </div></div>
            <div class="chia" style="height: 50px"></div>
                <div class="row justify-content-center">
                <!-- Single Catagory -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(raw_views/img_2/bg-img/banner-ball.jpg);">
                        <div class="catagory-content">
                            <a href="shop?cate=2">Balls</a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(raw_views/img_2/bg-img/bg-4.jpg);">
                        <div class="catagory-content">
                            <a href="shop?cate=5">Accessories</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Top Catagory Area End ##### -->

    <!-- ##### CTA Area Start ##### -->
    
    <!-- ##### CTA Area End ##### -->

    <!-- ##### New Arrivals Area Start ##### -->
    <section class="new_arrivals_area section-padding-80 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <h2>Hot Sale</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="popular-products-slides owl-carousel">

                        <!-- Single Product -->
                        <c:forEach items="${requestScope.list}" var="p">
                            <c:if test="${p.sale.value!=0}">
                                <c:if test="${!p.isOutOfStock}">
                            <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="raw_views/img/${p.image}" alt="">
                                <!-- Hover Thumb -->
                                <c:if test="${p.sale.value!=0}"><div class="product-badge offer-badge">
                                    <span>-${p.sale.name}</span>
                                </div>
                                </c:if>
                                
                                <!-- Favourite -->
                                <div class="product-favourite">
                                    <a href="#" class="favme fa fa-heart"></a>
                                </div>
                            </div>
                            <!-- Product Description -->
                            <div class="product-description">
                                <span>BASKETBALL STORE</span>
                                <a href="product?pid=${p.id}">
                                    <h6>${p.name}</h6>
                                </a>
                                <p class="product-price">
                                    <c:if test="${p.sale.value!=0}"> <span class="old-price">$${p.price}</span> 
                                        $${Math.round((p.price-(p.price*p.sale.value)))}</p>
                                    </c:if>
                                <c:if test="${p.sale.value==0}"> 
                                    $${Math.round(p.price)}</p>
                                    </c:if>
                                <!-- Hover Content -->
                                <div class="hover-content">
                                    <!-- Add to Cart -->
                                    <div class="add-to-cart-btn">
                                        <a href="product?pid=${p.id}" class="btn essence-btn">View more</a>
                                    </div>
                                </div>
                            </div>
                        </div></c:if>
                            </c:if>
                        </c:forEach>
                        
                    

                     
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### New Arrivals Area End ##### -->


    <!-- ##### Brands Area End ##### -->

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