<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  
<!-- 별점 등록부분 -->
<link href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<!--suppress JSUnresolvedLibraryURL -->
<script src="resources/js/star-rating.js" type="text/javascript"></script>

<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/andreasstorm/pen/deRvMy" />
<script src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>

<style class="cp-pen-styles">
a:hover { color:white }
a#itemId:hover { color: black }
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
@font-face {
 font-family: 'NanumSquareRoundEB';
 src: url(resources/fonts/NanumSquareRoundEB.eot);
 src: url(resources/fonts/NanumSquareRoundEB.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundEB.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundEB.ttf) format('truetype');
}
@font-face {
 font-family: 'NanumSquareRoundB';
 src: url(resources/fonts/NanumSquareRoundB.eot);
 src: url(resources/fonts/NanumSquareRoundB.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundB.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundB.ttf) format('truetype');
}
@font-face {
 font-family: 'NanumSquareRoundR';
 src: url(resources/fonts/NanumSquareRoundR.eot);
 src: url(resources/fonts/NanumSquareRoundR.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundR.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundR.ttf) format('truetype');
}
</style>
<script>
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	};
</script>
<script>
$(function() {
	var carousel_class_init = "active";	
	var carousel_ea = $("div#itemC").length;
	console.log(carousel_ea);
	for(i=0; i<1; i++){
		$("#itemC").addClass(carousel_class_init);
	};
});
</script>
<script src="//use.typekit.net/xyl8bgh.js"></script>
<script>try{Typekit.load();}catch(e){}</script>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch' href='resources/css/mypage__codepen_io_andytran_pen.css'>
<link rel="stylesheet" href="resources/css/mypage.css">
</head>
<body>

    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title" style="padding-bottom:10px">
                            <h2><a href="./getYourTravelList?userId=${user.userId}" style="color:black; text-decoration:none !important">${user.userId}</a></h2>
                            <!-- 별점 표시 부분 -->
							<input id="reviewStar" name="reviewStar" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1" value="${user.userStar}" disabled>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getYourTravelList?userId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">여행정보</a></li>
                            <li><a href="./getYourLikedTravelList?userId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">좋아요</a></li>
                            <li><a href="./getYourProductList?sellerId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;"><strong>상품</strong></a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#" style="text-decoration:none !important;">대화하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive">
                	
                		<!-- 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="sellerId" value="${user.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
                		<div class="form-group"><br/>
                			<table style="width:100%; tabel-layout:fixed">
                				<tr>
                					<td style="text-align:center; width:50%"><h2>
                						<a href="./getYourProductList?sellerId=${user.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">너의 상품</a></h2></td>
                					<td style="text-align:center; width:50%"><h2>
                						<a href="./getYourReviewList?sellerId=${user.userId}"
                						   style="color:black; font-family: 'NanumSquareRoundEB';">너가 받은 리뷰</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
					
                	<div>
                		<div style="min-height:420px">
							<c:forEach items="${YourReviewList}" var="review">
								<c:if test="${not empty review.reviewContent}">
			            			<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
			            				<h4 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:left"><strong>${review.itemCategory} ></strong></h4>
										<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:left"><strong>
											<a href="getProduct?itemId=${review.itemId}" id="itemId" style="color:black; text-decoration:none !important;">&nbsp;&nbsp;${review.itemName}</a></strong></h5>
										<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:right">${review.reviewDate}</h5>
										<p style="clear:both"/>
										
										<!-- 사진 출력 -->
										<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:180px; float:left">
											<!-- 사진넣는부분 -->
											<div class="carousel-inner">
												<c:set var="reviewPicname" value="${fn:split(review.reviewPic, ',')}"/>
												<c:forEach items="${reviewPicname}" var="pic">
												<div id="itemC" class="item">
													<a href="getProduct?itemId=${review.itemId}">
													<img id="img" src="./images/review/${pic}" style="height:180px" /></a>
												</div>
												</c:forEach>
											</div>
											<!--왼쪽 / 오른쪽 화살표-->
											<a class="left carousel-control" href="#myCarousel" data-slide="prev">
												<span class="glyphicon glyphicon-chevron-left"></span>
												<span class="sr-only">Previous</span>
											</a>
											<a class="right carousel-control" href="#myCarousel" data-slide="next">
											<span class="glyphicon glyphicon-chevron-right"></span>
											<span class="sr-only">Next</span>
											</a>
										</div>
										
										<!-- 별점 표시 부분 -->
										<input id="reviewStar" name="reviewStar" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1"
											   value="${review.reviewStar}" style="" disabled>
										<p class="control-label" style="font-family: 'NanumSquareRoundR'; margin-left:190px;
											overflow:hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp:7;
											-webkit-box-orient:vertical; word-wrap:break-word; height:10em;">${review.reviewContent}</p>
										<p style="clear:both"/>
									</div>
								</c:if>
							</c:forEach><br/>
						</div>
                	
	                    <!-- 페이지 번호 -->
	                    <c:if test="${not empty YourReviewList}">
	                    <div>
							<my:paging paging="${paging}" jsFunc="go_page" />
	                    </div>
	                    </c:if>
                    
					</div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="resources/js/mypage.js"></script>
</body>
</html>