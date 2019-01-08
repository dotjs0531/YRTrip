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


<link rel="shortcut icon" type="image/x-icon"
	href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type=""
	href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111" />
<link rel="canonical" href="https://codepen.io/andreasstorm/pen/deRvMy" />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>


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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

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
h3 {
color: black;
}
hr{
color: #3537356b;
}
#quote-carousel {
	padding: 0 10px 30px 10px;
	margin-top: 30px;
	/* Control buttons  */
	/* Previous button  */
	/* Next button  */
	/* Changes the position of the indicators */
	/* Changes the color of the indicators */
}

#quote-carousel .carousel-control {
	background: none;
	color: #CACACA;
	font-size: 2.3em;
	text-shadow: none;
	margin-top: 30px;
}

/* #quote-carousel .carousel-control.left {
	left: -60px;
}

#quote-carousel .carousel-control.right {
	right: -60px;
} */
#quote-carousel .carousel-indicators {
	right: 50%;
	top: auto;
	/* bottom: 0px; */
	margin-right: -19px;
}

#quote-carousel .carousel-indicators li {
	margin: 5px;
	cursor: pointer;
	border: 1px solid #CCC;
	border-radius: 50px;
	/* opacity: 0.4; */
	overflow: hidden;
	transition: all 0.4s;
}

#quote-carousel .carousel-indicators .active {
	/*   background: #333333;
    width: 128px;
    height: 128px;
    border-radius: 100px;
    border-color: #f33;
    opacity: 1; */
	overflow: hidden;
}

/* .carousel-inner {
	min-height: 300px;
} */
.item blockquote {
	border-left: none;
	margin: 0;
}

