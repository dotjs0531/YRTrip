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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<link href="resources/css/product.bootstrap.min.css" rel="stylesheet">
<style>
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

#blah{
align-content: center;
    width:100%;
    max-width:600px;
    height:100%;
    max-width:400px;
    
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$(function(){
	$('#product_cart_insert').delegate("a", "click", function(){
		$(this).data('clicked', true)
	})
});

function p_cat(){
	if($("#pciClothes").data('clicked')){
		$('#itemCategory').val($('#pciClothes').text());
	}
	else if($("#pciTicket").data('clicked')){
		$('#itemCategory').val($("#pciTicket").text());
	}
	else if($("#pciElectronic").data('clicked')){
		$('#itemCategory').val($("#pciElectronic").text());
	}
	else if($("#pciBook").data('clicked')){
		$('#itemCategory').val($("#pciBook").text());
	}
	else if($("#pciUSIM").data('clicked')){
		$('#itemCategory').val($("#pciUSIM").text());
	}
	else if($("#pciETC").data('clicked')){
		$('#itemCategory').val($("#pciETC").text());
	}
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
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
					<form action="./insertProduct" method="post">
						<div class="card mb-10">
							<div class="card-header">
								<nav class="header-navigation">
									<div>
										<a href="#" class="btn btn-link"> ← 이전으로 돌아가기 </a>
										<div class="btn-group pull-right">
											<!-- Social Button HTML -->

											<!-- Twitter -->
											<a
												href="http://twitter.com/share?url=<URL>&text=<TEXT>&via=<VIA>"
												target="_blank" class="share-btn twitter"> <i
												class="fab fa-twitter"></i>
											</a>

											<!-- Google Plus -->
											<a href="https://plus.google.com/share?url=<BTN>"
												target="_blank" class="share-btn google-plus"> <i
												class="fab fa-google-plus"></i>
											</a>

											<!-- Facebook -->
											<a href="http://www.facebook.com/sharer/sharer.php?u=<URL>"
												target="_blank" class="share-btn facebook"> <i
												class="fab fa-facebook"></i>
											</a>
										</div>
									</div>
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#">카테고리를 설정하세요</a></li>
										<li class="breadcrumb-item active" aria-current="page">카테고리선택</li>
									</ol>
									<div class="pull-left"><h4>'session값 들고'만의 상품을 공유해줘!</h4></div>
										<div class="pull-right">
											<a href="#" class="btn btn-link">모두삭제</a> 
											<input type="submit" class="btn" value="등록">
										</div>
								</nav>
							</div>
							<div class="card-body store-body">
								<!-- 상품명 : -->
								<div class="row">
									<div class="col-12 col-md-12">
										<input type="text" class="form-control is-valid input-lg"
											name="itemName" placeholder="상품명을 적어주세요" required>
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
											name="itemCategory" id="itemCategory" placeholder="카테고리" required>
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
											name="itemPrice" placeholder="가격" required>
										<div class="invalid-feedback">가격을 입력하세요</div>
									</div>
								</div>
								<!-- 수량 : 1.0 막아놓기 -->
								<div class="row price_list">
									<div class="col-6 col-md-4">
										<h4>수량</h4>
									</div>
									<div class="col-12 col-md-8">
										<input type="number" name="quantity" min="1" name="itemEa"
											class="form-control mb-5 input-lg"
											placeholder="1개 이상 선택하세요">
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
										rows="5"></textarea>
								</div>
								<!-- 판매자 아이디 : sessionScope session값들고오기 -->
								<input type="hidden" name="sellerId" value="user1">
								<!--  구매가능 여부 : 구매가능(defalut)  --> 
								<input type="hidden" name="itemOrderdetail" value="구매가능">
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>
</html>