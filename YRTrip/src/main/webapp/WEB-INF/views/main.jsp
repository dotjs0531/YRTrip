<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>YOUR REAL TRIP:-)</title>
    <!--  bootstrap css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!--  font Awesome Css  -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <!--    stylesheet for fonts-->
    <link href="resources/fonts/stylesheet.css" rel="stylesheet">
    <!-- Reset css-->
    <link href="resources/css/reset.css" rel="stylesheet">

    <!--slick css-->
    <link href="resources/css/slick.css" rel="stylesheet">
    <!--  owl-carousel css -->
    <link href="resources/css/owl.carousel.css" rel="stylesheet">
    <!--  YTPlayer css For Background Video -->
    <link href="resources/css/jquery.mb.YTPlayer.min.css" rel="stylesheet">
    <!--  style css  -->
    <link rel="stylesheet" href="resources/css/meanmenu.css">
    <link href="resources/style.css" rel="stylesheet">
    <!--  Responsive Css  -->
    <link href="resources/css/responsive.css" rel="stylesheet">

    <!--  browser campatibel css files-->
    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>    
   <!--start header area-->
    <div id="preloader"></div>
    <section class="header_area" id="home">
        <!--   start logo & menu markup    -->
        <div class="logo_menu" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-lg-2 col-sm-2 col-xs-6">
                        <div class="logo">
                            <a href="main"><img src="resources/img/logo-oran.png" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-6 col-md-offset-1 col-sm-7 col-lg-offset-1 col-lg-6 mobMenuCol">
                        <nav class="navbar">
                            <!-- Collect the nav links, forms, and other content for toggling -->
                                <ul class="nav navbar-nav navbar-right menu">
                                    <li class="current-menu-item"><a href="main">홈 </a></li>
                                    <li><a href="getTravelBoardList">여행정보</a></li>
                                    <li><a href="getPartnerList">동행구하기</a></li>
                                    <li><a href="getProductList">중고상품</a></li>
                                </ul>
                            <!-- /.navbar-collapse -->
                        </nav>
                    </div>
               <c:if test="${empty sessionScope.login}">
                    <div class="col-md-3 col-sm-3 col-xs-4 col-lg-3 signup">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="popbutton">login</a></li>
                            <li><a href="signup">sign up</a></li>
                        </ul>
                    </div>
                    </c:if>
               <c:if test="${not empty sessionScope.login}">
                    <div class="col-md-3 col-sm-3 col-xs-4 col-lg-3 signup">
                        <ul class="nav navbar-nav">
                            <li><a href="logout">logout</a></li><c:if test="${sessionScope.login.userGrant ne 'admin'}">
                               <li><a href="./getMyInfo?userId=${sessionScope.login.userId}">${sessionScope.login.userId}</a></li>
                            </c:if>
                            <c:if test="${sessionScope.login.userGrant eq 'admin'}">
                               <li><a href="./admin">${sessionScope.login.userId}</a></li>
                            </c:if>
                        </ul>
                    </div>
               </c:if>
                </div>
            </div>
        </div>
        
        <!--   end of logo menu markup     -->
        <!--  start welcome text marup  -->
        <div class="table">
            <div class="cell">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="welcome_text">
                                <h1>유어 레알 트립</h1>
                                <h1>YOUR REAL TRIP</h1>
                                <div class="welcome_p">
                                    <p>YOU ONLY LIVE ONCE</p>
                                    <p>당신이 꿈꾸는 여행을 위해</p>
                                </div>
                                <div class="welcome_form">
                                    <form action="#">
                                        <input class="form-control" type="text" placeholder="Enter your product code">
                                        <input class="submit" type="submit" value="Track your product">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of welcome text markup-->
    </section>
    <!--end of header area-->
    <!--   start about top area-->
    <section class="about_top">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="about_single_item">
                        <div class="item_icon">
                            <img src="resources/img/item_icon.png" alt="item">
                        </div>
                        <div class="about_single_item_content">
                            <h4>Fastest Delivery</h4>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="about_single_item">
                        <div class="item_icon">
                            <img src="resources/img/item_icon.png" alt="item">
                        </div>
                        <div class="about_single_item_content">
                            <h4>Fastest Delivery</h4>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="about_single_item">
                        <div class="item_icon">
                            <img src="resources/img/item_icon.png" alt="item">
                        </div>
                        <div class="about_single_item_content">
                            <h4>Fastest Delivery</h4>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--    end of about top area-->


    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="about_us_content">
                        <h2>about us</h2>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                        <a href="#">read more <span  class="fa fa-long-arrow-right"></span></a>
                    </div>
                </div>
                <div class="col-md-offset-1 col-sm-6 col-md-5">
                    <div class="about_car">
                        <img src="resources/img/about_car.png" alt="car">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->

    <!--start count up area-->
    <section class="couter_up_area" id="service">
        <div class="table">
            <div class="cell">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-sm-3 text-center">
                            <div class="single_count">
                                <h1 class="counter">126</h1>
                                <h5>Satisfied clients</h5>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-3 col-md-offset-1 text-center">
                            <div class="single_count">
                                <h1 class="counter">34</h1>
                                <h5>Branches</h5>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-3 col-md-offset-1 text-center">
                            <div class="single_count">
                                <h1 class="counter">120</h1>
                                <h5>Active workers</h5>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-md-offset-1 text-center">
                            <div class="single_count">
                                <h1 class="counter">3546</h1>
                                <h5>Product delivered s</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--    end of counter up area-->

    <!--start calculate area-->
    <section class="calculate_area" id="tracking">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-6">
                    <div class="calculate_title">
                        <h2>Calculate your cost</h2>
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,</p>
                    </div>
                    <div class="calculate_form">
                        <form action="post">
                            <div class="single_calculate">
                                <input type="text">
                                <label>height</label>
                                <div class="calculate_option">
                                    <select>
                                        <option value="cm">cm</option>
                                        <option value="ml">ml</option>
                                        <option value="cm">cm</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single_calculate">
                                <input type="text">
                                <label>width</label>
                                <div class="calculate_option">
                                    <select>
                                        <option value="cm">cm</option>
                                        <option value="ml">ml</option>
                                        <option value="cm">cm</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single_calculate">
                                <input type="text">
                                <label>length</label>
                                <div class="calculate_option">
                                    <select>
                                        <option value="#">cm</option>
                                        <option value="#">ml</option>
                                        <option value="#">cm</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single_calculate">
                                <input type="text">
                                <label>weight</label>
                                <div class="calculate_option">
                                    <select>
                                        <option value="#">cm</option>
                                        <option value="#">ml</option>
                                        <option value="#">cm</option>
                                    </select>
                                </div>
                            </div>
                            <div class="single_calculate">
                                <label>location</label>
                                <div class="calculate_option selectpadding">
                                    <select>
                                        <option value="#">cm</option>
                                        <option value="#">ml</option>
                                        <option value="#">cm</option>
                                    </select>
                                </div>
                                <div class="calculate_option padding-riht">
                                    <select>
                                        <option value="#" selected>form</option>
                                        <option value="#">ml</option>
                                        <option value="#">cm</option>
                                    </select>
                                </div>
                            </div>
                            <div class="calculat-button">
                                <input type="submit" class="calulate" value="Calculate your cost now">
                            </div>
                            <div class="totla-cost">
                                <h5>Total Cost: <span>$ 30</span></h5>
                                <h5>Duration:: <span>3 days</span></h5>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="calculat-image">
            <img src="resources/img/men.png" alt="#">
        </div>
    </section>
    <!--    end of calculate area-->


    <!--    start client say area-->
    <section class="client-area" id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-sm-8">
                    <div class="slients-title">
                        <h2>What our clients say</h2>
                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-clients">
                        <div class="client-img">
                            <img src="resources/img/client.jpg" alt="client">
                        </div>
                        <div class="client-details">
                            <p>â  Lorem ipsum dolor sit amet, consectetuer adipis cing elit, sed diam nonummy nibh euismod tinci dunt ut laoreet dolore magna aliquam.â  </p>
                            <h4>John Doe<span>Student</span></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-clients">
                        <div class="client-img">
                            <img src="resources/img/client-2.jpg" alt="client">
                        </div>
                        <div class="client-details">
                            <p>â  Lorem ipsum dolor sit amet, consectetuer adipis cing elit, sed diam nonummy nibh euismod tinci dunt ut laoreet dolore magna aliquam.â  </p>
                            <h4>John Doe<span>Student</span></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--    end of client area-->

    <!--start Pricing Area -->
    <section class="pricing-area" id="pricing">
        <div class="table">
            <div class="cell">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-sm-12">
                            <div class="pricing-desc section-padding-two">
                                <div class="pricing-desc-title">
                                    <div class="title">
                                        <h2>Pricing & plans</h2>
                                        <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,</p>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="column-out">
                <div class="pricing-slider">
                    <ul class="carousel">
                        <li class="items main-pos slides" id="1">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Premium</h6>
                                </div>
                                <div class="price">
                                    <p>$450</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                        <li class="items right-pos slides" id="2">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Basic</h6>
                                </div>
                                <div class="price">
                                    <p>$150</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                        <li class="items back-pos slides" id="3">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Basic</h6>
                                </div>
                                <div class="price">
                                    <p>$150</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                        <li class="items back-pos slides" id="4">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Premium</h6>
                                </div>
                                <div class="price">
                                    <p>$450</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                        <li class="items back-pos slides" id="5">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Basic</h6>
                                </div>
                                <div class="price">
                                    <p>$150</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                        <li class="items back-pos slides" id="6">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Basic</h6>
                                </div>
                                <div class="price">
                                    <p>$150</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                        <li class="items left-pos slides" id="7">
                            <!-- Single Pricing Table -->
                            <div class="single-pricing-table">
                                <div class="pricing-head">
                                    <h6 class="price-title">Basic</h6>
                                </div>
                                <div class="price">
                                    <p>$150</p>
                                    <span class="pricing-status">per month</span>
                                </div>
                                <div class="pricing-body">
                                    <ul>
                                        <li>Full website maintance</li>
                                        <li>Free domain & hosting</li>
                                        <li>High quality product</li>
                                        <li>24/7 Customer service</li>
                                    </ul>
                                    <a href="#" class="price-btn">Get started today</a>
                                </div>
                            </div>
                            <!-- /.End Of Single Pricing Table -->
                        </li>
                    </ul>
                    <div class="slider-navs">
                        <div class="prev-nav" id="prev"><i class="fa fa-angle-left"></i></div>
                        <div class="next-nav" id="next"><i class="fa fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
    </section>
    <!-- /.End Of Pricing Area -->



    <!--   end of slider area-->
    <section class="footer-area" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-3 col-xs-12 col-lg-4">
                    <div class="single-footer">
                        <h2>about us</h2>
                        <p>ABOUT US Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-3 col-xs-12 col-lg-4">
                    <div class="single-footer">
                        <h2>More links</h2>
                        <ul class="list">
                            <li><a href="getNoticeList">고객센터</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12 col-lg-3">
                    <div class="single-footer clearfix">
                        <h2>news latters</h2>
                        <input type="text" class="form-control">
                        <input type="submit" class="submt-button" value="submit">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--end of footer area-->

    <!--   start copyright text area-->
    <div class="copyright-area">
        <div class="container">
            <div class="col-xs-12 col-sm-6 col-md-6 text-left">
                <div class="footer-text">
                    <p>Copyright 2016, All Rights Reserved</p>
                </div>
            </div>
            <div class="col-xs-12  col-sm-6 col-md-6 text-right">
                <div class="footer-text">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-linkedin"></a>
                    <a href="#" class="fa fa-google-plus"></a>
                    <a href="#" class="fa fa-dribbble"></a>
                </div>
            </div>
        </div>
    </div>
    <!--    end of copyright text area-->
   

   <div class="modal fade">
      <div class="modal-dialog">
         <div class="modal-content">
            <!-- remote ajax call이 되는영역 -->
            <!-- header -->
            <div class="modal-header">
               <!-- 닫기(x) 버튼 -->
               <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- body -->
            <div class="modal-body">
               <div class="container">
                  <div id="login-row"
                     class="row justify-content-center align-items-center">
                     <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                           <form id="login-form" class="form" action="login" method="post">
                              <h3 class="text-center text-info" style="color:#5f768b;">Login</h3>
                              <div class="form-group">
                                 <label for="username" class="text-info" style="color:#5f768b;">UserID:</label><br>
                                 <input type="text" name="userId" id="username" value="${user.userId}"
                                    class="form-control">
                              </div>
                              <div class="form-group">
                                 <label for="password" class="text-info" style="color:#5f768b;">Password:</label><br>
                                 <input type="password" name="userPw" id="password" value="${user.userPw}"
                                    class="form-control">
                              </div>
                              <div class="form-group">
                                 <label for="remember-me" class="text-info"><span>Remember
                                       me</span> <span><input id="remember-me" name="remember-me"
                                       type="checkbox"></span></label><input type="submit"
                                    name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="Login">
                              </div>
                              <div id="register-link" class="text-right">
                                 <a href="#" class="text-info">Register here</a>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>

   
   
    <!--  jquery.min.js  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <!--    bootstrap.min.js-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <!--    jquery.sticky.js-->
    <script src="resources/js/jquery.sticky.js"></script>
    <!--  owl.carousel.min.js  -->
    <script src="resources/js/jquery.meanmenu.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <!--  jquery.mb.YTPlayer.min.js   -->
    <script src="resources/js/jquery.mb.YTPlayer.min.js"></script>
    <!--    slick.min.js-->
    <script src="resources/js/slick.min.js"></script>
    <!--    jquery.nav.js-->
    <script src="resources/js/jquery.nav.js"></script>
    <!--jquery waypoints js-->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <!--    jquery counterup js-->
    <script src="resources/js/jquery.counterup.min.js"></script>
    <!--    main.js-->
    <script src="resources/js/main.js"></script>
    
    <script type="text/javascript">
   $(function(){
       $("#popbutton").click(function(){
           $('div.modal').modal(true);
       })
   })
   </script>
</body>
</html>