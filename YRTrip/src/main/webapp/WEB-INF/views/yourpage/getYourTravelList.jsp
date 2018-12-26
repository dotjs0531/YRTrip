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
                            	   style="color:black; text-decoration:none !important;"><strong>여행정보</strong></a></li>
                            <li><a href="./getYourLikedTravelList?userId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">좋아요</a></li>
                            <li><a href="./getYourProductList?sellerId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">상품</a></li>
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
							<input type="hidden" name="userId" value="${user.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
                		<div class="form-group"><br/>
                			<table style="width:100%">
                				<tr>
                					<td style="text-align:center;"><h2>
                						<a href="./getYourTravelList?userId=${user.userId}"
                						   style="color:black; font-family: 'NanumSquareRoundEB';">너의 여행</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getYourPartnerList?userId=${user.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">너의 동행</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
					
                	<div>
						<div class="container card" style="width:100%; min-height:420px">
							<!-- Normal Demo-->
							<c:forEach items="${YourTravelList}" var="travel">
								<div class="column" style="padding-bottom:20px;">
									<div class="demo-title">&nbsp;&nbsp;No. ${travel.travelNo}</div>
									<!-- Post-->
									<div class="post-module">
										<!-- Thumbnail-->
										<div class="thumbnail">
											<a href="getTravelBoard?travelNo=${travel.travelNo}"><img src="./images/notice/1.jpg" style="height:200px" /></a>
										</div>
										<!-- Post Content-->
										<div class="post-content">
											<div class="category">Photos</div>
											<h1 class="title"><a href="getTravelBoard?travelNo=${travel.travelNo}" style="color:black; display: inline-block; 
												text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:220px; text-decoration:none !important;">${travel.travelTitle}</a></h1>
											<h2 class="sub_title">${travel.travelDate}</h2>
											<p class="description">${travel.travelContent}</p>
											<div class="post-meta">
												<span class="timestamp"><i class="fa fa-gratipay"></i>&nbsp;${travel.travelLike}</span>
												<span class="comments"><i class="fa fa-eye"></i>&nbsp;${travel.travelHit}</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						
	                    <!-- 페이지 번호 -->
	                    <c:if test="${not empty YourTravelList}">
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