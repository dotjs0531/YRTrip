<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 여행정보 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

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
function del() {
	var password = prompt("탈퇴하시려면 비밀번호를 입력해주세요.");
	var uid = '${sessionScope.login.userId}';
	var upw = '${sessionScope.login.userPw}';
	
	if(password == upw){
		if(confirm("정말 탈퇴하시겠습니까?")){
			location.href = "./deleteMyInfo?userId=" + uid;
		} else { return; }
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
};
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	};
</script>

</head>
<body>
    <!-- start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2><a href="./getMyInfo?userId=${sessionScope.login.userId}" style="color:black; text-decoration:none !important">마이페이지</a></h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;">여행정보</a></li>
                            <li><a href="./getMyLikedTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;"><strong>좋아요</strong></a></li>
                            <li><a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;">상품</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#" style="text-decoration:none !important;" onclick="del()">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
                	
                		<!-- 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="userId" value="${sessionScope.login.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
	                	<div class="form-group"><br/>
	                		<table style="width:100%; tabel-layout:fixed">
	                			<tr>
	                				<td style="text-align:center; width:33%"><h2>
	                					<a href="./getMyLikedTravelList?userId=${sessionScope.login.userId}"
	                					   style="color:black; font-family: 'NanumSquareRoundEB'">여행정보</a></h2></td>
	                				<td style="text-align:center; width:33%"><h2>
	                					<a href="./getMyLikedPlaceList?userId=${sessionScope.login.userId}"
	                					   style="color:#666666; font-family: 'NanumSquareRoundB'">여 행 지</a></h2></td>
	                				<td style="text-align:center; width:33%"><h2>
	                					<a href="./getMyLikedProductList?userId=${sessionScope.login.userId}"
	                					   style="color:#666666; font-family: 'NanumSquareRoundB'">상&nbsp;&nbsp;&nbsp;&nbsp;품</a></h2></td>
	                			</tr>
	                		</table>
	            		</div>
	            		<p style="clear:both"/><br/>
	                    
						<div class="container card" style="width:100%; min-height:420px;">
							<!-- Normal Demo-->
							<c:forEach items="${MyLikedTravelList}" var="travel" varStatus="status">
								
								<div class="content-box" style="width:29%; margin-top:10px">
									<div style="height:130px;">
										<c:if test="${travel.travelPic != null}">
											<img src="./images/travel/${travel.travelPic}" class="img-responsive" style="width:210px; height:150px">
										</c:if>
										<c:if test="${travel.travelPic == null}">
											<img src="./images/travel/noimage.jpg" class="img-responsive" style="width:210px; height:150px">
										</c:if>
									</div>
									
									<div class="content-title">
										<div class="text-center">
											<h3><a href="getTravelBoard?travelNo=${travel.travelNo}">
											 <c:choose>
									           <c:when test="${fn:length(travel.travelTitle) > 9}">
									           		<c:out value="${fn:substring(travel.travelTitle,0,8)}"/>..
												</c:when>
									           <c:otherwise>
									            <c:out value="${travel.travelTitle}"/>
									           </c:otherwise> 
									          </c:choose>
											</a></h3>
										</div>
									</div>
									<div class="content-footer">
									<hr style="margin-bottom:-3px;">
										<span class="user-info">
											<c:if test="${sessionScope.login.userId eq travel.userId}"><a>${travel.userId}</a></c:if>
				                            <c:if test="${sessionScope.login.userId ne travel.userId}">
												<a href="getYourTravelList?userId=${travel.userId}" class="goToUserPage">${travel.userId}</a>
											</c:if>
										</span>
										<span class="pull-right">
											<a href="#" data-placement="right" title="Like" style="padding-top:25px;">
											<i class="fa fa-heart"></i> ${travel.travelLike}</a>
										</span>
									</div>
								</div>
								<c:if test="${status.count%3 eq 0}" ><br/></c:if>
								
							</c:forEach>
						</div>
                    
                    	<!-- 페이지 번호 -->
						<c:if test="${not empty MyLikedTravelList}">
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