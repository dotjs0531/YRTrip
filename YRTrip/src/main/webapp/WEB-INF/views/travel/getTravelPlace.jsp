<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>장소게시판 글 상세보기</title>

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
<!-- 장소게시글 상세 -->
	<div class="list-box">

		<table border="1">
			<tr>
				<th>글번호</th>
				<th>장소명</th>
				<th>주소</th>
				<th>작성날짜</th>
				<th>좋아요</th>
				<th>내용</th>
				<th>사진</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td>${travelPlace.placeNo}</td>
				<td>${travelPlace.placeName}</td>
				<td>${travelPlace.placeAddress}</td>
				<td>${travelPlace.placeDate}</td>
				<td>${travelPlace.placeLike}</td>
				<td>${travelPlace.placeContent}</td>
				<td>${travelPlace.placePic}</td>
				<td>${travelPlace.userId}</td>
			</tr>
		</table>
		<button class="submit-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/updateTravelPlaceform?placeNo=${travelPlace.placeNo}'">수정</button>
		<button class="submit-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/deleteTravelPlace?placeNo=${travelPlace.placeNo}'">삭제</button>
		</div>
		
	</section>
</body>
</html>
