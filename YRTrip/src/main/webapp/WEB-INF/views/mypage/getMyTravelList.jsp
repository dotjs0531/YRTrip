<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

<!-- 체크박스 -->
<script src='//static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
<script src='//static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>

<style class="cp-pen-styles">
html,
body {
  height: 100%;
}
body {
  display: grid;
}
a:hover { color:white }
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
.check {
  cursor: pointer;
  position: relative;
  margin: auto;
  width: 18px;
  height: 18px;
  -webkit-tap-highlight-color: transparent;
  transform: translate3d(0, 0, 0);
}
.check:before {
  content: "";
  position: absolute;
  top: -15px;
  left: -15px;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: rgba(34,50,84,0.03);
  opacity: 0;
  transition: opacity 0.2s ease;
}
.check svg {
  position: relative;
  z-index: 1;
  fill: none;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke: #c8ccd4;
  stroke-width: 1.5;
  transform: translate3d(0, 0, 0);
  transition: all 0.2s ease;
}
.check svg path {
  stroke-dasharray: 60;
  stroke-dashoffset: 0;
}
.check svg polyline {
  stroke-dasharray: 22;
  stroke-dashoffset: 66;
}
.check:hover:before {
  opacity: 1;
}
.check:hover svg {
  stroke: #4285f4;
}
.cbx:checked + .check svg {
  stroke: #4285f4;
}
.cbx:checked + .check svg path {
  stroke-dashoffset: 60;
  transition: all 0.3s linear;
}
.cbx:checked + .check svg polyline {
  stroke-dashoffset: 42;
  transition: all 0.2s linear;
  transition-delay: 0.15s;
}
.checkboxes label {
  display: block;
  float: left;
  padding-right: 10px;
  white-space: nowrap;
  vertical-align: middle;
}
.checkboxes input {
  vertical-align: middle;
}
.checkboxes label span {
  vertical-align: middle;
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
		} else { return false; }
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
};
function travelDel() {
	if (confirm("삭제하시겠습니까?")) {
		$('#travelDel').attr('action', 'deleteMyTravelList');
		//document.travelDel.submit();
	} else {
		return false;
	}
};
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
                        <div class="pricing-title">
                            <h2><a href="./getMyInfo?userId=${sessionScope.login.userId}" style="color:black; text-decoration:none !important">마이페이지</a></h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;"><strong>여행정보</strong></a></li>
                            <li><a href="./getMyLikedTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;">좋아요</a></li>
                            <li><a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;">상품</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#" style="text-decoration:none !important;" onclick="del()">탈퇴</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive">
                	
                		<!-- 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="userId" value="${sessionScope.login.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
                		<div class="form-group"><br/>
                			<table style="width:100%">
                				<tr>
                					<td style="text-align:center;"><h2>
                						<a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                						   style="color:black; font-family: 'NanumSquareRoundEB';">나의 여행</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyPartnerList?userId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 동행</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
					
	                <!-- 선택 삭제 -->
	                <form id="travelDel">
	                	<div style="min-height:420px;">
			   				<c:forEach items="${MyTravelList}" var="travel" varStatus="status">
							<div style="display: table-cell; vertical-align:middle; width:230px; padding:10px">
								
								<div class="checkboxes" style="font-family: 'proxima-nova-soft', sans-serif; font-size: 18px; font-weight: bold; text-transform: uppercase; padding-left:10px">
								<input type="checkbox" class="cbx" id="${travel.travelNo}" name="travelNoList" value="${travel.travelNo}" style="display: none;">
								<label for="${travel.travelNo}" class="check">
									<svg width="18px" height="18px" viewBox="0 0 18 18">
										<path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
										<polyline points="1 9 7 14 15 4"></polyline>
									</svg>
								</label>&nbsp;&nbsp;No. ${travel.travelNo}
								</div>
								
								<div class="content-box" style="width:100%; margin-top:10px">
									<c:if test="${travel.travelPic != null}">
										<img src="./images/travel/${travel.travelPic}" class="img-responsive">
									</c:if>
									<c:if test="${travel.travelPic == null}">
										<img src="./images/travel/noimage.jpg" class="img-responsive">
									</c:if>
									
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
										<span class="user-info">${travel.travelDate}</span>
										<span class="pull-right">
											<a href="#" data-placement="right" title="Like">
											<i class="fa fa-heart"></i> ${travel.travelLike}</a>
										</span>
									</div>
								</div>
							</div>
							<c:if test="${status.count%3 eq 0}" ><br/></c:if>
							</c:forEach>
						</div>
						
						<input type="hidden" name="userId" value="${sessionScope.login.userId}"/>
	            		<c:if test="${not empty MyTravelList}">
							<button class="btn btn-default" style="float:right;" onclick="travelDel()">삭제</button>
							<p style="clear:both"/>
						</c:if>
						
					</form>
					
                    <!-- 페이지 번호 -->
                    <c:if test="${not empty MyTravelList}">
                    <div>
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                    </c:if>
                    
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>