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
    </style>
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
                    <a href="${requestScope.customer eq null?"login":"customerinfo"}"><img src="raw_views/img_2/core-img/user.svg" alt=""></a>
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
    <c:set scope="request" value="${requestScope.product}" var="p"></c:set>
    <section class="single_product_details_area d-flex align-items-center">

        <!-- Single Product Thumb -->
        <div class="product-details-img">
            <div class="img-detail"><img src="raw_views/img/${p.image}" alt=""></div>
                 
                   
            
        </div>
                
        <!-- Single Product Description -->
        <div class="single_product_desc clearfix">
            <span>${p.subcateid.name}</span>
                <h2>${p.name}</h2>
            <p class="product-price">
                                    <c:if test="${p.sale.value!=0}"> <span class="old-price">$${p.price}</span> 
                                        $${Math.round((p.price-(p.price*p.sale.value)))}</p>
                                    </c:if>
                                <c:if test="${p.sale.value==0}"> 
                                    $${Math.round(p.price)}</p>
                                    </c:if>
            <p class="product-desc">${p.short_description}</p>

            <!-- Form -->
            <form class="cart-form clearfix" method="post" action="addcart">
                <!-- Select Box -->
                <input type="hidden" name="pid" value="${p.id}"/>
                <div class="select-box d-flex mt-50 mb-30">
                    <select name="size" id="productSize" class="mr-5">
                        <c:forEach items="${p.listSize}" var="size">
                            <c:if test="${size.quantity!=0}">
                        <option value="${size.id}">Size: ${size.name}</option>
                        </c:if>
                        </c:forEach>
                    </select>

                </div>
                <!-- Cart & Favourite Box -->
                <div class="cart-fav-box d-flex align-items-center">
                    <!-- Cart -->
                    <button type="submit" name="addtocart" value="5" class="btn essence-btn">Add to cart</button>
                    <!-- Favourite -->
                    <div class="product-favourite ml-4">
                        <a href="#" class="favme fa fa-heart"></a>
                    </div>
                </div>
            </form>
                 <div class="more-des">          <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">More information</a>
  </li>

</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">${p.descript}</div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
</div></div> 
        </div>
                
    </section>
               
                
   

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