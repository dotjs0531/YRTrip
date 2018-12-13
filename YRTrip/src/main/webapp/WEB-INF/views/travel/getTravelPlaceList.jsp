<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소게시판 목록보기</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/vender/css/Travel.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

<style>
.modal-backdrop {
	z-index: -1;
}
</style>
</head>
<body>
<section class="content-section">
<!-- 검색창 -->
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

<!-- 리스트 -->
	<div class="list-box">
	<form name="frm">
	<select name="searchCondition">
		<option value="userId">작성자</option>
		<option value="placeName">장소</option>
	</select>
	<input type="text" name="searchKeyword">
	<button type="submit">검색</button>
	<input type="hidden" name="sortCol"/>
	<input type="hidden" name="page">
	</form>
						<c:forEach items="${travelPlaceList}" var="board">
							<article>
									<img src="resources/media/getTBL.PNG" class="img-responsive">
									<div class="content-title">
										<div class="text-center">
											<h3>
												<a href="getTravelPlace?placeNo=${board.placeNo}">${board.placeName}</a>
											</h3>
										</div>
									</div>
									<div class="content-footer">
										<span style="font-size: 16px; color: #fff;">${board.userId}</span>
										<span class="pull-right"><a href="#"
											data-toggle="tooltip" data-placement="right"
											title="Like"><i class="fa fa-heart"></i> ${board.placeLike}</a>
										</span>
										<div class="user-ditels">
											<div class="user-img">
												<img
													src="resources/media/users.png"
													class="img-responsive">
											</div>
											<span class="user-full-ditels">
												<h3>${board.userId}</h3>
											</span>
											<div class="social-icon">
												<a href="#"><i class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="유저정보"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-usd" data-toggle="tooltip" data-placement="bottom" title="판매상품"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-edit" data-toggle="tooltip" data-placement="bottom" title="리뷰"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-globe" data-toggle="tooltip" data-placement="bottom" title="여행글"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-transfer" data-toggle="tooltip" data-placement="bottom" title="동행글"></i></a>
											</div>

										</div>
									</div>
											</article>
								</c:forEach>
						<my:paging paging="${paging}" jsFunc="go_page"/>
					</div>
</section>
<!-- js -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});

		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].onclick = function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			}
		};
		
		/* 페이징 */	
		function go_page(page) {
				document.frm.page.value=page;
				document.frm.submit();	//검색폼 submit
		}
	</script>
</body>
</html>