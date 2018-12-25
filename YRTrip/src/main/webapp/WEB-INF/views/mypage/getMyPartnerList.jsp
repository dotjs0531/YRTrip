<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<script src='//static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
<script src='//static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>

<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/andreasstorm/pen/deRvMy" />
<script src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>

<style class="cp-pen-styles">
html,
body {
  height: 100%;
}
body {
  display: grid;
}
a:hover { color:white }
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
  vertical-align: middle;
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
  display: inline-block;
  float: left;
  clear:both;
  padding-right: 10px;
  padding-bottom:10pz;
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
                            <a href="#" style="text-decoration:none !important;">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive">
	                	<div class="form-group"><br/>
	                		<table style="width:100%">
	                			<tr>
	                				<td style="text-align:center;"><h2>
	                					<a href="./getMyTravelList?userId=${sessionScope.login.userId}"
	                					   style="color:#666666; font-family: 'NanumSquareRoundB'">나의 여행</a></h2></td>
	                				<td style="text-align:center;"><h2>
	                					<a href="./getMyPartnerList?userId=${sessionScope.login.userId}"
	                					   style="color:black; font-family: 'NanumSquareRoundEB'">나의 동행</a></h2></td>
	                			</tr>
	                		</table>
	            		</div>
	            		<p style="clear:both"/><br/>
            			
            			<div style="min-height:420px;">
            			<c:if test="${not empty MyPartnerList}">
		            		<h4 style="font-family: 'NanumSquareRoundR'"><strong>미완료 동행 구하기</strong></h4><br/>
							<c:forEach items="${MyPartnerList}" var="partner">
								<c:if test="${partner.partnerCondition eq '미완료'}">
		            				<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
										<h5 class="control-label"><a href="getPartner?partnerId=${partner.partnerId}" style="color:black; text-decoration:none !important">
											<strong>no. ${partner.partnerId}</strong> &nbsp;&nbsp; ${partner.partnerTitle}</a></h5><br/>
										
										<!-- 선택 수락취소 -->
										<form action="cancleMyJoinerList">
											<c:forEach items="${MyJoinerList}" var="joiner">
												<c:if test="${joiner.partnerId eq partner.partnerId}">
												<c:if test="${joiner.joinerCondition eq 'Y'}">
												<div class="checkboxes" style="padding-bottom:10px;">
													<input type="checkbox" class="cbx" id="${joiner.userId}" name="joinerNoList" value="${joiner.userId}" style="display: none;" class="form-control">
													<label for="${joiner.userId}" class="check">
														<svg width="18px" height="18px" viewBox="0 0 18 18">
															<path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
															<polyline points="1 9 7 14 15 4"></polyline>
														</svg>&nbsp;${joiner.userId}
													</label>
												</div>
												</c:if>
												</c:if>
											</c:forEach><br/>
											<c:if test="${not empty MyJoinerList}">
												<button type="button" class="btn btn-default" style="float:right;">취소</button>
											</c:if>
										<p style="clear:both"/>
										</form>
									</div>
								</c:if>
							</c:forEach><br/>
		                    
		            		<h4 style="font-family: 'NanumSquareRoundR'"><strong>완료 동행 구하기</strong></h4><br/>
							<c:forEach items="${MyPartnerList}" var="partner">
								<c:if test="${partner.partnerCondition eq '완료'}">
		            				<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
										<h5 class="control-label"><a href="getPartner?partnerId=${partner.partnerId}" style="color:black; text-decoration:none !important">
											<strong>no. ${partner.partnerId}</strong> &nbsp;&nbsp; ${partner.partnerTitle}</a></h5><br/>
										
										<!-- 선택 수락취소 -->
										<form action="./cancleMyJoinerList">
											<c:forEach items="${MyJoinerList}" var="joiner">
												<c:if test="${joiner.partnerId eq partner.partnerId}">
												<c:if test="${joiner.joinerCondition eq 'Y'}">
												<div class="checkboxes" style="padding-bottom:10px;">
													<input type="checkbox" class="cbx" id="${joiner.userId}" name="joinerNoList" value="${joiner.userId}" style="display: none;" class="form-control">
													<label for="${joiner.userId}" class="check">
														<svg width="18px" height="18px" viewBox="0 0 18 18">
															<path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
															<polyline points="1 9 7 14 15 4"></polyline>
														</svg>&nbsp;${joiner.userId}
													</label>
												</div>
												</c:if>
												</c:if>
											</c:forEach><br/>
											<c:if test="${not empty MyJoinerList}">
												<button type="submit" class="btn btn-default" style="float:right;">취소</button>
											</c:if>
										<p style="clear:both"/>
										</form>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>