<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
#login-row {
	margin-left: -230px;
	margin-right: 440px;
}
</style>
<script>
	/* function insertCartbtn(){
		var s = document.getElementById('myId').value;
		var url = 'getCartList.jsp?myId=' + encodeURI(s);
		window.location.href = url;
	} */
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
							<h2 style="color: black">카테고리</h2>
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

								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">유심</a></li>
									<li class="breadcrumb-item"><a href="#">유심</a></li>
									<li class="breadcrumb-item"><a href="#">유시이임</a></li>
									<li class="breadcrumb-item active" aria-current="page">현재유심페이지!</li>
								</ol>

								<div class="btn-group pull-right">
									<a href="updateProduct?itemId=${product.itemId}"
										class="btn btn-link">수정하기</a> <a
										href="deleteProduct?itemId=${product.itemId}"
										class="btn btn-link btn-share">삭제하기</a>
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
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												<div class="item active">
													<img src="https://via.placeholder.com/350x350/ffcf5b"
														alt="Los Angeles" style="width: 100%;">
												</div>

												<div class="item">
													<img src="https://via.placeholder.com/350x350/ffcf5b"
														alt="Chicago" style="width: 100%;">
												</div>

												<div class="item">
													<img src="https://via.placeholder.com/350x350/ffcf5b"
														alt="New york" style="width: 100%;">
												</div>
											</div>
											<!-- Left and right controls -->
											<a class="left carousel-control" href="#myCarousel"
												data-slide="prev"> <span
												class="glyphicon glyphicon-chevron-left"></span> <span
												class="sr-only">Previous</span>
											</a> <a class="right carousel-control" href="#myCarousel"
												data-slide="next"> <span
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
										<small>몇개팔렸을까여?</small>
										<small class="pull-right">작성일</small>
									</p>
									<div class="row">
									<h1 class="col-md-9 product-title display-1 mb-2">${product.itemName}</h1>
									<h3 class="col-md-3 product-price display-3">￦${product.itemPrice}</h3>
									</div>
									<p class="mb-0">
										<i class="fa fa-truck"></i>${product.itemCondition} <small
											class="pull-right text-success">${product.itemOrderdetail}</small>
									</p>
									<div class="text-muted mb-2">
										<small>약간의 사용감이 있습니다!</small>
									</div>
									<!-- 구매가능하면 text-success 구매불가하면 text-danger -->
									<label for="quant">수량</label> <input type="number"
										name="itemEa" min="1" id="quant" value=""
										class="form-control mb-5 input-lg" placeholder="1개 이상 선택하세요">
										<input type="hidden" value="${sessionScope.login.userId}" name="myId">
									<input type="hidden" value="${product.itemId}" name="itemId">
									<!-- </form> -->
									<div class="order-buton align-content-sm-center">
										<!-- 테스터 -->
										<a role="button" class="col btn btn-lg btn-block btn-light"
											href="./getCartList?myId=${sessionScope.login.userId}">
											전체 장바구니 보기${sessionScope.login.userId}</a>
											<button class="col btn btn-lg btn-block" type="submit">장바구니담기</button>
											<a role="button" class="col btn btn-lg btn-block">대화하기</a>
										<a role="button" class="btn btn-lg btn-block btn-light"
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
											<dd class="col-sm-8">${product.itemEa}</dd>
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
										<p>${product.itemContent}</p>
									</div>
									<div class="product-faq mb-5">
										<h2 class="mb-3">Q/A라고 쓰고 큐엔에이라고 읽</h2>
										<p class="text-muted">판매자에게 상품에 대한 질문을 해보세여!</p>
										<div class="main-questions d-inline" data-container="body"
											data-toggle="popover" data-placement="right"
											data-content="Are you in doubt? these shortcuts can help you!">
											<a href="#" class="btn btn-outline-primary">판매자에게메세지</a> <a
												href="#" class="btn btn-outline-primary">???????????????</a>
											<a href="#" class="btn btn-outline-primary">이건질문들옵션창같은데</a>
										</div>
									</div>
									<div class="product-comments">
										<h5 class="mb-2">다른 사람들의 후기를 좀 봐볼까나?</h5>
										<form action="" class="form-inline mb-5">
											<textarea name="" id="" cols="50" rows="2"
												class="form-control mb-4" placeholder="후기쓰봐라"></textarea>
											<button class="btn btn-lg-12 btn-primary">후기를 입력해보세</button>
										</form>
										<h5 class="mb-5">!후기!</h5>
										<c:forEach items="${orderList}" var="order">
										<ol class="list-unstyled last-questions-list">
											<li><i class="fa fa-comment"></i> 
												<span>
													${order.reviewStar}
													${order.reviewContent}
													${order.reviewDate}
													${order.reviewPic}
												</span>
											</li>
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