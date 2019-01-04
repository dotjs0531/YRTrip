<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>장소게시판 글 상세보기</title>

 <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">

<style>
.modal-backdrop {
	z-index: -1;
}

.nav>li>a:focus, .nav>li>a:hover {
	background-color: white;
}

#map {
	height: 400px;
}
body { padding-top: 20px; }
#myCarousel .nav a small {
    display:block;
}
#myCarousel .nav {
	background:#eee;
}
#myCarousel .nav a {
    border-radius:0px;
}

</style>
<script>
$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';
});
$(document).ready( function() {
    $('#myCarousel').carousel({
		interval:   4000
	});
	
	var clickEvent = false;
	$('#myCarousel').on('click', '.nav a', function() {
			clickEvent = true;
			$('.nav li').removeClass('active');
			$(this).parent().addClass('active');		
	}).on('slid.bs.carousel', function(e) {
		if(!clickEvent) {
			var count = $('.nav').children().length -1;
			var current = $('.nav li.active');
			current.removeClass('active').next().addClass('active');
			var id = parseInt(current.data('slide-to'));
			if(count == id) {
				$('.nav li').first().addClass('active');	
			}
		}
		clickEvent = false;
	});
});

function del(placeNo){
    if(confirm("삭제하시겠습니까?")){
    	location.href= "./deleteTravelPlace?placeNo=" + placeNo;
    } else { return; }
 };
 
 jQuery( document ).ready(function( $ ) {
	 	/* 여행등록 modal & 로그인 안했을시 예외처리 */
		if("${sessionScope.login.userId}" == ''){
			$(".insertPlace").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
			});
			$(".goToUserPage").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
			});
		};
	});
</script>
</head>
<body>

	<section class="about_us_area" id="about">
		<div class="container">
			<div class="row">

				<!-- 왼쪽 사이드바 -->
				<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">여행정보</h2>
						</div>
						<ul class=price-list>
							<li><a href="./getTravelBoardList" style="color: black">전체 여행기</a></li>
							<li><a href="./getBestTravelList" style="color: black">베스트 여행기</a></li>
							<li><a href="./getTravelPlaceList" style="color: black"><strong>세계의 여행지</strong></a></li>
						</ul>
						<div class="order-buton" style="padding-bottom: 30px;">
							<a href="./insertTravelPlaceform" style="text-decoration:none; color:#fff;" class="insertPlace"><strong>세계의 여행지 등록</strong></a>
						</div>
					</div>
				</div>

				<!-- 검색 창 -->
				<div>
					<div class="col-sm-6" style="min-width: 700px">
						<div class="table-responsive" style="min-height: 450px;">

							<!-- 장소글 -->
                <div class="quote"><i class="fa fa-quote-left fa-4x"></i></div>
				<div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="3000">
				  <div class="carousel-inner">
				    <div class="active item">
				    	<blockquote>
				    	<div style="float:right;">
				    		${fn:substring(travelPlace.placeVisitDate, 0, 10)}
				    		</div>
				    		<h3>${travelPlace.placeTitle}</h3> 
				    		<p> ${travelPlace.placeContent}</p>
				    	<div style="float:right;">
					    	<c:if test="${sessionScope.login.userId eq travelPlace.userId}">${travelPlace.userId}</c:if>
					        <c:if test="${sessionScope.login.userId ne travelPlace.userId}">
							<a href="getYourTravelList?userId=${travelPlace.userId}" class="goToUserPage" style="text-decoration: none; color:#34495E;">- ${travelPlace.userId}</a>
							</c:if>
				    	</div>
				    	</blockquote>
				    	<div class="profile-circle" style="background-color: rgba(0,0,0,.2);"></div>
				    </div>
				  </div>
				</div>
				<hr>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
     <div class="carousel-inner">
     
       <div class="item active" style="height:300px;">
        <div style="min-height: 300px;">
							<c:if test="${travelPlace.placePic ne null}">
								<img id="travelPic" src="./images/travel/${travelPlace.placePic}" />
							</c:if>
							<c:if test="${travelPlace.placePic eq null}">
							<img src="./images/travel/placenoimage.jpg" class="img-responsive">
							</c:if>
	</div>
          <div class="carousel-caption">
            <h3>${travelPlace.placeName}</h3>
            <p>${travelPlace.placeAddress}</p>
          </div>
        </div>
 
         <div class="item" style="height:300px;">
                    <div id="map"></div>
           <div class="carousel-caption">
			<p>크게보기</p>
          </div>
        </div>
        <ul class="nav nav-pills nav-justified">
          <li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#"><i class="glyphicon glyphicon-camera"> 사진보기</i></a></li>
          <li data-target="#myCarousel" data-slide-to="1"><a href="#"><i class="glyphicon glyphicon-search"> 지도보기</i></a></li>
        </ul>
      </div>

    </div><!-- End Carousel -->
							<c:if test="${sessionScope.login.userId eq travelPlace.userId}">
							<div class="form-group" style="float:right;"><br>
										<label for="update" class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md" onClick="location.href='${pageContext.request.contextPath}/updateTravelPlaceform?placeNo=${travelPlace.placeNo}'" style="background-color:#f9bf3b; border:#f9bf3b;" value="수정">&nbsp;
								<label for="delete" class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md" onClick="del('${travelPlace.placeNo}')" style="background-color:#f9bf3b; border:#f9bf3b;" value="삭제">
							</div>
							</c:if>

						</div>
</div>


						<!-- end of table-responsive -->
					</div>
				</div>
			</div>

	</section>
</body>
</html>
