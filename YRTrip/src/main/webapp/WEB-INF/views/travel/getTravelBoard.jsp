<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>여행게시판 글 상세보기</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/vender/css/Travel.css">

<style>
.modal-backdrop {
	z-index: -1;
}

.timeline .separator {
	border-top: 1px solid currentColor;
	padding: 5px;
	padding-left: 40px;
	font-style: italic;
	font-size: .9em;
	margin-left: 30px;
}

.timeline .line::before {
	top: -4px;
}

.timeline .line::after {
	bottom: -4px;
}

.timeline .line::before, .timeline .line::after {
	content: '';
	position: absolute;
	left: -4px;
	width: 12px;
	height: 12px;
	display: block;
	border-radius: 50%;
	background: currentColor;
}

.timeline .panel .panel-heading.icon * {
	font-size: 20px;
	vertical-align: middle;
	line-height: 40px;
}

.timeline .panel .panel-heading.icon {
	position: absolute;
	left: -59px;
	display: block;
	width: 40px;
	height: 40px;
	padding: 0px;
	border-radius: 50%;
	text-align: center;
	float: left;
}

.timeline .line {
	position: absolute;
	width: 4px;
	display: block;
	background: currentColor;
	top: 0px;
	bottom: 0px;
	margin-left: 30px;
}

.timeline .panel {
	position: relative;
	margin: 10px 0px 21px 70px;
	clear: both;
}

.timeline {
	position: relative;
	padding: 21px 0px 10px;
	margin-top: 4px;
	margin-bottom: 30px;
}

.timeline .panel::before {
	position: absolute;
	display: block;
	top: 8px;
	left: -24px;
	content: '';
	width: 0px;
	height: 0px;
	border: inherit;
	border-width: 12px;
	border-top-color: transparent;
	border-bottom-color: transparent;
	border-left-color: transparent;
}

.timeline .panel-outline {
	border-color: transparent;
	background: transparent;
	box-shadow: none;
}

.timeline .panel-outline .panel-body {
	padding: 10px 0px;
}

.timeline .panel-outline .panel-heading:not (.icon ), .timeline .panel-outline .panel-footer
	{
	display: none;
}

.mar-top {
	margin-top: 15px;
}
.dad {
    height: 300px;
    width: 100%;
    overflow: hidden;
    position: relative;
    padding: 0;
}

.dad > .son-1 {
    position: absolute;
    height: 100%;
    width: 100%;
    -moz-transition: all 5s;
    -webkit-transition: all 5s;
    transition: all 5s;
    -moz-transform: scale(1,1);
    -webkit-transform: scale(1,1);
    transform: scale(1,1);
    background-image: url("https://bufiles.blob.core.windows.net/co3634/zooming_effect/zooming_bg_1.jpg");
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
    z-index: -1;
}

.dad:hover > .son-1 {
    -moz-transform: scale(2,2);
    -webkit-transform: scale(2,2);
    transform: scale(2,2);    
}

.son-text {
    color: #fcfcfc;
	font-size: 2em;
	font-family: 'Josefin Slab', serif;
	text-align: center;
	width: 100%;
	height: 300px;
    -moz-transition: all 1s;
    -webkit-transition: all 1s;
    transition: all 1s;
	padding-top: 5vh;
}

.son-text:hover {
	background-color: #22313F;
	opacity: 0.7;
}