.item blockquote p:before {
	content: "\f10d";
	font-family: 'Fontawesome';
	float: left;
	margin-right: 10px;
}

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
										href="./getMyInfo?userId=${sessionScope.login.userId}">My
											Page</a></li>
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
								<form action="./getTravelBoardList">
									<div style="margin-left: -550px; color: #fff;">
										<input type="radio" id="domestic" name="searchCheck"
											checked="checked" value="domestic"> <label
											for="domestic">국내</label> <input type="radio" id="overseas"
											name="searchCheck" value="overseas"> <label
											for="overseas">해외</label>
									</div>
									<div class="welcome_form">
										<input id="autocompleteTinfoList" name="searchTinfoListbox"
											class="form-control" type="text"
											placeholder="떠나고 싶은 여행지를 검색해주세요:-)"> <input
											type="hidden" class="form-control" id="tinfoListDisp"
											name="searchTinfo"> <input class="submit"
											type="submit" value="검색">
									</div>
								</form>

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

	<!-- 공지사항창 -->

	<section class="about_top" id="about_top" style="border-bottom: none;">
	<div class="container">
		<div class="row">
			<div class="col-lg-7" style="padding:10px 0">
				<div class="col-md-12" data-wow-delay="0.2s">
					<div class="carousel slide" data-ride="carousel"
						id="quote-carousel">
						<h3 style="padding: 0 0 10px 5px;">공지사항</h3>
						<hr>
						<!-- Bottom Carousel Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#quote-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#quote-carousel" data-slide-to="1"></li>
							<li data-target="#quote-carousel" data-slide-to="2"></li>
						</ol>

						<!-- Carousel Slides / Quotes -->
						<div class="carousel-inner text-center">

							<!-- Quote 1 -->
							<div class="item active">
								<div class="row">
									<div class="col-12">
										<a href="./getNotice?noticeId=1"> <img
											src="./images/product/공지.png">
										</a>
									</div>
								</div>
							</div>
							<!-- Quote 2 -->
							<div class="item">
								<div class="row">
									<div class="col-12">
										<a href="./getNotice?noticeId=1"> <img
											src="./images/product/공지2.png">
										</a>
									</div>
								</div>
							</div>
							<!-- Quote 3 -->
							<div class="item">
								<div class="row">
									<div class="col-12">
										<a href="getNotice?noticeId=1"> <img
											src="./images/product/공지3.png">
										</a>
									</div>
								</div>
							</div>
						</div>

						<!-- Carousel Buttons Next/Prev -->
						<a data-slide="prev" href="#quote-carousel"
							class="left carousel-control"></a> <a data-slide="next"
							href="#quote-carousel" class="right carousel-control"></a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-5" style="padding: 30px">
				<h3 style="padding: 10px 0px">동행구하기</h3>
				<hr>
				<table>
					<colgroup>
						<col span="1" style="width: 15%;">
						<col span="1" style="width: 70%;">
						<col span="1" style="width: 15%;">
					</colgroup>
					<thead>
						<tr style="line-height: 3;">
							<th>no.</th>

							<th style="text-align: center;">글제목</th>


							<th>작성자</th>
							<!-- <th style="text-align: center">작성일</th> -->
							<!-- <th style="text-align: center">조회수</th>
							<th style="text-align: center">진행상태</th> -->
						</tr>
					</thead>
					<c:forEach items="${partnerList}" var="partner">
						<tr style="line-height: 3;">
							<td>${partner.partnerId}</td>

							<td style="display: inline-block; color:black; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;  width: 300px; text-decoration: none !important"><a
								href="./getPartner?partnerId=${partner.partnerId}" style="color:black;">${partner.partnerTitle}
									<c:if test="${partner.joinerCnt != '0'}"> [${partner.joinerCnt}]</c:if>
							</a></td>
							<td style="color: black;"><c:if
									test="${sessionScope.login.userId eq partner.userId}">${partner.userName}</c:if>
								<c:if test="${sessionScope.login.userId ne partner.userId}">
									<a style="color: black;"
										href="./getYourTravelList?userId=${partner.userId}"
										class="goToUserPage">${partner.userName}</a>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
				<hr>
			</div>
		</div>
		</div>	
	</section>
	<!--    end 공지사항창-->
	<!--    베스트 여행기 -->
			<section class="container">
			<div class="row">
				<div class="container card" style="padding: 0 0 30px 0;">
				<h3 style="padding: 0px 0px 8px 0px;">너만의 여행기</h3>
				<h5>당신의 추억, 당신의 일정을 기록하세요 !</h5>
				<hr>
					<c:forEach items="${bestTravelList}" var="board">
						<div class="column col-md-3 col-sm-3 col-xs-10" style="padding-bottom:20px">
							<!-- Post-->
							<div class="post-module" style="width:210px; heigh:200px;">
								<!-- Thumbnail-->
								<div class="thumbnail" style="width:250px;">
									<c:set var="travelPicFile" value="${fn:split(board.travelPic, ',')[0]}" />
									<c:set var="pic" value="${travelPicFile}" />

									<img class="card-img-top" src="./images/travel/${pic}"
										alt="item" style="height: 200px;">
								</div>
								<!-- Post Content-->
								<div class="post-content" style="width:250px;">
									<h4 class="pull-right">${board.userId}</h4>
									<h1 class="title" style="font-size:20px;">
										<a href="getTravelBoard?travelNo=${board.travelNo}"
											style="color: black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 200px; text-decoration: none !important;">${board.travelTitle}</a>
									</h1>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- foreach 끝 -->
			</div>
	</section>
	<!--   end 베스트여행기-->
	<!-- 상품 판매자 1,2,3위  올리기-->
		<section class="container">
			<div class="row">
				<div class="container card" style="padding: 0 0 30px 0;">
				<h3 style="padding: 0px 0px 8px 0px;">여행 중고 물품 </h3>
				<h5>여행하면서 도움이 됐지만 더이상 쟁여둘수 없는 물품들을 올려보세요!</h5>
				<hr>
					<c:forEach items="${productList}" var="product">
						<div class="column col-md-4 col-sm-4 col-xs-12"
							style="padding-bottom: 20px;">
							<!-- Post-->
							<div class="post-module">
								<!-- Thumbnail-->
								<div class="thumbnail">
									<c:set var="productPicFile"
										value="${fn:split(product.itemPic, ',')[0]}" />
									<c:set var="pic" value="${productPicFile}" />

									<img class="card-img-top" src="./images/product/${pic}"
										alt="item" style="height: 200px;">
								</div>
								<!-- Post Content-->
								<div class="post-content">
									<h4 class="pull-right">￦${product.itemPrice}</h4>
									<h1 class="title">
										<a href="./getProduct?itemId=${product.itemId}"
											style="color: black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 130px; text-decoration: none !important;">${product.itemName}</a>
									</h1>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- foreach 끝 -->
			</div>
	</section>
	<!--    end 상품 판매자 1,2,3위  올리기-->



	<!--   end of slider area-->
	<section class="footer-area" id="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-3 col-xs-12 col-lg-8">
					<div class="single-footer">
						<h2>Company Info</h2>
						<p>상호명 : (주)유어레알트립
						<br>|대표 : 손애선
						<br>|개인정보책임자 : 양은정
							<br>
							사업자등록번호 : 212-86-*****
							<br>|통신판매업신고번호 : 제 2014-****-00910 호
							<br>
							주소: 서울특별시 용산구 한강대로 324, 7층 (갈월동, 시가이아빌딩)
							<br>|광고 및 제휴 : yrtrip@yedam.com
							<br>
							<Br>
							유어레알트립은 통신판매중개자이며 통신판매의 당사자가 아닙니다.
							<br>
						따라서 유어레알트립은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.
					</div>
				</div>
				<div class="col-md-4 col-sm-3 col-xs-12 col-lg-4">
					<div class="single-footer">
						<h2>고객센터</h2>
						<ul class="list">
							<li><a href="getNoticeList">공지사항</a></li>
							<li><a href="getNoticeList">1:1문의</a></li>
						</ul>
						<br>
						<p>|☎ 전화번호 : 053-421-2460
						<br>
						영업시간 : 09:00-18:00
						<br>
						(점심시간 : 13:00-14:00)</p>
					</div>
				</div>
				<!-- <div class="col-md-3 col-sm-3 col-xs-12 col-lg-3">
					<div class="single-footer clearfix">
						<p>유어레알트립은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 
						따라서 유어레알트립은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
						<h2>여긴뭐하지...</h2>
						<input type="text" class="form-control"> <input
							type="submit" class="submt-button" value="submit">
					</div>
				</div> -->
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
			<div class="modal-content"
				style="width: 80%; margin: 0 auto; margin-top: 100px">
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


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="resources/js/mypage.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--  jquery.min.js  -->
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> -->
	<!--    bootstrap.min.js-->
	<!-- <script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script> -->
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

	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   -->

