<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 여행지 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

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
.modal-backdrop {
	z-index: -1;
}
a:hover { color:white }
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
.modal-backdrop {
	z-index: -1;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
/* 장소 리스트 */
.wrap
{
  width:100%;
  display:inline;
  align-items:space-around;
  max-width:1200px;
  text-align:center;
}
.tile
{
  width:200px;
  height:200px;
  margin:10px;
  background-color:#fff;
  display:inline-block;
  background-size:cover;
  position:relative;
  cursor:pointer;
  transition: all 0.4s ease-out;
  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.44);
  overflow:hidden;
  color:white;
  font-family:'Roboto';
  
}
.tile img
{
  height:100%;
  width:100%;
  position:absolute;
  top:0;
  left:0;
  z-index:0;
  transition: all 0.4s ease-out;
}
.tile .text
{
  font-color:#fff;
  padding:40px 30px 30px 30px;
  font-family: 'East Sea Dokdo';
  color:#34495E;
}
.tile h2
{
  font-weight:300;
  margin:0;
  text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
}
.tile h3
{
  font-weight:100;
  margin:20px 0 0 0;
  transform: translateX(400px);
}
.tile p
{
  font-weight:300;
  margin:20px 0 0 0;
  line-height: 25px;
  transform: translateX(-200px);
  transition-delay: 0.2s;
}
.animate-text
{
  opacity:0;
  transition: all 0.6s ease-in-out;
}
.tile:hover
{
  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.64);
  transform:scale(1.05);
  cursor : default;
}
.tile:hover img
{
  opacity: 0.2;
}
.tile:hover .animate-text
{
  transform:translateX(0);
  opacity:1;
}

.tile:hover span
{
  opacity:1;
  transform:translateY(0px);
}

@media (max-width: 1000px) {
  .wrap {
   flex-direction: column;
    width:400px;
  }
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

</head>
<body>
    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title" style="padding-bottom:10px">
                            <h2><a href="./getYourTravelList?userId=${user.userId}" style="color:black; font-family: 'NanumSquareRoundEB'; text-decoration:none !important">${user.userName}</a></h2>
                            <!-- 별점 표시 부분 -->
							<input id="reviewStar" name="reviewStar" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1" value="${user.userStar}" disabled>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getYourTravelList?userId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">여행정보</a></li>
                            <li><a href="./getYourLikedTravelList?userId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;"><strong>좋아요</strong></a></li>
                        </ul>
                        <div style="padding-bottom:20px">
                            <a href="./getYourProductList?sellerId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">상품</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
                	
                		<!-- 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="userId" value="${user.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
	                	<div class="form-group"><br/>
	                		<table style="width:100%; tabel-layout:fixed">
                				<tr>
	                				<td style="text-align:center; width:33%"><h2>
	                					<a href="./getYourLikedTravelList?userId=${user.userId}"
	                					   style="color:#666666; font-family: 'NanumSquareRoundB'">여행정보</a></h2></td>
	                				<td style="text-align:center; width:33%"><h2>
	                					<a href="./getYourLikedPlaceList?userId=${user.userId}"
	                					   style="color:black; font-family: 'NanumSquareRoundEB'">여 행 지</a></h2></td>
	                				<td style="text-align:center; width:33%"><h2>
	                					<a href="./getYourLikedProductList?userId=${user.userId}"
	                					   style="color:#666666; font-family: 'NanumSquareRoundB'">상&nbsp;&nbsp;&nbsp;&nbsp;품</a></h2></td>
                				</tr>
	                		</table>
	            		</div>
	            		<p style="clear:both"/><br/>

						<div style="min-height:420px">
							<c:forEach items="${YourLikedPlaceList}" var="place">
								<div class="wrap">
									<div class="tile">
											<img src="./images/travel/placenoimage.jpg" class="img-responsive">
										<div class="text">
											<h2 class="animate-text">
												<a href="getTravelPlace?PlaceNo=${place.placeNo}" style="text-decoration: none; color: #34495E;">${place.placeName}</a>
											</h2>
											<p class="animate-text">${place.placeName}</p>
											<h3 class="animate-text">${place.userName}</h3>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<!-- 페이지 번호 -->
						<c:if test="${not empty YourLikedPlaceList}">
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
</body>
</html>