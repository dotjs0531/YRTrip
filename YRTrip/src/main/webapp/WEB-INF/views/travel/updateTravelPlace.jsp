<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 글 등록</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">

<style>
.modal-backdrop {
	z-index: -1;
}
</style>
</head>
<body>
	<section class="content-section">

		<!-- 왼쪽 사이드바 -->
<div class="category">
 <div class="search-box">
                        <div class="pricing-title">
                            <h2 style="color:black">카테고리</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getTravelBoardList" style="color:black">전체 여행기</a></li>
                            <li><a href="#" style="color:black">베스트 여행기</a></li>
                            <li><a href="./getTravelPlaceList" style="color:black">베스트 장소</a></li>
                        </ul>
	                        <div class="order-buton" style="padding-bottom:30px;">
	                            <a href="insertTravelPlaceform">장소 등록</a>
	                        </div>                   
</div>
</div>
		
		<!-- 여행게시글 수정폼 -->
		<div class="list-box">
			<form action="./updateTravelPlace" method="post">
			<input type="hidden" name="placeNo" value="${travelPlace.placeNo}">
				장소명 : <input type="text" name="placeName" value="${travelPlace.placeName}"><br> 
				주소 : <input type="text" name="placeAddress" value="${travelPlace.placeAddress}"><br> 
				내용 : <input type="text" name="placeContent" value="${travelPlace.placeContent}"><br> 
				여행게시판번호 : <input type="text" name="placeTravelBoardNo" value="${travelPlace.placeTravelBoardNo}"><br> 
				사진 : <input type="text" name="placePic" value="${travelPlace.placePic}"><br> 
				아이디 : <input type="text" name="userId" value="${travelPlace.userId}"><br> 
				
				<button class="submit-btn">등록</button>
			</form>
		</div>
	</section>
</body>
</html>