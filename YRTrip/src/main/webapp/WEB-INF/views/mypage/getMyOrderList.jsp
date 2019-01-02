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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- 별점 등록부분 -->
<link href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<!--suppress JSUnresolvedLibraryURL -->
<script src="resources/js/star-rating.js" type="text/javascript"></script>
    
<!-- 체크박스 -->
<script src='//static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
<script src='//static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>

<!-- 다중파일 업로드 -->
<link href="resources/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="resources/js/fileinput.js" type="text/javascript"></script>

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
.modal-content{
  margin-top:70px;
}
/* #reviewimg { 
    width: auto; 
    height: auto;
    max-width: 100px;
    max-height: 100px;
}  */
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
		} else { return; }
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
};
function confirmPurchase(orderId) {
	if (confirm("구매확정하시겠습니까?")) {
		location.href = "./updateOrderCondition?orderId=" + orderId;
	} else {
		return;
	}
};
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	};
</script>
<script>
$(function() {
	$('#getMyOrder').on('show.bs.modal', function(e) {
		var button = $(event.target) // Button that triggered the modal
		console.log(event);
		var param = {
			orderId :  button.attr("id").substr(5)
		}
		$.getJSON("getMyOrder", param, function(data) {
			var orderId = data.orderId;
			var orderDate = data.orderDate;
			var itemDeliveryno = data.itemDeliveryno;
			
			var itemMethod = data.itemMethod;
			var orderEa = data.orderEa;
			var orderPrice = data.orderPrice;
			var totalPrice = orderEa*orderPrice;

			var orderDelivery = data.orderDelivery;
			var orderCondition = data.orderCondition;
			
			$("#orderId").html(orderId);
			$("#orderDate").html(orderDate);
			$("#itemDeliveryno").html(itemDeliveryno);
				
			$("#itemMethod").html(itemMethod);
			$("#orderEa").html(orderEa+"개");
			$("#orderPrice").html(orderPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
			$("#totalPrice").html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
			
			if(orderDelivery == '배송준비중' && orderCondition != '거래취소'){
				$("#cancleOrderId").val(orderId);
				$("#cancleOrder").show();
			} else {
				$("#cancleOrder").hide();
			}
		})
	});
	$('#insertMyReviewForm').on('show.bs.modal', function(e) {
		var button = $(event.target) // Button that triggered the modal
		console.log(event);
		var param = {
			orderId :  button.attr("id").substr(6)
		}
		$.getJSON("getMyReview", param, function(data){
			var orderId = data.orderId;
			var itemId = data.itemId;
				
			$("#reviewId").val(orderId);
			$(".itemId").val(itemId);
		});
	});
	
	$("#cancleOrder").click(function(){
		if (confirm("거래취소하시겠습니까?")) {
			document.cancleOrderForm.submit();
		} else {
			return;
		}
	});
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
                        <div class="pricing-title">
                            <h2><a href="./getMyInfo?userId=${sessionScope.login.userId}" style="color:black; text-decoration:none !important">마이페이지</a></h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;">여행정보</a></li>
                            <li><a href="./getMyLikedTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;">좋아요</a></li>
                            <li><a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                            	   style="color:black; text-decoration:none !important;"><strong>상품</strong></a></li>
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
                						   style="color:black; font-family: 'NanumSquareRoundEB';">나의 구매내역</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyReviewList?buyerId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 리뷰</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
                	<div>
	                	<form action="deleteMyOrderList">
							<div class="container card" style="width:100%; min-height:420px">
								<!-- Normal Demo-->
								<c:forEach items="${MyOrderList}" var="order">
									<div class="column" style="padding-bottom:20px;">
										<div class="demo-title">
										<div class="checkboxes">
											<input type="checkbox" class="cbx" id="${order.orderId}" name="orderNoList" value="${order.orderId}" style="display: none;">
											<label for="${order.orderId}" class="check">
												<svg width="18px" height="18px" viewBox="0 0 18 18">
													<path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
													<polyline points="1 9 7 14 15 4"></polyline>
												</svg>
											</label>&nbsp;&nbsp;${order.orderId}
										</div></div>
										<!-- Post-->
										<div class="post-module">
											<!-- Thumbnail-->
											<div class="thumbnail">
												<a href="getProduct?itemId=${order.itemId}"><img src="./images/notice/1.jpg" style="height:200px" /></a>
											</div>
											<!-- Post Content-->
											<div class="post-content">
												<div class="category">${order.orderDelivery}</div>
												<h4 class="pull-right">${order.itemMethod}</h4>
												<h1 class="title"><a href="getProduct?itemId=${order.itemId}" style="color:black; display: inline-block; text-overflow: ellipsis; 
													white-space: nowrap; overflow: hidden; width:130px; text-decoration:none !important;">${order.itemName}</a></h1>
												<h2 class="sub_title">${order.orderCondition}</h2>
												<p class="description" align="center">
													<c:if test="${order.orderCondition eq '결제완료'}">
														<button type="button" class="btn btn-default" onclick="confirmPurchase('${order.orderId}')">구매확정</button>
													</c:if>
													<c:if test="${order.orderCondition eq '거래완료'}">
														<button type="button" class="btn btn-default" disabled>확정완료</button>
													</c:if>
													<c:if test="${order.orderCondition eq '거래취소'}">
														<button type="button" class="btn btn-default" disabled>구매확정</button>
													</c:if>
													
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<c:if test="${order.orderCondition eq '거래완료'}">
														<c:if test="${order.reviewContent eq null}">
															<button type="button" class="btn btn-default" id="review${order.orderId}" 
																	data-toggle="modal" data-target="#insertMyReviewForm">리뷰작성</button>
														</c:if>
														<c:if test="${order.reviewContent ne null}">
															<button type="button" class="btn btn-default" disabled>리뷰완료</button>
														</c:if>
													</c:if>
													<c:if test="${order.orderCondition ne '거래완료'}">
														<button type="button" class="btn btn-default" disabled>리뷰작성</button>
													</c:if>
													
													</p>
													<div class="post-meta">
													<button type="button" class="btn btn-default pull-right" id="order${order.orderId}" data-toggle="modal" data-target="#getMyOrder">상세보기</button>
													<span class="comments" style="font-size:15px; vertical-align: middle;">${order.orderPrice} 원 / ${order.orderEa} 개</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							
							<input type="hidden" name="userId" value="${sessionScope.login.userId}"/>
							<c:if test="${not empty MyOrderList}">
								<button type="submit" class="btn btn-default" style="float:right;">삭제</button>
								<p style="clear:both"/>
							</c:if>
						</form>
					</div>
					
                    <!-- 페이지 번호 -->
					<c:if test="${not empty MyOrderList}">
                    <div>
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                    </c:if>
                    
					<!-- 거래내역 상세보기 -->
					<div class="modal fade" id="getMyOrder">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
								</div>
								<!-- body -->
								<div class="modal-body">
									<div class="container">
										<div id="login-row" class="row justify-content-center align-items-center">
											<div id="login-column" class="col-md-6">
												<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
					            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
													<h4 class="text-info" style="color:black;">주문정보</h4><hr/>
														<table style="width:100%; margin-left:10px">
															<tr>
																<td><h5 class="text-info">주문번호</h5></td>
																<td style="text-align:right;"><h5 id="orderId"></h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">주문일자</h5></td>
																<td style="text-align:right;"><h5 id="orderDate"></h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">송장번호</h5></td>
																<td style="text-align:right;"><h5 id="itemDeliveryno"></h5></td>
															</tr>
														</table>
													</div>
												</div>
												<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
					            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
													<h4 class="text-info" style="color:black;">결제정보</h4><hr/>
														<table style="width:100%; margin-left:10px">
															<tr>
																<td><h5 class="text-info">결제수단</h5></td>
																<td style="text-align:right;"><h5 id="itemMethod"></h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">상품 금액</h5></td>
																<td style="text-align:right;"><h5 id="orderPrice"></h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">구매 수량</h5></td>
																<td style="text-align:right;"><h5 id="orderEa"></h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">결제 금액</h5></td>
																<td style="text-align:right;"><h5 id="totalPrice"></h5></td>
															</tr>
														</table>
													</div>
												</div>
												<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
					            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
													<h4 class="text-info" style="color:black;">배송정보</h4><hr/>
														<table style="width:100%; margin-left:10px">
															<tr>
																<td><h5 class="text-info">수령인</h5></td>
																<td style="text-align:right;"><h5 id="userName">${sessionScope.login.userName}</h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">연락처</h5></td>
																<td style="text-align:right;"><h5 id="userPhone">${sessionScope.login.userPhone}</h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">우편번호</h5></td>
																<td style="text-align:right;"><h5 id="userPost">${sessionScope.login.userPost}</h5></td>
															</tr>
															<tr>
																<td><h5 class="text-info" style="color:#5f768b;">주소</h5></td>
																<td style="text-align:right;"><h5 id="userAddress">${sessionScope.login.userAddress}</h5></td>
															</tr>
														</table>
													</div>
												</div>
												<div id="cancleOrder" style="display: none">
													<form action="./cancleMyOrder" name="cancleOrderForm" method="post">
														<input type="hidden" id="cancleOrderId" name="orderId">
													</form>
													<button class="btn btn-default" onclick="cancleOrder()" style="float:right; margin:10px;">거래취소</button>
												</div>
											</div>
										</div>
									</div>
								</div>	<!-- end of modal-body -->
							</div> <!-- end of modal-content -->
						</div> 
					</div> <!-- end of modal -->
					
					<!-- 리뷰작성 페이지 -->			
					<div class="modal fade" id="insertMyReviewForm">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
								</div>
								<!-- body -->
								<div class="modal-body">
									<div class="container">
										<div id="login-row" class="row justify-content-center align-items-center">
											<div id="login-column" class="col-md-6">
												<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
					            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
													<form action="./insertMyReview" method="post" enctype="multipart/form-data">										
														<input type="hidden" id="reviewId" name="orderId">
														<input type="hidden" class="itemId" name="itemId">
														<h4 class="text-info" style="color:black;">리뷰 작성</h4><hr/>
														<div class="form-group">
															<!-- 별점 등록 부분 -->
															<input id="reviewStar" name="reviewStar" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1">
															<textarea name="reviewContent" class="form-control" placeholder="리뷰 내용을 입력해주세요." rows="5" style="margin-bottom:10px"></textarea>
															
															<!-- 다중파일 업로드 -->
															<div class="container my-4" style="width:100%; padding:0">
																<div class="form-group">
															    	<div class="file-loading">
															        	<input multiple="multiple" name="reviewPicFile" id="file-5" class="file" type="file" multiple data-preview-file-type="any" data-upload-url="#" data-theme="fas">
															        </div>
															    </div>
															</div>
															
														</div>
														<div class="form-group">
															<input type="submit" class="btn btn-default"  style="float:right;" value="등록">
															<p style="clear:both"/>
														</div>
													</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>	<!-- end of modal-body -->
							</div> <!-- end of modal-content -->
						</div> 
					</div> <!-- end of modal -->
					
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="resources/js/mypage.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>