<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 목록보기</title>
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
	                            <a id="insertTravelBoardButton">여행기 등록</a>
	                        </div>                   
</div>
</div>

<!-- 여행기 리스트 -->
	<div class="list-box">
	<form name="frm">
	<select name="searchCondition">
		<option value="userId">작성자</option>
		<option value="tinfoId">장소</option>
		<option value="travelTitle">제목</option>
		<option value="travelContent">내용</option>
	</select>
	<input type="text" name="searchKeyword">
	<button type="submit">검색</button>
	<input type="hidden" name="sortCol"/>
	<input type="hidden" name="page">
	</form>
						<c:forEach items="${travelBoardList}" var="board">
							<article data-travelNo="${board.travelNo}">
									<img src="resources/media/getTBL.PNG" class="img-responsive">
									<div class="content-title">
										<div class="text-center">
											<h3>
												<a href="getTravelBoard?travelNo=${board.travelNo}">${board.travelTitle}</a>
											</h3>
										</div>
									</div>
									<div class="content-footer">
										<span style="font-size: 16px; color: #fff;">${board.userId}</span>
										<span class="pull-right"><a href="#"
											data-toggle="tooltip" data-placement="right"
											title="Like"><i class="fa fa-heart"></i> ${board.travelLike}</a>
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
					</div>
					<my:paging paging="${paging}" jsFunc="go_page"/>
<!-- modal body -->					
					<div class="modal fade" id="insertTravelBoard">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote ajax call이 되는영역 -->
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- body -->
				<div class="modal-body">
					<div class="container">
						<div id="login-row"
							class="row justify-content-center align-items-center">
							<div id="login-column" class="col-md-6">
								<div id="login-box" class="col-md-12">
									<form id="/insertTravelBoardform" class="form" action="./insertTravelBoard" method="post">
										<h3 class="text-center text-info" style="color:#5f768b;">여행기 작성</h3>
										<div class="form-group">
											<label for="userId" class="text-info" style="color:#5f768b;">아이디:</label><br>
											<input type="text" name="userId" class="form-control">
										</div>
										<div class="form-group">
											<label for="travelTitle" class="text-info" style="color:#5f768b;">제목:</label><br>
											<input type="text" name="travelTitle" class="form-control">
										</div>
										<div class="form-group">
											<label for="tinfoId" class="text-info" style="color:#5f768b;">여행지:</label><br>
											<input type="text" name="tinfoId" class="form-control">
										</div>
										<div class="form-group">
											<label for="travelWith" class="text-info" style="color:#5f768b;">여행테마:</label><br>
											<input type="text" name="travelWith" class="form-control">
										</div>
										<div class="form-group">
											<label for="travelSche" class="text-info" style="color:#5f768b;">일정:</label><br>
											<input type="text" name="travelSche" class="form-control">
										</div>
										<div class="form-group">
											<label for="travelStart" class="text-info" style="color:#5f768b;">출발일:</label><br>
											<input type="text" name="travelStart" class="form-control">
										</div>
										<div class="form-group">
											<label for="travelPerson" class="text-info" style="color:#5f768b;">인원:</label><br>
											<input type="text" name="travelPerson" class="form-control">
										</div>
										<div class="form-group">
											<label for="remember-me" class="text-info"></label>
											<input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="submit">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- js -->

<script>
<!-- 유저 tooltip -->
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

/* 여행등록 modal */
$(function(){
	   $("#insertTravelBoardButton").click(function(){
	    	$('div#insertTravelBoard').modal(true);
		})
});

/* 페이징 */	
function go_page(page) {
		document.frm.page.value=page;
		document.frm.submit();	//검색폼 submit
}
	</script>
</body>
</html>