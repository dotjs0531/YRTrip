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

<style class="cp-pen-styles">
#img { 
    width: auto; 
    height: auto;
    max-width: 100px;
    max-height: 100px;
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
</head>
<body>

    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">마이페이지</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black">여행정보</a></li>
                            <li><a href="./getMyLikedList?userId=${sessionScope.login.userId}"
                            	   style="color:black">좋아요</a></li>
                            <li><a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                            	   style="color:black"><strong>상품</strong></a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive">
                	
                		<!-- 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="sellerId" value="${sessionScope.login.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
                		<div class="form-group"><br/>
                			<table style="width:100%">
                				<tr>
                					<td style="text-align:center;"><h2>
                						<a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 상품</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyOrderList?buyerId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 거래내역</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyReviewList?buyerId=${sessionScope.login.userId}"
                						   style="color:black; font-family: 'NanumSquareRoundEB';">나의 리뷰</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
                	<div>
                	
					<c:forEach items="${MyReviewList}" var="review">
					<c:forEach items="${MyOrderList}" var="order">
            			<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
							<h5 class="control-label" style="font-family: 'NanumSquareRoundR'"><strong>${order.orderId}</strong> &nbsp;&nbsp; ${review.reviewDate}리뷰작성일</h5><br/>
								<input type="checkbox" class="cbx" id="${order}" name="userId" value="${order.orderId}" style="display: none;" class="form-control">
								<a href="getProduct?itemId=${order.itemId}"><img id="img" src="./images/review/Penguins.jpg" style="height:200px" /></a> &nbsp;&nbsp;&nbsp; 
								${review.reviewContent}리뷰내용<br/>
							<c:if test="${not empty MyReviewList}">
								<button type="button" class="btn btn-default" style="float:right;">삭제</button>
							</c:if>
							<p style="clear:both"/>
						</div>
					</c:forEach>
					</c:forEach><br/>
					
					
                    <!-- 페이지 번호 -->
					<c:if test="${not empty MyReviewList}">
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
</body>
</html>