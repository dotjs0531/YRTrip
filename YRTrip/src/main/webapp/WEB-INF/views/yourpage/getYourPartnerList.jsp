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
                            	   style="color:black; text-decoration:none !important;"><strong>여행정보</strong></a></li>
                            <li><a href="./getYourLikedTravelList?userId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">좋아요</a></li>
                        </ul>
                        <div style="padding-bottom:20px">
                            <a href="./getYourProductList?sellerId=${user.userId}"
                            	   style="color:black; text-decoration:none !important;">상품</a>
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
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">너의 여행</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getYourPartnerList?userId=${user.userId}"
                						   style="color:black; font-family: 'NanumSquareRoundEB';">너의 동행</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
					
                	<div>
                		<div style="min-height:420px">
							<c:forEach items="${YourPartnerList}" var="partner">
		           				<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
									<h4 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:left"><strong>${partner.partnerClass} > </strong></h4>
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:left">
										<a href="getPartner?partnerId=${partner.partnerId}" style="color:black; text-decoration:none !important"><strong>&nbsp;&nbsp; ${partner.partnerTitle}</strong></a></h5>
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:left">
										&nbsp;&nbsp;|&nbsp;<c:if test="${partner.tinfoCountry ne null}">${partner.tinfoCountry}</c:if><c:if test="${partner.tinfoState ne null}"> ${partner.tinfoState}</c:if> ${partner.tinfoCity}
									</h5>
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:right">${partner.partnerDate}</h5>
									<p style="clear:both"/>
									
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; float:left">
										여행 기간 : ${partner.partnerStart} ~ ${partner.partnerEnd}&nbsp;/&nbsp;비용 : ${partner.partnerPay}&nbsp;/&nbsp;인원 : ${partner.partnerPers}
									</h5>
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; float:right">
										<span><i class="fa fa-eye">&nbsp;${partner.partnerHit}</i></span>
										<span><i class="fa fa-comment">&nbsp;${YourJoinerCnt}</i></span></h5>
									<p style="clear:both"/>
								</div>
							</c:forEach><br/>
						</div>
						
	                    <!-- 페이지 번호 -->
	                    <c:if test="${not empty YourPartnerList}">
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