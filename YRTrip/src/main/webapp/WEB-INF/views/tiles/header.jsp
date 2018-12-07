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
    
    <!-- Javascript -->
    <script type="text/javascript">
	$(function(){
    	$("#popbutton").click(function(){
        	$('div#login').modal(true);
    	})
	})
	</script>

<style>
.modal-backdrop {
	z-index: -1;
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
                                <li class="current-menu-item"><a href="getTravelBoardList">여행정보</a></li>
                                <li><a href="getPartnerList">동행구하기</a></li>
                                <li><a href="getProductList">중고상품</a></li>
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
                            <li><a href="#">${sessionScope.login.userId}</a></li>
                        </ul>
                    </div>
					</c:if>
                </div>
            </div>
        </div>
    </section>
        
	<div class="modal fade" id="login">
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
											<input type="text" name="userPw" id="password" value="${user.userPw}"
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
</body>
</html>