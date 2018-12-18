<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 글 등록</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">

<style>
.modal-backdrop {
	z-index: -1;
}
</style>
<script>
/* 장소등록 modal */
jQuery( document ).ready(function( $ ) {
	   $("#insertTravelPlaceButton").click(function(){
	    	$('div#insertTravelPlace').modal(true);
		})
});
</script>
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
	                        <a id="insertTravelPlaceButton">나만의 장소 등록</a>
	                    </div>                   
				</div>
			</div>

			<!-- 장소 리스트 -->
			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
						
   			<c:forEach items="${travelBoardList}" var="board">
				<div class="content-box">
					<img src="resources/media/getTBL.PNG" class="img-responsive">
						<div class="content-title">
							<div class="text-center">
								<h3><a href="getTravelBoard?travelNo=${board.travelNo}">${board.travelTitle}</a></h3>
							</div>
						</div>
						<div class="content-footer">
							<span class="user-info">${board.userId}</span>
							<span class="pull-right">
								<a href="#" data-toggle="tooltip" data-placement="right" title="Like">
								<i class="fa fa-heart"></i> ${board.travelLike}</a>
							</span>
							<div class="user-ditels">
								<div class="user-img">
									<img src="resources/media/users.png" class="img-responsive">
								</div>
								<div class="social-icon">
									<a href="#"><i class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="유저정보"></i></a> 
									<a href="#"><i class="glyphicon glyphicon-usd" data-toggle="tooltip" data-placement="bottom" title="판매상품"></i></a><br> 
									<a href="#"><i class="glyphicon glyphicon-edit" data-toggle="tooltip" data-placement="bottom" title="리뷰"></i></a> 
									<a href="#"><i class="glyphicon glyphicon-globe" data-toggle="tooltip" data-placement="bottom" title="여행글"></i></a> 
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

				<!-- 페이징처리 -->
				<nav aria-label="Page navigation example" style="padding:50px 5% 0 0;">
					<my:paging paging="${paging}" jsFunc="go_page"/>
				</nav>
			</div>	<!-- end of table-responsive -->
				
<!-- modal -->			
<div class="modal fade" id="insertTravelBoard">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- body -->
			<div class="modal-body">
				<div class="container">
					<div id="login-row" class="row justify-content-center align-items-center">
						<div id="login-column" class="col-md-6">
							<div id="login-box" class="col-md-12">
								<form id="/insertTravelBoardform" class="form" action="./insertTravelBoard" method="post">		
									<h3 class="text-center text-info" style="color:#5f768b;">여행기 작성</h3>										
										<input type="hidden" name="userId" class="form-control" value="${sessionScope.login.userId}">
									<div class="form-group">
										<label for="travelTitle" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelTitle" class="form-control" placeholder="여행기 제목을 입력하세요.">
									</div>
									<div class="form-group">
										<label for="tinfoId" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="tinfoId" class="form-control" placeholder="여행지를 선택하세요. ---> 다중셀렉트바 수정할 것!">
									</div>
									<div class="form-group">
										<label for="travelWith" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelWith" class="form-control" placeholder="여행테마를 선택하세요. ---> 셀렉트바 수정할 것!">
									</div>
									<div class="form-group">
										<label for="travelSche" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelSche" class="form-control" placeholder="여행 일정을 선택하세요. ---> 셀렉트바 수정할 것!">
									</div>
									<div class="form-group">
										<label for="travelStart" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelStart" class="form-control" id="Datepicker" placeholder="여행 시작일을 선택하세요.">
									</div>
									<div class="form-group">
										<label for="travelPerson" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelPerson" class="form-control" placeholder="함께 여행한 인원을 선택하세요. --->셀렉트바 수정할 것!">
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
		</div>	<!-- end of modal-body -->
		</div> <!-- end of modal-content -->
	</div> 
</div> <!-- end of modal -->

				</div>
			</div> <!-- end of list -->
			
		</div> <!-- end of row -->
	</div>	<!-- end of container -->
</section>



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