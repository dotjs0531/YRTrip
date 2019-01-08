<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- 제품명들어갈듯 -->
<title>prototype of insertProduct(view)</title>
<!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<link href="resources/css/product.bootstrap.min.css" rel="stylesheet"> -->

<link href="resources/css/product.bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"> -->
<!-- 다중파일 업로드 -->
<link href="resources/css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="resources/js/fileinput.js" type="text/javascript"></script>

<style>

#login-column {
   width:100%;
   margin: 0 10px;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}

.carousel-control.left, .carousel-control.right {
	backround-image: none !important;
}

.space-ten {
	padding: 10px 0;
}

.space-five {
	padding: 5px 0;
}

.space-two {
	padding: 2px 0;
}

.space-one {
	padding: 1px 0;
}

.quantity-style {
	text-align: center;
	min-width: 38px;
	max-width: 38px;
}

.quantity-wrapper {
	width: 38px;
	position: center;
}

.col_product {
	text-align: center;
}

.share-btn {
	display: inline-block;
	color: #ffffff;
	border: none;
	padding: 0.5em;
	width: 4em;
	box-shadow: 0 2px 0 0 rgba(0, 0, 0, 0.2);
	outline: none;
	text-align: center;
}

.share-btn:hover {
	color: #eeeeee;
}

.share-btn:active {
	position: relative;
	top: 2px;
	box-shadow: none;
	color: #e2e2e2;
	outline: none;
}

.share-btn.twitter {
	background: #55acee;
}

.share-btn.google-plus {
	background: #dd4b39;
}

.share-btn.facebook {
	background: #3B5998;
}

.share-btn.stumbleupon {
	background: #EB4823;
}

.share-btn.reddit {
	background: #ff5700;
}

.share-btn.linkedin {
	background: #4875B4;
}

.share-btn.email {
	background: #444444;
}

#blah {
	align-content: center;
	width: 100%;
	max-width: 600px;
	height: 100%;
	max-width: 400px;
}

#login-row {
	margin-left: -230px;
	margin-right: 440px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$(function(){
    var productMenu = document.getElementById("productMenu");
    productMenu.className='current-menu-item';
});
</script>
<script>
/* $(function(){
	$('#product_cart_insert').delegate("a", "click", function(){
		$(this).data('clicked', true)
	});	
});

function p_cat(){
	
	if($("#pciClothes").data('clicked')){
		$("itemCategory").empty();
		$('#itemCategory').val($('#pciClothes').text());
	}
	else if($("#pciTicket").data('clicked')){
		$("itemCategory").empty();
		$('#itemCategory').val($("#pciTicket").text());
	}
	else if($("#pciElectronic").data('clicked')){
		$("itemCategory").empty();
		$('#itemCategory').val($("#pciElectronic").text());
	}
	else if($("#pciBook").data('clicked')){
		$("itemCategory").empty();
		$('#itemCategory').val($("#pciBook").text());
	}
	else if($("#pciUSIM").data('clicked')){
		$("itemCategory").empty();
		$('#itemCategory').val($("#pciUSIM").text());
	}
	else if($("#pciETC").data('clicked')){
		$("itemCategory").empty();
		$('#itemCategory').val($("#pciETC").text());
	} */
/* 역시 사람은 머리를 써야한다 */
$(function(){
	$('#product_cart_insert').on("click", "li", function(){
		$("#itemCategory").val($(this).find("a").text());
	});
});

	

</script>
</head>

