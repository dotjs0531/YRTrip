<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<!-- 
상품글번호 1 ITEM_ID
상품명 유심  ITEM_NAME
가격 3000 ITEM_PRICE
수량 1 ITEM_EA
상품상세정보 사세여........ ITEM_CONTENT
결제방법 카드결제/현금결제/ ITEM_METHOD
카테고리 유심(db에는 카테고리1이렇게 들어가있음) ITEM_CATEGORY
판매자 회원아이디(fk) user1 SELLER_ID
구매가능여부 구매가능/구매불가 itemOrderdetail
상품별점 0.0-5.0 ITEM_STAR
상품사진 주소값넣기 ITEM_PIC
작성날짜 sysdate ITEM_DATE
상품상태 : 중고/ 새상품/ 하자있음... ITEM_CONDITION
상품 좋아요 별점 0+ ITEM_LIKE - 위시리스트 -> 좋아요로 바꾸고 좋아요한 목록에서 볼수있도록 
-->

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- 제품명들어갈듯 -->
<title>제품 상세 페이지</title>
<link href="./resources/css/product.bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#login-column {
   width:100%;
   margin: 0 10px;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
</style>
<script>
$(function(){
    var productMenu = document.getElementById("productMenu");
    productMenu.className='current-menu-item';
});
</script>
<script>
	/* function insertCartbtn(){
		var s = document.getElementById('myId').value;
		var url = 'getCartList.jsp?myId=' + encodeURI(s);
		window.location.href = url;
	} */
	
	function disLike(uId, lC, lBid) {
		location.href = "./deleteLike?userId=" + uId + "&likeCategory=" + lC
				+ "&likeBoardid=" + lBid;
	};
	/* 좋아요 */
	$(function(){
		/* 캐러셀 div class 계속 변경 시키는 스크립트 */
		var carousel_class_init = "active";	
		var carousel_ea = $("div#itemC").length;
		console.log(carousel_ea);
		for(i=0; i<1; i++){
			$("#itemC").addClass(carousel_class_init);
		}	

		if($("#itemOrderdetail_class").text() == '구매불가'){
			$("#itemOrderdetail_class").removeClass("text-success").addClass("text-danger")
		}
				
		
		function likeCondition() {
			var params = {
				userId : '${sessionScope.login.userId}',
				likeCategory : 'I',
				likeBoardid : '${product.itemId}'
			}
			$.getJSON("getLike", params, function(data) {
				if (!data) {
					var div = makeDisLikeBtn();
					$(div).appendTo("#LikeCondition");
				} else {
					var div = makeLikeBtn();
					$(div).appendTo("#LikeCondition");
				}
			})
		}
		function makeDisLikeBtn() {
			var div = $("<div>");
			div.addClass('LikeCondition');
			var str = "<form action='./insertLike' method='post'>"
					+ "<input type='hidden' name='likeCategory' value='I'>"
					+ "<input type='hidden' name='likeBoardid' value='${product.itemId}'>"
					+ "<input type='hidden' name='userId' value='${sessionScope.login.userId}'>"
					+ "<button type='submit' style='border:0; outline:0; background-color: transparent !important; width:20px; height:20px;'>"
					+ "<img src='./images/dislike.png'></button></form>"
			div.html(str);
			return div;
		}
		function makeLikeBtn() {
			var div = $("<div>");
			div.addClass('LikeCondition');
			var str = "<button onclick=\"disLike('${sessionScope.login.userId}','I','${product.itemId}')\" style='border:0; outline:0; background-color: transparent !important; width:20px; height:20px;'>"
					+ "<img src='./images/like.png'></button>"
			div.html(str);
			return div;
		}
		likeCondition();
	});
</script>
<script>
$(function(){
	if($("#item_ea_js").text() == 0 || "${sessionScope.login.userId}" == "${product.sellerId}")
	{
		$("#insertcart").attr("disabled", "disabled");
		$("#insertcart").text("구매불가");
	}
	
	if("${sessionScope.login.userId}" != "${product.sellerId}"){
		$("#seller-only").hide();	
	}
});
</script>
<script>
function deleteProduct(){	
		if(confirm("삭제하시겠습니까? \n(복구는 불가합니다)") == true){
			if('구매불가' != '${product.itemOrderdetail}'){
				alert("구매중인 구매자가 있습니다.\n해당상품의 구매자목록을 확인하세요");
				return false;
			}
			else{
				alert("삭제됩니다\n복구는 불가합니다");
				$("#deleteProduct").attr("href", "deleteProduct?itemId=${product.itemId}");
				return true;
			}
		}
		else{
			return false;
		}
	}

