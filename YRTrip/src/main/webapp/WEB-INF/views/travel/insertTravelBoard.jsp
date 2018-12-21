<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 글 등록</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<script>
$(function() {
    $( ".datePicker" ).datepicker({   
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yymmdd",
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        maxDate: "+0D",
        showMonthAfterYear : true,
        yearRange: "-100:+0"
    });
    }); 
</script>
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
							<h2 style="color: black">카테고리</h2>
						</div>
						<ul class=price-list>
							<li><a href="./getTravelBoardList" style="color: black">전체 여행기</a></li>
							<li><a href="#" style="color: black">베스트 여행기</a></li>
							<li><a href="./getTravelPlaceList" style="color: black">베스트 장소</a></li>
						</ul>
						<div class="order-buton" style="padding-bottom: 30px;">
							<a id="insertTravelBoardButton">여행기 등록</a>
						</div>
					</div>
				</div>

				<!-- 여행기 등록 폼 -->
				<div>
					<div class="col-sm-6" style="min-width: 700px">
						<div class="table-responsive" style="min-height: 450px;">
							<!-- 타임라인 -->
							<div class="timeline">
								<div class="line text-muted"></div>
								<c:forEach items="${travelPlaceList}" var="place">
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
								</c:forEach>

								<div class="separator text-muted"></div>
								<!-- 장소 추가 -->
								<article class="panel panel-success">

									<div class="panel-heading icon">
										<i class="glyphicon glyphicon-plus"></i>
									</div>

									<div class="panel-heading">
										<h2 class="panel-title">내가 방문한 장소를 등록하세요.</h2>
									</div>
									<form action="./insertTravelPlace">
										<div class="panel-body">세계지도 지역 클릭 -> 구글API modal(장소명
											placeName, 주소 placeAddress 입력됨)</div>

										<ul class="list-group">
											<li class="list-group-item">
												<div class="form-group">
													<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeTitle" class="form-control" placeholder="장소에 대한 제목을 입력하세요.">
												</div>
											</li>
											<li class="list-group-item">
												<div class="form-group">
													<label for="placePic" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placePic" class="form-control" placeholder="사진을 업로드해주세요.">
												</div>
											</li>
											<li class="list-group-item">
												<div class="form-group">
													<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeContent" class="form-control" placeholder="방문했던 장소에 대한 후기를 입력해주세요.">
												</div>
											</li>
											<li class="list-group-item">
												<div class="form-group">
													<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeVisitDate" class="form-control datePicker" placeholder="장소에 방문한 날짜를 선택해주세요.">
												</div>
											</li>
											<li class="list-group-item" style="padding-left: 450px;">
												<button class="btn btn-sm btn-default">
													<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 장소 추가하기</i>
												</button>
											</li>
										</ul>

									</form>
								</article>

							</div>

							<!-- 여행기 업데이트 -->
							<div class="panel">
								<div class="panel-body">
								<form action="./updateTravelBoardTwoform" method="get">
									<textarea class="form-control" rows="2"
										placeholder="여행에 대한 간단한 소개글을 작성해주세요:-)" name="travelContent"></textarea>
									<br>
									<textarea class="form-control" rows="1" placeholder="여행 총 경비를 입력해주세요." name="travelPay"></textarea>
									<div class="mar-top clearfix">
										<button class="btn btn-sm btn-warning pull-right" type="submit">
											<i class="fa fa-pencil fa-fw"></i>여행기 등록
										</button>
										<button class="btn btn-sm btn-warning">
											<i class="fa fa-camera"> 메인사진 업로드</i>
										</button>
									</div>
									</form>
								</div>
							</div>

						</div>
						<!-- end of table-responsive -->


					</div>
				</div>
				<!-- end of list -->

			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</section>
</body>
</html>