.son-span {
	background: #fcfcfc;
	color: #22313F;
	padding: 15px 45px;
	font-family: 'Josefin Slab', serif;
	font-style: italic;
	opacity: 0.6;
	border-radius: 30px;
}
.text-span {
	background: #fcfcfc;
	padding:5px;
	color: #22313F;
	font-family: 'Josefin Slab', serif;
	opacity: 0.6;
	display:inline;
	font-size: 0.5em;
}
.top-span {
	padding:5px;
	color: #ffffff;
	font-family: 'Josefin Slab', serif;
	display:inline;
	font-size: 0.6em;
}
</style>
<script>
/* 여행등록 modal */
jQuery( document ).ready(function( $ ) {
	   $("#insertTravelBoardButton").click(function(){
	    	$('div#insertTravelBoard').modal(true);
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
	                        <a id="insertTravelBoardButton">새 여행기 등록</a>
	                    </div>                   
				</div>
			</div>

			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
<!-- 여행기 정보 -->				
<div class="container dad">
  <div class="son-1">
  </div>
  <span class="top-span">NO : T${travelBoard.travelNo}</span>
<span class="top-span">작성일자 : ${fn:substring(travelBoard.travelDate, 0, 10)}</span>
<span class="top-span">조회수 : ${travelBoard.travelHit}</span><br>
<span class="top-span" style="fontsize:10px!important;">작성자 : ${travelBoard.userId}</span>
    <p class="son-text">
    <span class="son-span">${travelBoard.travelTitle}</span>
    <br/><br/>

<span class="text-span">여행지 : ${travelBoard.tinfoId}</span>
<span class="text-span">여행테마 : 
<c:if test="${travelBoard.travelWith == 'alone'}">
나홀로 여행
</c:if>
<c:if test="${travelBoard.travelWith == 'friend'}">
친구와 함께
</c:if>
<c:if test="${travelBoard.travelWith == 'family'}">
가족과 함께
</c:if>
<c:if test="${travelBoard.travelWith == 'couple'}">
연인과 함께
</c:if>
<c:if test="${travelBoard.travelWith == 'group'}">
단체여행
</c:if>
<c:if test="${travelBoard.travelWith == 'package'}">
패키지여행
</c:if>
</span>
<span class="text-span">여행인원 : ${travelBoard.travelPerson+1}명</span><br>
<span class="text-span">여행일정 : ${travelBoard.travelSche}</span>
<span class="text-span">여행기간 : ${fn:substring(travelBoard.travelStart, 0, 10)} ~ ${fn:substring(travelBoard.travelEnd, 0, 10)}</span><br>
<span class="text-span"><i class="fa fa-heart"></i> ${travelBoard.travelLike}</span>
</p>
</div>
<!-- 장소 리스트 -->
<div>
<div class="timeline">
								<div class="line text-muted"></div>
								<c:forEach items="${travelPlaceList}" var="place">
								<c:if test="${travelBoard.travelBoardNo == place.placeTravelBoardNo}">
									<article class="panel panel-warning">

										<div class="panel-heading icon">
											<i class="glyphicon glyphicon glyphicon-map-marker"></i>
										</div>

										<div class="panel-heading">
											<h2 class="panel-title">${place.travelPlaceTitle}</h2>
										</div>

										<div class="panel-body">
											<img class="img-responsive img-rounded"
												src="//placehold.it/350x150" />
										</div>

										<div class="panel-footer">
											<i class="glyphicon glyphicon-heart" style="color: #ff8000;"></i>
											<small>${place.travelPlaceLike}</small>
										</div>
									</article>
									</c:if>
								</c:forEach>
								</div>

		<button class="submit-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/updateTravelBoardform?travelNo=${travelBoard.travelNo}'">수정</button>
		<button class="submit-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/deleteTravelBoard?travelNo=${travelBoard.travelNo}'">삭제</button>
		</div>
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
								<form action="./insertTravelBoardform" class="form" name="travelBoardModalfrm" method="get">		
									<h3 class="text-center text-info" style="color:#5f768b;">여행기 작성</h3>										
										<input type="hidden" name="userId" class="form-control" value="${sessionScope.login.userId}">
									<div class="form-group">
										<label for="travelTitle" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelTitle" class="form-control" placeholder="여행기 제목을 입력하세요.">
									</div>
									<div style="padding-bottom:-15px;">
										<input type="radio" id="modal-domestic" name="searchCheckModal" checked="checked" value="domestic">
										<label for="domestic">국내</label>
										<input type="radio" id="modal-overseas" name="searchCheckModal" value="overseas">
										<label for="overseas">해외</label>
									</div>
									<div style="padding-bottom:5px">
										<label class="col-sm-2 control-label"></label>
										<input type="text" class="form-control" id="autocompleteTinfoListModal" placeholder="떠나고 싶은 여행지를 검색해주세요." autocomplete="on" name="searchTinfoListboxModal">
										<input type="hidden" class="form-control" id="tinfoListModal" name="searchTinfoModal">
								</div>
									<div class="form-group">
										<label for="travelWith" class="text-info" style="color:#5f768b;"></label><br>
										<select id="travelWith" name="travelWith" class="form-control" onChange="selectTravelWith(this)">
										  <option value="" selected>여행테마를 선택하세요.</option>
										  <option value="alone">나홀로 여행</option>
										  <option value="friend">친구와 함께</option>
										  <option value="family">가족과 함께</option>
										  <option value="couple">연인과 함께</option>
										  <option value="group">단체여행</option>
										  <option value="package">패키지여행</option>
										</select>
									</div>
									<div class="form-group">
										<label for="travelPerson" class="text-info" style="color:#5f768b;"></label><br>
										<select id="travelPerson" name="travelPerson" class="form-control">
										  <option value="0" selected>${sessionScope.login.userName}님과 함께 여행한 인원을 선택하세요.</option>
										  <option value="1">1명</option>
										  <option value="2">2명</option>
										  <option value="3">3명</option>
										  <option value="4">4명</option>
										  <option value="5">5명</option>
										  <option value="6">6명 이상</option>
										</select>
									</div>
									<div class="form-group">
										<label for="travelStart" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelStart" class="form-control datePicker" placeholder="여행 시작일을 선택하세요.">
									</div>
									<div class="form-group">
										<label for="travelEnd" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelEnd" class="form-control datePicker" placeholder="여행 도착일을 선택하세요.">
									</div>
									<div class="form-group">
										<label for="travelSche" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelSche" class="form-control" placeholder="여행 일정을 입력하세요. 예: 1박2일">
									</div>
									<div class="form-group">
										<label class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="submit">
									</div>
									<input type="hidden" id="tinfoListDispModal" name="selectedTinfoModal">
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

</body>
</html>
