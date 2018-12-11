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
					<h2 style="color: black">카테고리</h2>
				</div>
				<ul class=price-list>
					<li><a href="#" style="color: black">전체 여행기</a></li>
					<li><a href="#" style="color: black">베스트 여행기</a></li>
					<li><a href="#" style="color: black">베스트 장소</a></li>
				</ul>

			</div>
			<div>
				<form name="search_frm">
					<div class="form-group">
						<br> <select name="searchCondition"
							class="form-control select-form">
							<option selected>선택</option>
							<option value="userId">작성자</option>
							<option value="tinfoId">지역명</option>
							<option value="travelTitle">제목</option>
							<option value="travelContent">내용</option>
						</select> <label class="sr-only" for="searchForm">여행게시판 내 검색</label> <input
							type="text" class="form-control" name="searchKeyword"
							placeholder="검색할 내용을 입력하세요">

					</div>
					<div>
						<button type="submit" class="btn btn-warning submit-buton">검색</button>
					</div>
					<input type="hidden" name="sortCol" /><br>
					<br>
					<div>
						<button class="submit-btn" type="button"
							onclick="location.href='${pageContext.request.contextPath}/insertTravelBoardform'">등록</button>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 여행게시글 등록폼 -->
		<div class="list-box">
			<form action="./insertTravelBoard" method="post">
				아이디 : <input type="text" name="userId"><br> 
				제목 : <input type="text" name="travelTitle"><br> 
				장소명 : <input type="text" name="tinfoId"><br> 
				여행테마 : <input type="text" name="travelWith"><br> 
				메인사진 : <input type="text" name="travelPic"><br> 
				일정 : <input type="text" name="travelSche"><br> 
				출발일 : <input type="text" name="travelStart"><br> 
				경비 : <input type="text" name="travelPay"><br> 
				인원수 : <input type="text" name="travelPerson"><br> 
				내용 : <input type="text" name="travelContent"><br>
				
				<button class="submit-btn">등록</button>
			</form>
		</div>
	</section>
</body>
</html>