<body>
	<section class="about_us_area" id="about">
		<div class="container">
			<div class="row">
				<div class="container col-lg-3">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">중고거래</h2>
						</div>

						<ul class="price-list" id="product_cart_insert">
							<li><a href="getProductList" style="color: blue">선택하세요</a></li>
							<li><a id="pciClothes" onclick="p_cat();" href="#"
								style="color: black">의류</a></li>
							<li><a id="pciTicket" onclick="p_cat();" href="#"
								style="color: black">티켓/쿠폰</a></li>
							<li><a id="pciElectronic" onclick="p_cat();" href="#"
								style="color: black">전자기기</a></li>
							<li><a id="pciBook" onclick="p_cat();" href="#"
								style="color: black">여행도서</a></li>
							<li><a id="pciUSIM" onclick="p_cat();" href="#"
								style="color: black">USIM</a></li>
							<li><a id="pciETC" onclick="p_cat();" href="#"
								style="color: black">기타</a></li>
						</ul>

						
					</div>
				</div>

				<!-- 끝 : 사이드 : 3-->
				<!-- 시작 : 내용 : 9-->

				<div class="container col-lg-9">
					<form action="./updateProduct?itemId=${product.itemId}" method="post" enctype="multipart/form-data">
						<div class="card mb-10">
							<div class="card-header">
								<nav class="header-navigation">
									<div>
										<a href="#" class="btn btn-link"> ← 이전으로 돌아가기 </a>
									</div>
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#">카테고리를 설정하세요</a></li>
										<li class="breadcrumb-item active" aria-current="page">카테고리선택</li>
									</ol>
									<div class="pull-left">
										<h4>${sessionScope.login.userId}님의 {product.itemName}제품 수 정 중 ...</h4>
									</div>
									<div class="pull-right">
										<button onclick="insert_reset();" class="btn btn-link" type="reset">초기화</button> <input
											type="submit" class="btn" value="수정">
									</div>
								</nav>
							</div>
							<div class="card-body store-body">
								<!-- 상품명 : -->
								<div class="row">
									<div class="col-12 col-md-12">
										<input type="text" class="form-control is-valid input-lg"
											name="itemName" value="${product.itemName}" placeholder="상품명을 적어주세요" required>
									</div>
								</div>
								<div class="space-five"></div>
								<!-- Carousel -->
								<div class="row">
											<!-- 다중파일 업로드 -->
									<div class="container my-4" style="width: 100%; padding: 0">
										<div class="form-group">
											<div class="file-loading">
												<input multiple="multiple" id="file-5" name="productPicFile" class="file" type="file" multiple
													data-preview-file-type="any" data-upload-url="#"
													data-theme="fas">
											</div>
										</div>
									</div>
								</div>
								<div class="space-five"></div>
								<!-- 가격 : 카테고리 선택시 바로 입력되도록-->
								<!-- 모바일 및 데스크톱에서 항상 칼럼폭이 50% 입니다. -->
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>카테고리</h4>
									</div>
									<div class="col-12 col-md-8">
										<input type="text" class="form-control mb-5 input-lg"
											name="itemCategory" id="itemCategory" value="${product.itemCategory}" placeholder="카테고리"
											required>
										<div class="invalid-feedback">카테고리 설명</div>
									</div>
								</div>
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>가격</h4>
									</div>
									<!-- 가격 : 1. 앞에 0으로 시작할시 입력 안되게 2.1원단위 못적게??? -->
									<div class="col-12 col-md-8">
										<input type="number" class="form-control mb-5 input-lg"
											name="itemPrice" placeholder="가격을 10원이상 입력하고 1원단위는 피해주세요" value="${product.itemPrice}" min="10"	required>
										<!-- <div class="invalid-feedback">
										</div> -->
									</div>
								</div>

								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>수량</h4>
									</div>
									<div class="col-12 col-md-8">
<!-- 수량 : 0 막아놓기 -->
										<input type="number" min="1" name="itemEa" value="${product.itemEa}"
											class="form-control mb-5 input-lg" placeholder="1개 이상 선택하세요" required>
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
												value="새상품" <c:if test=${product.itemCondition eq '새상품'}>checked</c:if> 
												required> 새상품
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="약간중고" <c:if test=${product.itemCondition eq '약간중고'}>checked</c:if>
												 required> 약간중고
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="조금중고" <c:if test=${product.itemCondition eq '조금중고'}>checked</c:if> 
												 required> 조금중고
											</label>
										</div>
										<div class="form-check form-check-inline">
											<label class="form-check-label"> <input
												class="form-check-input" type="radio" name="itemCondition"
												value="완전중고" <c:if test=${product.itemCondition eq '완전중고'}>checked</c:if> 
												required> 완전중고
											</label>
										</div>
									</div>
								</div>
								<div class="space-five"></div>
								<input type="hidden" name="itemMethod" value="카드결제">
<!-- 결제방법 : 1.값 두개다 db에 들어갈 수 있도록  -->
								<!-- <div class="row price_list">
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
								</div> -->
								<div>
									<div class="spcae-five"></div>
									<h4>제품설명</h4>
									<textarea name="itemContent" class="form-control col-sm-12"
										rows="5" required>${product.itemContent}</textarea>
								</div>
<!-- 판매자 아이디 : sessionScope session값들고오기 -->
								<input type="hidden" name="sellerId"
									value="${sessionScope.login.userId}">
<!--  구매가능 여부 : 구매가능(defalut)  -->
							<input type="hidden" name="itemOrderdetail"
									value="구매가능">
							</div>
						</div>
					</form>
				</div>
				<!-- 끝 : 내용 : 9-->
			</div>
			<!-- /.row -->
		</div>
	</section>

	<!-- 부트 4 공식 JS-->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>