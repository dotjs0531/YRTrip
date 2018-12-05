<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html class="no-js" lang="">
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
    
	<!-- CSS -->
    <link rel="stylesheet" href="resources/assets/css/style.css">
    
    <!--  browser campatibel css files-->
    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="js">

<section class="about-us">
        <div class="logo_menu" id="sticker" style="background-color:white; box-shadow: 0 0 10px rgba(0,0,0,0.15)">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-lg-2 col-sm-2 col-xs-6">
                        <div class="logo">
                            <a href="main.html"><img src="resources/img/logo.png" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-6 col-md-offset-1 col-sm-7 col-lg-offset-1 col-lg-6 mobMenuCol">
                        <nav class="navbar">

							<!-- 검색버튼 부분 -->
							<ul class="navbar-search navbar-right navbar-search-button">
								<li><a class="search-button" href="#"><i
										class="fa fa-search"></i></a></li>
							</ul>
							<form
								class="navbar-form navbar-right navbar-search-form disabled wow fadeInLeft"
								role="form" action="" method="post">
								<div class="form-group">
									<input type="text" name="search" placeholder="Search..."
										class="search form-control">
								</div>
							</form>
							
							<!-- <ul class="nav navbar-nav navbar-right menu"> -->
                            <ul class="nav navbar-nav navbar-right menu navbar-menu-items wow fadeIn">
                                <li><a href="main.html">홈  <span class="caret"></span></a></li>
                                <li class="current-menu-item"><a href="getTravelBoardList">여행정보</a></li>
                                <li><a href="#">동행구하기</a></li>
                                <li><a href="#">중고상품</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-4 col-lg-3 signup">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="popbutton">login</a></li>
                            <li><a href="#">sign up</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
        
	<tiles:insertAttribute name="content" />

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
									<form id="login-form" class="form" action="" method="post">
										<h3 class="text-center text-info" style="color:#5f768b;">Login</h3>
										<div class="form-group">
											<label for="username" class="text-info" style="color:#5f768b;">Username:</label><br>
											<input type="text" name="username" id="username"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="password" class="text-info" style="color:#5f768b;">Password:</label><br>
											<input type="text" name="password" id="password"
												class="form-control">
										</div>
										<div class="form-group">
											<label for="remember-me" class="text-info"><span>Remember
													me</span> <span><input id="remember-me" name="remember-me"
													type="checkbox"></span></label><input type="submit"
												name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="submit">
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

	<!--start footer area-->
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script src="resources/js/jquery.counterup.min.js"></script>
    <script src="resources/js/jquery.sticky.js"></script>
    <script src="resources/js/jquery.meanmenu.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/slick.min.js"></script>
    <script src="resources/js/wow.min.js"></script>
    <script src="resources/js/jquery.mb.YTPlayer.min.js"></script>
    <script src="resources/js/main.js"></script>
            
    <!-- Javascript -->
    <script src="resources/assets/js/jquery-1.11.1.min.js"></script>
    <script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/assets/js/jquery.backstretch.min.js"></script>
    <script src="resources/assets/js/wow.min.js"></script>
    <script src="resources/assets/js/waypoints.min.js"></script>
    <script src="resources/assets/js/scripts.js"></script>
    <script type="text/javascript">
	$(function() {
	    //setNavigation();
	    
		$("#popbutton").click(function() {
			$('div.modal').modal({
				remote : 'layer.html'
			});
		})
	})/* 

	function setNavigation() {
	    var path = window.location.pathname;
	    path = path.replace(/\/$/, "");
	    path = decodeURIComponent(path);

	    $(".nav a").each(function () {
	        var href = $(this).attr('href');
	        if (path.substring(0, href.length) === href) {
	            $(this).closest('li').addClass('active');
	        }
	    });
	} */
	</script>
    </body>

</html>
