<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 글 수정</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/vender/css/getTravelBoardList.css">
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean"
	rel="stylesheet">

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
	                            <a href="insertTravelBoardform">여행기 등록</a>
	                        </div>                   
</div>
</div>

		<!-- 여행게시글 수정폼 -->
		<div class="list-box">
			<form action="./updateTravelBoard" method="post">
				<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
				아이디 : <input type="text" name="userId" value="${travelBoard.userId}"><br>
				제목 : <input type="text" name="travelTitle" value="${travelBoard.travelTitle}"><br>
				장소명 : <input type="text" name="tinfoId" value="${travelBoard.tinfoId}"><br>
				여행테마 : <input type="text" name="travelWith" value="${travelBoard.travelWith}"><br>
				메인사진 : <input type="text" name="travelPic" value="${travelBoard.travelPic}"><br>
				일정 : <input type="text" name="travelSche" value="${travelBoard.travelSche}"><br>
				출발일 : <input type="text" name="travelStart" value="${travelBoard.travelStart}"><br>
				경비 : <input type="text" name="travelPay" value="${travelBoard.travelPay}"><br>
				인원수 : <input type="text" name="travelPerson" value="${travelBoard.travelPerson}"><br>
				내용 : <input type="text" name="travelContent" value="${travelBoard.travelContent}"><br>
			
			<button class="submit-btn">등록</button>
			</form>
		</div>

	</section>

</body>
</html>