<!-- 추가한 파일 -->
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->

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
	/* autocomplete */
/* 	$(document).ready(function(){ 
	   //input id autocomplete
	   var selectedLocation = document.getElementsByName('searchCheck');
		var searchCheckVal;
		for(var i=0; i<selectedLocation.length; i++) {
	 	  if(selectedLocation[i].checked) {
	  		 	searchCheckVal = selectedLocation[i].value;
	  		 }
		}
	    var context = '${pageContext.request.contextPath}';
	    $( "#autocompleteTinfoList").autocomplete({
	     source : function(request, response){
	      $.ajax({
	          type:"post",
	          dataType:"json",
	          url:context + "/getTravelInfoListData",
	          data:{"tinfoList":$("#autocompleteTinfoList").val(), "searchCheck":$("[name='searchCheck']:checked").val()},
	          success:function(data){
	           response($.map(data, function(item){
	            return{
	             label:item.tinfoCountry + " " + item.tinfoState + " " + item.tinfoCity,
	             value:item.tinfoCity,
	             tinfoId:item.tinfoId
	            }
	           }));
	          }
	         })
	     },
	     autoFocus:true,
	     matchContains:true,
	     minLength:0,
	     delay:0,
	     select:function(event, ui){
	    	 $("#tinfoList").val(ui.item.value);
	         selectedList = ui.item.tinfoId;
	     	 $("#tinfoListDisp").val(selectedList);
	         var flag = false;
	         $("#autocompleteTinfoList").keydown(function(e){
	          if(e.keyCode == 13){
	           if(!flag){
	             fn_regist();
	            flag = true;
	           }
	          }
	         }); 
	          
	        },
	        focus:function(event, ui){return false;}
	       });
	});

	$(function initSelectdList() {
	$("#autocompleteTinfoList").change(function(){
		selectedList = "";
	  $("#tinfoList").val("");
	  $("#tinfoListDisp").val("");
	  $('[name=searchTinfoListbox]').val("");
	});
	});	 */
</script>
	</ body>
</html>