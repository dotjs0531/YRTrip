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
		<div class="container">
			<div class="row">
				<div class="container col-lg-3">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">카테고리</h2>
						</div>
						<ul class="price-list" id="product_cart_insert">
							<li><a href="getProductList" style="color: black">전체보기</a></li>
							<li><a id="pciClothes" onclick="p_cat()" href="#" style="color: black">의류</a></li>
							<li><a id="pciTicket" onclick="p_cat()" href="#" style="color: black">티켓/쿠폰</a></li>
							<li><a id="pciElectronic" onclick="p_cat()" href="#" style="color: black">전자기기</a></li>
							<li><a id="pciBook" onclick="p_cat()" href="#" style="color: black">여행도서</a></li>
							<li><a id="pciUSIM" onclick="p_cat()" href="#" style="color: black">USIM</a></li>
							<li><a id="pciETC" onclick="p_cat()" href="#" style="color: black">기타</a></li>
						</ul>
						<div class="order-buton">
							<a href="#">상품요청</a>
						</div>
						<div class="order-buton">
							<a href="insertProduct">상품등록</a>
						</div>
					</div>
				</div>

				<!-- 끝 : 사이드 : 3-->
				<!-- 시작 : 내용 : 9-->
				
				<div class="container col-lg-9">
					<form action="./updateProduct" method="post">
						<div class="card mb-10">
							<div class="card-header">
								<nav class="header-navigation">
									<div>
										<a href="#" class="btn btn-link"> ← 이전으로 돌아가기 </a>
										
									</div>
									<ol class="breadcrumb">
										
									</ol>
									<div class="pull-left"><h4>'session값 들고'만의 상품을 공유해줘!</h4></div>
										<div class="pull-right">
											<a href="#" class="btn btn-link">모두삭제</a> 
											<input type="submit" class="btn" value="수정">
										</div>
								</nav>
							</div>
							<div class="card-body store-body">
								
								<!-- 상품명 : -->
								<div class="row">
									<div class="col-12 col-md-12">
										<input type="text" class="form-control is-valid input-lg"
											name="itemName" placeholder="상품명을 적어주세요" value="${product.itemName}" required>
									</div>
								</div>
								<div class="space-five"></div>
								<!-- 상품사진 drag& drop -->
								<div class="row">
									<div class="col-md-8 text-center"><img id="blah" src="http://placehold.it/180" alt="your image" /></div>
									<!-- 파일 불러오고 명 보여주는건데 4.0에서 들고와서 그런지 안된다.... -->
									<div class="col-md-4">
										<div class="row">
											<input type='file' onchange="readURL(this);" />  											
  										</div>
										<div class="row">
										<input type='file' onchange="readURL(this);" />
										</div>
										<div class="row">
										<input type='file' onchange="readURL(this);" />
										</div>
										<div class="row">
										<input type='file' onchange="readURL(this);" />
										</div>
									</div>
								</div>
								<div class="space-five"></div>
								<!-- 가격 : 카테고리 선택시 바로 입력되도록-->
								<!-- 모바일 및 데스크톱에서 항상 칼럼폭이 50% 입니다. -->
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>카테코리</h4>
									</div>
									<div class="col-12 col-md-8">
										<input type="text" class="form-control mb-5 input-lg"
											name="itemCategory" id="itemCategory" value="${product.itemCategory}"
											placeholder="카테고리" required>
										<div class="invalid-feedback">카테고리 설명</div>
									</div>
								</div>
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>가격</h4>
									</div>
									<!-- 가격 : 1. 앞에 0으로 시작할시 입력 안되게 2.1원단위 못적게??? -->
									<div class="col-12 col-md-8">
										<input type="text" class="form-control mb-5 input-lg"
											name="itemPrice" value="${product.itemPrice}" placeholder="가격" required>
										<div class="invalid-feedback">가격을 입력하세요</div>
									</div>
								</div>
								<!-- 수량 : 1.0 막아놓기 -->
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>수량</h4>
									</div>
									<div class="col-12 col-md-8">
										<input type="text" class="form-control mb-5 input-lg"
											name="itemEa" value="${product.itemEa}" placeholder="수량" required>
									</div>
								</div>
								<!-- 상품상태 : 하나만 체크 되도록 -->
								<div class="row">
									<div class="col-6 col-md-4">
										<h4>상품상태</h4>
									</div>
									<div class="col-12 col-md-8 input-lg">
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="새상품"> 새상품
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="약간중고"> 약간중고
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="조금중고"> 조금중고
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="완전중고"> 완전중고
											</label>
										</div>
									</div>
								</div>
								<div class="space-five"></div>
								<!-- 결제방법 : 1.값 두개다 db에 들어갈 수 있도록  -->
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>선호결제방법</h4>
									</div>
									<div class="col-12 col-md-8 input-lg">
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="checkbox" name="itemMethod"
												value="현금결제"> 현금결제(만나서 결제)
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="checkbox" name="itemMethod"
												value="카드결제"> 카드결제
											</label>
										</div>
									</div>
								</div>
								<div>
									<div class="spcae-five"></div>
									<h4>제품설명</h4>
									<textarea name="itemContent" class="form-control col-sm-12"
										rows="5" value="${product.itemContent}"></textarea>
								</div>
								<div class="col-6 col-md-4">
										<h4>상품상태</h4>
										<input type="text" class="form-control mb-5 input-lg"
											name="itemCategory" id="itemAvailable" value="${product.itemAvailable}"
											placeholder="카테고리" required>
								</div>
								<!-- 판매자 아이디 : sessionScope session값들고오기 -->
								<input type="hidden" name="sellerId" value="user1">
								<input type="hidden" name="itemId" value="${product.itemId}">
								<!--  구매가능 여부 : 구매가능(defalut)  --> 
								
							</div>
						</div>
					</form>
				</div>
				<!-- 끝 : 내용 : 9-->
			</div>
			<!-- /.row -->
		</div>
	</section>
	<!-- Bootstrap core JavaScript -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>