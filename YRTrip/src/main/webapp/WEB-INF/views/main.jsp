<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YOUR REAL TRIP:-)</title>
<!--  bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

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

<!-- 폰트 모음 -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400"
	rel="stylesheet">
<!-- 폰트끝 -->

<!--  browser campatibel css files-->
<!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!--  font Awesome Css  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script>
	/*  $(function() {
	 	  $('a[href*=#]').animate({
	 		  top: "-=30px",
	 	  },duration);
	 	  /* $('a[href*=#]').on('click', function(e) {
	 	    e.preventDefault();
	 	    $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 500, 'linear');
	 	  });
	 	}); */
</script>

<style>
.container-1 {
	width: 100%;
	vertical-align: middle;
	white-space: nowrap;
	position: relative;
}

.container-1 input#loginId, input#loginPw, input#findEmail {
	width: 100%;
	height: 50px;
	border: none;
	font-size: 10pt;
	float: left;
	padding-left: 45px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border: 1px solid lightgray;
	border-radius: 5px;
}

.container-1 .icon {
	position: absolute;
	top: 50%;
	margin-left: 17px;
	margin-top: 17px;
	z-index: 1;
	color: #4f5b66;
}
</style>
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
							<a href="main"><img src="resources/img/logo.png" alt="logo"></a>
						</div>
					</div>
					<div
						class="col-md-6 col-xs-6 col-md-offset-1 col-sm-7 col-lg-offset-1 col-lg-6 mobMenuCol">
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
								<li><a href="logout">logout</a></li>
								<c:if test="${sessionScope.login.userGrant ne 'admin'}">
									<li><a
										href="./getMyInfo?userId=${sessionScope.login.userId}">${sessionScope.login.userId}</a></li>
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
									<p>YOU ONLY LIVE ONCE, FOR YOUR DREAM TRIP</p>
									<p>인생은 한번뿐이니까, 당신이 꿈꾸는 여행을 위해</p>
								</div>
								<div class="welcome_form">
									<form action="#">
										<input class="form-control" type="text"
											placeholder="Enter your product code"> <input
											class="submit" type="submit" value="Track your product">
									</form>
								</div>
								<section id="section05" class="demo">
									<a href="#about_top"><span></span></a>
								</section>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- end of welcome text markup-->
	</section>
	<!--end of header area-->
	<!-- 상품 판매자 1,2,3위  올리기-->
	<section class="about_top" id="about_top">
		<div class="container">
			<div class="row">
				<!-- foreach itemT에서 들고오기-->
				<c:forEach items="${productList}" var="product">
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="about_single_item">
						<div class="about_single_item_content">
						<c:set var="productPicFile" value="${fn:split(product.itemPic, ',')}" />
						<c:forEach items="${productPicFile}" var="pic">
							<img src="./images/product/${pic}" alt="item">
						</c:forEach>
						<br>
							<h4><a href="./getProduct?itemId=${product.itemId}">${product.itemName}</a></h4>
							<h2>${product.itemPrice}원</h2>
							<p class="module line-clamp">${product.itemContent}</p>
						</div>
					</div>
				</div>
				 </c:forEach>
				<!-- foreach 끝 -->
			</div>
		</div>
	</section>
	<!--    end 상품 판매자 1,2,3위  올리기-->
	<!--이벤트 창? 공지사항창 -->
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
	<!--    end 이벤트 창? 공지사항창-->
	<!--    베스트 여행기 -->
	<section class="about_us_area" id="about">
		<div class="container">
			<div class="row">
				<!-- foreach itemT에서 들고오기-->
				<c:forEach items="${travelBoardlist}" var="travelBoard">
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="about_single_item">
						<div class="about_single_item_content">
						<c:set var="productPicFile" value="${fn:split(product.itemPic, ',')}" />
						<c:forEach items="${productPicFile}" var="pic">
							<img src="./images/product/${pic}" alt="item">
						</c:forEach>
						<br>
							<h4><a href="./getTravelBoardList?travelBoardNo=${travelBoard.travelBoardNo}">${travelBoard.}</a></h4>
							<h2>${product.itemPrice}원</h2>
							<p class="module line-clamp">${product.itemContent}</p>
						</div>
					</div>
				</div>
				 </c:forEach>
				<!-- foreach 끝 -->
			</div>
		</div>
	</section>
	<!--   end 베스트여행기-->




	<!--   end of slider area-->
	<section class="footer-area" id="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-3 col-xs-12 col-lg-4">
					<div class="single-footer">
						<h2>about us</h2>
						<p>ABOUT US Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim
							veniam, quis nostrud exerci tation ullamcorper suscipit lobortis
							nisl ut aliquip ex ea commodo consequat.</p>
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
						<input type="text" class="form-control"> <input
							type="submit" class="submt-button" value="submit">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--end of footer area-->

	<!--   start copyright text area-->
	<div class="copyright-area">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 text-center">
				<div class="footer-text">
					<p>Copyright 2018, All Rights Reserved 유어레알트립</p>
				</div>
			</div>
			<!-- <div class="col-xs-12  col-sm-6 col-md-6 text-right">
                <div class="footer-text">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-linkedin"></a>
                    <a href="#" class="fa fa-google-plus"></a>
                    <a href="#" class="fa fa-dribbble"></a>
                </div>
            </div> -->
		</div>
	</div>
	<!--    end of copyright text area-->

	<!-- 로그인 창 -->
	<div class="modal fade" id="login">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 80%; margin: 0 auto">
				<!-- remote ajax call이 되는영역 -->
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- body -->
				<div class="modal-body">
					<div class="container" style="width: 100%">
						<div id="login-row"
							class="row justify-content-center align-items-center">
							<div id="login-column" style="margin: 20px">
								<div id="login-box">
									<form id="login-form" class="form" action="login" method="post"
										style="margin: 0">
										<h3 class="text-center text-info"
											style="color: #666666; margin-bottom: 20px">Login</h3>

										<div style="margin-bottom: 20px">
											<%-- <label for="username" class="text-info" style="color:#5f768b;">UserID:</label><br>
										<input type="text" name="userId" id="username" value="${user.userId}"
											class="form-control"> --%>

											<div class="box">
												<div class="container-1">
													<span class="icon"><i class="fa fa-user"></i></span> <input
														type="text" id="loginId" name="userId" placeholder="아이디"
														value="${user.userId}" />
												</div>
											</div>
											<p style="clear: both">

												<%-- <label for="password" class="text-info" style="color:#5f768b;">Password:</label><br>
										<input type="password" name="userPw" id="password" value="${user.userPw}"
											class="form-control"> --%>
											<div class="box">
												<div class="container-1">
													<span class="icon"><i class="fa fa-lock"></i></span> <input
														type="password" id="loginPw" name="userPw"
														placeholder="비밀번호" value="${user.userPw}" />
												</div>
											</div>
										</div>
										<p style="clear: both">
										<div class="form-group">
											<input type="submit" name="submit"
												class="btn btn-info form-input"
												style="background-color: #f9bf3b; border: gray; margin: 0 auto; width: 49%; padding: 10px"
												value="Login">
											<button type="button" class="btn btn-info form-input"
												style="background-color: #f9bf3b; border: gray; margin: 0 auto; width: 49%; padding: 10px"
												onclick="location.href='signup'">SignUp</button>
										</div>
										<hr>
										<a href="#" id="pwFind" style="color: black"> <span
											style="float: right; margin: 0 10px 10px 0"><i
												class="fas fa-key"></i>&nbsp;비밀번호찾기</span>
										</a>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 창 -->
	<div class="modal fade" id="pwdFindForm">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 80%; margin: 0 auto; margin-top: 80px">
				<!-- remote ajax call이 되는영역 -->
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- body -->
				<div class="modal-body">
					<div class="container" style="width: 100%">
						<div id="login-row"
							class="row justify-content-center align-items-center">
							<div id="login-column" style="margin: 20px">
								<div id="login-box">

									<form id="pwfind-Form" class="form" action="pwFind"
										method="post" style="margin: 0">
										<h3 class="text-center text-info"
											style="color: #666666; margin-bottom: 20px">비밀번호 찾기</h3>
										<div style="margin-bottom: 20px">

											<div class="box">
												<div class="container-1">
													<span class="icon"><i class="fas fa-envelope"></i></span> <input
														type="text" id="findEmail" name="userEmail"
														placeholder="이메일" />
												</div>
											</div>
											<p style="clear: both">
										</div>
										<p style="clear: both">
										<div class="form-group">
											<button type="submit" class="btn btn-info form-input"
												style="background-color: #f9bf3b; border: gray; margin: 0 auto; width: 100%; padding: 10px"
												onclick="location.href='#'">비밀번호 재설정</button>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<!--    bootstrap.min.js-->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>
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
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<!--    jquery counterup js-->
	<script src="resources/js/jquery.counterup.min.js"></script>
	<!--    main.js-->
	<script src="resources/js/main.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#popbutton").click(function() {
				$('div#login').modal(true);
			});

			$("#pwFind").click(function() {
				$('div#pwdFindForm').modal(true);
				$('div#login').modal('hide');
			});
		})
	</script>
</body>
</html>