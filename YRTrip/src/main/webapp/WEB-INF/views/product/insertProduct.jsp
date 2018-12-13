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

<!-- font Awesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.0/css/all.css"
	integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h"
	crossorigin="anonymous">

<!-- CSS (부트 + custom)-->
<!-- 4.0 버전인데 못쓰것다 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
        crossorigin="anonymous"> -->
<link href="./resources/css/product.bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
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
</style>
</head>

<body>
	<section class="about_us_area" id="about">
	<form action="./insertProduct" method="post">
		<input type="text" name="itemName" placeholder="제품명" value="테스트명111">
		<input type="text" name="itemPrice" placeholder="가격" value="12000">
		<input type="text" name="itemEa" placeholder="개수" value="1">
		<input type="text" name="itemContent" placeholder="내용" value="테스트1111111">
		<input type="text" name="itemMethod" placeholder="거래방법" value="현금거래">
		<input type="text" name="itemCategory" placeholder="카테고리" value="카테고리1">
		<input type="text" name="sellerId" placeholder="판매자명" value="user1">
		<input type="text" name="itemOrderdetail" placeholder="구매가능가능" value="구매가능">
		<!-- <input type="text" name="itemStar" placeholder="라이크"> -->
		<input type="text" name="itemCondition" placeholder="라이크" value="새상품">
		<input type="submit" class="btn" value="등록">
	</form>
											
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