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
<title>제품 올리기</title>

<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
<!-- Custom styles for this template -->
<link href="./css/shop-homepage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz">
<script>
  </script>

<style>
/* layout.css Style */
.upload-drop-zone {
	height: 200px;
	border-width: 2px;
	margin-bottom: 20px;
}

/* skin.css Style*/
.upload-drop-zone {
	color: #ccc;
	border-style: dashed;
	border-color: #ccc;
	line-height: 200px;
}

.upload-drop-zone.drop {
	color: #222;
	border-color: #222;
}
</style>
</head>
<body>
	<section class="about_us_area" id="about">
		<!-- Page Content 전체 바디 -->
		<div class="container">
			<div class="row">
				<!-- 시작 : 사이드 :  3-->
				<div class="container col-lg-3">
					<h1 class="my-4">상품</h1>
					<div class="list-group">
						<a href="#" class="list-group-item">전체보기</a> <a href="#"
							class="list-group-item">의류</a> <a href="#"
							class="list-group-item">잡화</a> <a href="#"
							class="list-group-item">티켓/쿠폰</a> <a href="#"
							class="list-group-item">캐리어</a> <a href="#"
							class="list-group-item">전자기기</a> <a href="#"
							class="list-group-item">여행도서</a> <a href="#"
							class="list-group-item">USIM</a> <a href="#"
							class="list-group-item">기타</a> <a href="#"
							class="list-group-item">상품요청</a>
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
									<li class="breadcrumb-item"><a href="#">카테고리를 설정하세요</a></li>
									<li class="breadcrumb-item active" aria-current="page">카테고리선택</li>
								</ol>
								<div class="btn-group">
									<a href="#" class="btn btn-link btn-share">등록 취소</a> <a
										href="#" class="btn btn-link">등록!!(빨간색으로)</a>
								</div>
							</nav>
						</div>
						<div class="card-body store-body">
							<!-- 왼쪽 -->
							<div class="product-info">
								<!-- 왼쪽 갤러리(사진들만) -->
								<div class="product-gallery">
									<div class="center-block">
										<div class="upload-drop-zone" id="drop-zone">Just drag
											and drop files here</div>
									</div>
								</div>
								<!-- 오른쪽 아래 -->
								<div class="product-seller-recommended">
									<!-- /.recommended-items-->
									<div class="product-description mb-5">
										<h2 class="mb-5">상세설명입력</h2>
										<div class="upload-drop-zone" id="drop-zone"></div>

									</div>
								</div>
								<div class="product-payment-details"></div>
							</div>
							<div class="product-payment-details">
								<h2 class="mb-5">제품 기본정보 입력</h2>

								<table>
									<tr>
										<td>상품명</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>가격</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>수량</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>선호결제방법</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>구매가능여부</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td>상품상태</td>
										<td><input type="text"></td>
									</tr>
								</table>
								<buttton type="submit">등록!</buttton>

							</div>
						</div>

					</div>
					<!-- 끝 : 내용 : 9-->
				</div>
				<!-- /.row -->
			</div>
		</div>
	</section>


	<!-- Bootstrap core JavaScript -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>