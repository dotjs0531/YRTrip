<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
구매가능여부 구매가능/구매불가 ITEM_ORDERDETAIL
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
<title>등록 제품 수정</title>

<!-- Bootstrap core CSS -->
<!--  product.bootstrap.min.css 이거 어쩌냐ㅠㅠ -->
<link href="resources/css/product.bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
<!-- Custom styles for this template -->
<!-- <link href="./css/shop-homepage.css" rel="stylesheet"> -->
<!-- <link href="resources/css/product.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz">
<script>
    var slideIndex = 0;
    $('#myCarousel').on('slide.bs.carousel', function () {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      slideIndex++;
      if (slideIndex > slides.length) { slideIndex = 1 }
      slides[slideIndex - 1].style.display = "block";
      setTimeout(showSlides, 2000); // Change image every 2 seconds
    })
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
				<div class="container col-lg-8">

					<div class="card mb-10">
						<div class="card-header">
							<nav></nav>
						</div>
						<div class="card-body store-body">
							<!-- 왼쪽 -->
							<div class="product-info">
								<!-- 왼쪽 갤러리(사진들만) -->
								<div class="product-gallery">
									<div class="product-gallery-featured">
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