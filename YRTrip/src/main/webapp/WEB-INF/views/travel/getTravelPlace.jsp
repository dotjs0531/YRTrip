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
<link rel="stylesheet" href="resources/vender/css/Travel.css">

<style>
.modal-backdrop {
	z-index: -1;
}
</style>
</head>
<body>

<section class="about_us_area" id="about">
	<div class="container">
		<div class="row">

			<!-- 왼쪽 사이드바 -->
			<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
				<div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">카테고리</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getTravelBoardList" style="color:black">전체 여행기</a></li>
                            <li><a href="#" style="color:black">베스트 여행기</a></li>
                            <li><a href="./getTravelPlaceList" style="color:black">베스트 장소</a></li>
                        </ul>
	                    <div class="order-buton" style="padding-bottom:30px;">
	                        <a href="./insertTravelPlaceform">나만의 장소 등록</a>
	                    </div>                   
				</div>
			</div>

			<!-- 검색 창 -->
			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
						
<!-- 장소글 -->
${travelPlace.placeName}
${travelPlace.placeAddress}
${travelPlace.placeTitle}
${travelPlace.placeContent}
${travelPlace.placePic}
${travelPlace.placeVisitDate}
									<div class="form-group">
										<label for="remember-me" class="text-info"></label>
		<button class="submit-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/updateTravelPlaceform?placeNo=${travelPlace.placeNo}'">수정</button>
		<button class="submit-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/deleteTravelPlace?placeNo=${travelPlace.placeNo}'">삭제</button>
									</div>

			</div>	<!-- end of table-responsive -->
				</div></div></div></div></section>
</body>
</html>