</script>
</head>
<body>

	<section class="about_us_area" id="about">

		<!-- Page Content 전체 바디 -->
		<div class="container">

			<div class="row">
				<!-- 시작 : 사이드 :  3-->
				<div class="container col-lg-3">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">중고거래</h2>
						</div>
						<ul class="price-list">
							<li><a href="getProductList" style="color: black">전체보기</a></li>
							<li><a href="#" style="color: black">의류</a></li>
							<li><a href="#" style="color: black">티켓/쿠폰</a></li>
							<li><a href="#" style="color: black">전자기기</a></li>
							<li><a href="#" style="color: black">여행도서</a></li>
							<li><a href="#" style="color: black">USIM</a></li>
							<li><a href="#" style="color: black">기타</a></li>
						</ul>
						<div class="order-buton">
							<a href="#">상품요청</a>
						</div>
						<div class="order-buton">
							<a href="#">상품등록</a>
						</div>
					</div>
				</div>
				<!-- 끝 : 사이드 : 3-->
				<!-- 시작 : 내용 : 9-->
				<div class="container col-lg-9">					
					<div class="card mb-10">
						<div class="card-header">
							<nav class="header-navigation">
								<a href="#" class="btn btn-link"> ← 이전으로 돌아가기 </a>
								<c:choose>
									<c:when test="${not empty sessionScope.login}">
										<div id="LikeCondition" style="float: right"></div>
									</c:when>
									<c:otherwise>
										<div style="float: right">
											<img src="./images/dislike.png" width="20px">
										</div>
									</c:otherwise>
								</c:choose>
								<ol class="breadcrumb">
									<li class="breadcrumb-item">${product.itemCategory}</li>
									<li class="breadcrumb-item active" aria-current="page">${product.itemName}</li>
								</ol>

								<div class="btn-group pull-right" id="seller-only">
									<a href="updateProduct?itemId=${product.itemId}"
										class="btn btn-link">수정하기</a> <a id="deleteProduct"
										onclick="deleteProduct();" class="btn btn-link btn-share">삭제하기</a>
								</div>
							</nav>
						</div>
						<div class="card-body store-body">
							<!-- 왼쪽 -->
							<div class="product-info">
								
								<!-- 왼쪽 갤러리(사진들만) -->
								<div class="product-gallery">
									<div class="product-gallery-featured">
										<div id="myCarousel" class="carousel slide"
											data-ride="carousel">
											<!-- Indicators -->
											<ol class="carousel-indicators">
												<li data-target="#myCarousel" data-slide-to="0"
													class="active"></li>
												<li data-target="#myCarousel" data-slide-to="1"></li>
												<li data-target="#myCarousel" data-slide-to="2"></li>
											</ol>
												<!-- 사진넣는부분 -->
											<div class="carousel-inner">
												<c:set var="productPicFile"
													value="${fn:split(product.itemPic, ',')}" />
												<c:forEach items="${productPicFile}" var="pic">
												<div id="itemC" class="item">
													<img class="img-responsive center-block" id="img" src="./images/product/${pic}"
														style="height: 600px;" />
												</div>												
												</c:forEach>
											</div>
											
											<!--왼쪽 / 오른쪽 화살표-->
											<a class="left carousel-control" href="#myCarousel"
												data-slide="prev" style="opacity: 0;"> <span
												class="glyphicon glyphicon-chevron-left"></span> <span
												class="sr-only">Previous</span>
											</a> 
											<a class="right carousel-control" href="#myCarousel"
												data-slide="next" style="opacity: 0;"> <span
												class="glyphicon glyphicon-chevron-right"></span> <span
												class="sr-only">Next</span>
											</a>
										</div>
									</div>
								</div>
								<!-- 오른쪽 아래 -->
								<div class="product-payment-details">
									<form action="./insertCart">
										<p class="last-sold text-muted">
											<small>몇개팔렸을까여?</small> <small class="pull-right">작성일</small>
										</p>
										<div class="row">
											<h1 class="col-md-8 product-title display-1">${product.itemName}</h1>
											<h1 class="col-md-4 product-price display-1">￦${product.itemPrice}</h1>
										</div>
										<p class="mb-0">
											<i class="fa fa-truck"></i>${product.itemCondition}
											<small id="itemOrderdetail_class" class="pull-right text-success">${product.itemOrderdetail}</small>
										</p>
										<div class="text-muted mb-2">
											<small>약간의 사용감이 있습니다!</small>
										</div>
										<label for="quant">수량</label> <input type="number"
											name="itemEa" min="1" max="${product.itemEa}" id="quant" value=""
											class="form-control mb-5 input-lg" placeholder="1개 이상 선택하세요">
										<input type="hidden" value="${sessionScope.login.userId}"
											name="myId"> <input type="hidden"
											value="${product.itemId}" name="itemId">
										<!-- </form> -->
										<div class="order-buton align-content-sm-center">
											<!-- 테스터 -->
											<a role="button" class="col btn btn-lg btn-block btn-light"
												href="./getCartList?myId=${sessionScope.login.userId}">
												전체 장바구니 보기${sessionScope.login.userId}</a>
											<button class="col btn btn-lg btn-block" type="submit" id="insertcart">장바구니담기</button>
											<a role="button" class="col btn btn-lg btn-block">대화하기</a> <a
												role="button" class="btn btn-lg btn-block btn-light"
												href="./purchasingProduct">구매하기</a>
										</div>


									</form>
								</div>
								<div class="product-seller-recommended">
									<h3 class="mb-5">판매자의 다른 상품</h3>
									<!-- 상품이 없으면 어떻하지? 아무것도 안 뜨게 해야하나???-->
									<div class="row">
										<!-- <div class="recommended-items card-deck"> -->
										<div class="col-md-4">
											<div class="card">
												<img src="https://via.placeholder.com/157x157"
													class="card-img-top">
												<div class="card-body">
													<h5 class="card-title">판매자 다른 상품 이름</h5>
													<span class="text-muted">￦ 12,000</span>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="card">
												<img src="https://via.placeholder.com/157x157"
													class="card-img-top">
												<div class="card-body">
													<h5 class="card-title">판매자 다른 상품 이름1</h5>
													<span class="text-muted">￦ 12,000</span>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="card">
												<img src="https://via.placeholder.com/157x157"
													class="card-img-top">
												<div class="card-body">
													<h5 class="card-title">판매자 다른 상품 이름1</h5>
													<span class="text-muted">￦ 12,000</span>
												</div>
											</div>
										</div>

										<!-- </div> -->
									</div>
									<!-- /.recommended-items-->
									<p class="mb-5 mt-5">
										<a href="#">판매자의 모든 상품 보러가기!</a>
									</p>
									<div class="product-description mb-5">
										<h2 class="mb-5">제품 기본정보</h2>
										<dl class="row mb-5">
											<dt class="col-sm-4">상품명</dt>
											<dd class="col-sm-8">${product.itemName}</dd>
											<dt class="col-sm-4">가격</dt>
											<dd class="col-sm-8">${product.itemPrice}</dd>
											<dt class="col-sm-4">수량</dt>
											<dd class="col-sm-8" id="item_ea_js">${product.itemEa}</dd>
											<dt class="col-sm-4">선호결제방법</dt>
											<dd class="col-sm-8">${product.itemMethod}</dd>
											<dt class="col-sm-4">구매가능여부</dt>
											<dd class="col-sm-8">${product.itemOrderdetail}</dd>
											<dt class="col-sm-4">상품상태</dt>
											<dd class="col-sm-8">${product.itemCondition}</dd>
											<dt class="col-sm-4">작성일</dt>
											<dd class="col-sm-8">${product.itemDate}</dd>
											<dt class="col-sm-4">판매자명</dt>
											<dd class="col-sm-8">${product.sellerId}</dd>
										</dl>
										<h2 class="mb-5">제품 상세 설명</h2>
										<pre style="background-color:white; line-height:1.3em">${product.itemContent}</pre>
									</div>
									<!-- <div class="product-faq mb-5">
										<h2 class="mb-3">Q/A라고 쓰고 큐엔에이라고 읽</h2>
										<p class="text-muted">판매자에게 상품에 대한 질문을 해보세여!</p>
										<div class="main-questions d-inline" data-container="body"
											data-toggle="popover" data-placement="right"
											data-content="Are you in doubt? these shortcuts can help you!">
											<a href="#" class="btn btn-outline-primary">판매자에게메세지</a> <a
												href="#" class="btn btn-outline-primary">???????????????</a>
											<a href="#" class="btn btn-outline-primary">이건질문들옵션창같은데</a>
										</div>
									</div> -->
									<div class="product-comments">
										<h2 class="mb-2">판매자와 거래 후 남긴 후기들</h2>
										<!-- <form action="" class="form-inline mb-5">
											<textarea name="" id="" cols="50" rows="2"
												class="form-control mb-4" placeholder="후기후기후기"></textarea>
											<button class="btn btn-lg-12 btn-primary">후기를 입력해보세</button>
										</form>
										<h5 class="mb-5">!후기!</h5> -->
										<c:forEach items="${orderList}" var="order">
											<ol class="list-unstyled last-questions-list">
												<li><i class="fa fa-comment"></i> <span>
														${order.reviewStar} ${order.reviewContent}
														${order.reviewDate} ${order.reviewPic} </span></li>
											</ol>
										</c:forEach>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- 끝 : 내용 : 9-->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container 전체 바디끝-->
	</section>

	<!-- Bootstrap core JavaScript -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>