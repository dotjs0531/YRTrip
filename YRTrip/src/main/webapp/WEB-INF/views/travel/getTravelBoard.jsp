<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>여행게시판 글 상세보기</title>

<!-- *********************** -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/vender/css/getTravelBoardList.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

<style>
.modal-backdrop {
	z-index: -1;
}
</style>
<!-- *********************** -->

</head>
<body>
<section class="content-section">

<!-- *********************** -->
<!-- 검색창 -->
<div class="category">
 <div class="search-box">
                        <div class="pricing-title">
                            <h2 style="color:black">카테고리</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="#" style="color:black">전체 여행기</a></li>
                            <li><a href="#" style="color:black">베스트 여행기</a></li>
                            <li><a href="#" style="color:black">베스트 장소</a></li>
                        </ul>
                        
                    </div>
                        <div>
                        	<form name="search_frm">
						<div class="form-group">
							<br>
							<select name="searchCondition" class="form-control select-form">
								<option selected>선택</option>
								<option value="userId">작성자</option>
								<option value="tinfoId">지역명</option>
								<option value="travelTitle">제목</option>
								<option value="travelContent">내용</option>
							</select>
							<label class="sr-only" for="searchForm">여행게시판 내 검색</label>
							<input type="text" class="form-control" name="searchKeyword" placeholder="검색할 내용을 입력하세요">

						</div>
								<div>
								<button type="submit" class="btn btn-warning submit-buton">검색</button>
								</div>
								<input type="hidden" name="sortCol"/>
							</form>
                        </div>
</div>
	<div class="list-box">
<!-- *********************** -->

	제목사진ㅇㅇㅇㅇ
		<table border="1">
			<tr>
				<th>사진</th>
				<th>제목</th>
				<th>장소</th>
				<th>테마</th>
				<th>인원</th>
				<th>일정</th>
				<th>출발일</th>
				<th>아이디</th>
				<th>글번호</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
			<tr>
				<td>${travelBoard.travelPic}</td>
				<td>${travelBoard.travelTitle}</td>
				<td>${travelBoard.tinfoId}</td>
				<td>${travelBoard.travelWith}</td>
				<td>${travelBoard.travelPerson}</td>
				<td>${travelBoard.travelSche}</td>
				<td>${travelBoard.travelStart}</td>
				<td>${travelBoard.userId}</td>
				<td>${travelBoard.travelNo}</td>
				<td>${travelBoard.travelDate}</td>
				<td>${travelBoard.travelHit}</td>
				<td>${travelBoard.travelLike}</td>
				<!-- TravelBoardController의 getTravelBoard 메서드에서 travelBoard로 값 넘겨줌 -->
			</tr>
		</table>
		
		</div>
		
	</section>
</body>
</html>
