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
<link href="https://fonts.googleapis.com/css?family=Jua&amp;subset=korean" rel="stylesheet">

<style>
.modal-backdrop {
	z-index: -1;
}

.nav>li>a:focus, .nav>li>a:hover {
	background-color: white;
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
 /* 여행지 좋아요 */
 	function disLike(uId, lC, lBid){
		   location.href = "./deleteLike?userId=" + uId + "&likeCategory=" + lC + "&likeBoardid=" + lBid;
	};
$(function(){
 function likeCondition() {
	   var params = { userId : '${sessionScope.login.userId}',
			   		 likeCategory : 'P',
			   		 likeBoardid :'${travelPlace.placeNo}'
	   				}
	   $.getJSON("getLike", params, function(data){
		   if (!data) {
			   var div = makeDisLikeBtn('P','${travelPlace.placeNo}');
				$(div).appendTo("#LikeConditionP"+'${travelPlace.placeNo}');
		   }
		   else {
			   var div = makeLikeBtn('P','${travelPlace.placeNo}');
				$(div).appendTo("#LikeConditionP"+'${travelPlace.placeNo}');
		   }
	   });
 }
 function makeDisLikeBtn(likeCategory,likeBoardid) {
		var div =$("<div>");
		div.addClass('LikeCondition'+likeCategory+likeBoardid);
		var str = "<form action='./insertLike' method='post'>"
					+ "<input type='hidden' name='likeCategory' value="+likeCategory+">"
					+ "<input type='hidden' name='likeBoardid' value="+likeBoardid+">"
					+ "<input type='hidden' name='userId' value='${sessionScope.login.userId}'>"
					+ "<button type='submit' style='border:0; outline:0; background-color: transparent !important; width:20px; height:20px;'>"
					+ "<img src='./images/dislike.png'></button></form>"
		div.html(str);
		return div;
 }
 function makeLikeBtn(likeCategory,likeBoardid) {
		var div =$("<div>");
		div.addClass('LikeCondition'+likeCategory+likeBoardid);
		var str = "<button onclick=\"disLike('${sessionScope.login.userId}','"+likeCategory+"','"+likeBoardid+"')\" style='border:0; outline:0; background-color: transparent !important; width:20px; height:20px;'>"
				+ "<img src='./images/like.png'></button>"
		div.html(str);
		return div;
 }
 likeCondition();
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
				<div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="3000"  style="font-family: 'Jua', sans-serif;">
				  <div class="carousel-inner">
				    <div class="active item">
				    	<blockquote>
				    	<!-- 카톡 공유하기 버튼 -->
				    	<a id="kakao-link-btn" href="javascript:;" style="float:right; color:#f9bf3b;">
							<i class="fas fa-comment"></i>
						</a>

				    	<div style="display:inline-block">
				    	<h3>${travelPlace.placeTitle}</h3> 
						</div>
						<hr />
				    	<div style="float:right;">
				    		${fn:substring(travelPlace.placeVisitDate, 0, 10)}
				    		</div><br><br>
				    		<pre style="background-color:#fff; border:none; font-size:16px; font-family: 'Jua', sans-serif; white-space: pre-wrap;"> ${travelPlace.placeContent}</pre>
				    		<hr>
				    	<div style="float:right;">
					    	<c:if test="${sessionScope.login.userId eq travelPlace.userId}">작성자 | ${travelPlace.userName}</c:if>
					        <c:if test="${sessionScope.login.userId ne travelPlace.userId}">
							<br><br>작성자 | <a href="getYourTravelList?userId=${travelPlace.userId}" class="goToUserPage" style="text-decoration: none; color:#34495E;">${travelPlace.userName}</a>
							</c:if>
				    	</div>
				    	<div>
											<c:choose>
												<c:when test="${not empty sessionScope.login}">
													<div id="LikeConditionP${travelPlace.placeNo}"></div>
												</c:when>
												<c:otherwise>
													<img src="./images/dislike.png" width="20px" style="display:inline-block">
												</c:otherwise>
											</c:choose>
											</div>
				    	</blockquote>
				    	<div class="profile-circle" style="background-color: rgba(0,0,0,.2);"></div>
				    </div>
				  </div>
				</div>
				<hr>
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="font-family: 'Jua', sans-serif;">
     <div class="carousel-inner">
     
       <div class="item active" style="height:300px;">
        <div style="min-height: 300px;">
							<c:if test="${travelPlace.placePic ne null}">
								<img id="travelPic" src="./images/travel/${travelPlace.placePic}" style="width:100%"/>
							</c:if>
							<c:if test="${travelPlace.placePic eq null}">
							<img src="./images/travel/placenoimage.jpg" style="width:100%" >
							</c:if>
	</div>
          <div class="carousel-caption">
            <h3>${travelPlace.placeName}</h3>
            <p>${travelPlace.placeAddress}</p>
          </div>
        </div>
 
         <div class="item" style="height:300px;">
                    <div id="map-canvas" style="width: 100%; height: 340px" title="${travelPlace.userId}님이 방문한 장소입니다."></div>
           <div class="carousel-caption">
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7TwRGWpLz6wVhQ537n2nMcDGO5wKa_Jw&libraries=places&callback=initMap" async defer></script>
<script>

function initMap() {
    
    var mapOptions = {
                        zoom: 18,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
                                mapOptions);
     
    var size_x = 40;
    var size_y = 40;
 
    var image = new google.maps.MarkerImage( '',
                                                new google.maps.Size(size_x, size_y),
                                                '',
                                                '',
                                                new google.maps.Size(size_x, size_y));
     
    var address = '${travelPlace.placeAddress}';
    var marker = null;
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            marker = new google.maps.Marker({
                            map: map,
                            icon: image,
                            title: '${travelPlace.placeName}',
                            position: results[0].geometry.location
                        });

            var content = "${travelPlace.placeName}<br>${travelPlace.placeAddress}";
         
            var infowindow = new google.maps.InfoWindow({ content: content});
            google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
     
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
	  
	// // 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('4115609fb50877ceef895d9a2db54237');
	// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	Kakao.Link.createDefaultButton({
		container : '#kakao-link-btn',
		objectType : 'feed',
		content : {
			title : '${travelPlace.placeTitle}',
			description : '${travelPlace.placeContent}',
			imageUrl: 'https://postfiles.pstatic.net/MjAxODEyMjlfNiAg/MDAxNTQ2MDE0ODM1ODk5.VlG0P4NPq3mfRH0WkShxFV1TQFTrxJzDCSrkglA9g-kg.ClRMBKh_OXXzAFp7xDzEwlTzFCH1sb0ZCrFiOLMCDcMg.PNG.dotjs0531/%EB%8F%84%EC%8B%9C+%EB%B0%94%ED%83%95%ED%99%94%EB%A9%B4+(1).png?type=w773',
			link : {
				mobileWebUrl : document.location.href,
				webUrl : document.location.href
			}
		},
		social : {
		},
		buttons : [ {
			title : '웹으로 보기',
			link : {
				mobileWebUrl : document.location.href,
				webUrl : document.location.href
			}
		} ]
	});
	//]]>
</script>
</body>
</html>
