<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- Javascript -->
    <script type="text/javascript">
	jQuery( document ).ready(function( $ ) {
    	$("#popbutton").click(function(){
        	$('div#login').modal(true);
    	});
    	
    	$("#pwFind").click(function(){
        	$('div#pwdFindForm').modal(true);
        	$('div#login').modal('hide');
    	});
	});
	</script>
<style>
.container-1{
  width: 100%;
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
}
.container-1 input#loginId, input#loginPw, input#findEmail{
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
.container-1 .icon{
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
<section class="about-us">
        <div class="logo_menu" id="sticker" style="background-color:white; box-shadow: 0 0 10px rgba(0,0,0,0.15)">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-lg-2 col-sm-2 col-xs-6">
                        <div class="logo">
                            <a href="main"><img src="resources/img/logo.png" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-6 col-md-offset-1 col-sm-7 col-lg-offset-1 col-lg-6 mobMenuCol">
                        <nav class="navbar">

							<!-- 검색버튼 부분 -->
							<!-- <ul class="navbar-search navbar-right navbar-search-button">
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
							</form> -->
							
							<!-- <ul class="nav navbar-nav navbar-right menu"> -->
                            <ul class="nav navbar-nav navbar-right menu navbar-menu-items wow fadeIn">
                                <li><a href="main">홈 </a></li>
                                <li id="travelMenu"><a href="getTravelBoardList">여행정보</a></li>
                                <li id="partnerMenu"><a href="getPartnerList">동행구하기</a></li>
                                <li id="productMenu"><a href="getProductList">중고상품</a></li>
                            </ul>
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
    </section>
        
    <!-- 로그인 창 -->
	<div class="modal fade" id="login">
		<div class="modal-dialog">
			<div class="modal-content" style="width:80%; margin:0 auto; margin-top:100px">
				<!-- remote ajax call이 되는영역 -->
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- body -->
				<div class="modal-body">
					<div class="container" style="width:100%">
						<div id="login-row"
							class="row justify-content-center align-items-center">
							<div id="login-column" style="margin: 20px">
								<div id="login-box">
									<form id="login-form" class="form" action="login" method="post" style="margin:0">
										<h3 class="text-center text-info" style="color:#666666; margin-bottom: 20px">Login</h3>
										
										<div style="margin-bottom:20px">
											
											<div class="box">
											  <div class="container-1">
											      <span class="icon"><i class="fa fa-user"></i></span>
											      <input type="text" id="loginId" name="userId" placeholder="아이디" />
											  </div>
											</div>
											<p style="clear:both">
											
											<div class="box">
											  <div class="container-1">
											      <span class="icon"><i class="fa fa-lock"></i></span>
											      <input type="password" id="loginPw" name="userPw" placeholder="비밀번호" />
											  </div>
											</div>
											<p style="clear:both">
											
										</div>	
										
										<div class="form-group">
											<input type="submit" name="submit" class="btn btn-info form-input"  style="background-color:#f9bf3b; border:gray; margin:0 auto; width: 49%; padding:10px" value="Login">
											<button type="button" class="btn btn-info form-input"  style="background-color:#f9bf3b; border:gray; margin:0 auto; width: 49%; padding:10px" onclick="location.href='signup'">SignUp</button>
										</div><hr>
		                              
	                              		<a href="#" id="pwFind" style="color:black">
	                              			<span style="float:right; margin:0 10px 10px 0"><i class="fas fa-key"></i>&nbsp;비밀번호찾기</span>
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
			<div class="modal-content" style="width:80%; margin:0 auto; margin-top:80px">
				<!-- remote ajax call이 되는영역 -->
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- body -->
				<div class="modal-body">
					<div class="container" style="width:100%">
						<div id="login-row"
							class="row justify-content-center align-items-center">
							<div id="login-column" style="margin: 20px">
								<div id="login-box">
								
									<form id="pwfind-Form" class="form" action="pwFind" method="post" style="margin:0">
										<h3 class="text-center text-info" style="color:#666666; margin-bottom: 20px">비밀번호 찾기</h3>
										<div style="margin-bottom:20px">
										
											<div class="box">
											  <div class="container-1">
											      <span class="icon"><i class="fas fa-envelope"></i></span>
											      <input type="text" id="findEmail" name="userEmail" placeholder="이메일" />
											  </div>
											</div>
											<p style="clear:both">
											
										</div>	
										<p style="clear:both">
										
										<div class="form-group">
											<button type="submit" class="btn btn-info form-input"  style="background-color:#f9bf3b; border:gray; margin:0 auto; width: 100%; padding:10px" onclick="location.href='#'">비밀번호 재설정</button>
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
</body>
</html>