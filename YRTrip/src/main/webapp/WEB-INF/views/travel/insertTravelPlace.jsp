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
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
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
						
<!-- 등록폼 -->
<form class="form" action="./insertTravelPlace" method="post">		
									<h3 class="text-center text-info" style="color:#5f768b;">나만의 장소 등록하기</h3>										
									<div class="form-group">
										<label for="placeName" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeName" class="form-control" placeholder="장소명">
									</div>
									<div class="form-group">
										<label for="placeAddress" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeAddress" class="form-control" placeholder="주소">
									</div>
									<div class="form-group">
										<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeTitle" class="form-control" placeholder="제목">
									</div>
									<div class="form-group">
										<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeContent" class="form-control" placeholder="내용">
									</div>
									<div class="form-group">
										<label for="placePic" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placePic" class="form-control" placeholder="사진">
									</div>
									<div class="form-group">
										<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeVisitDate" class="form-control datePicker" placeholder="날짜">
									</div>
									<div class="form-group">
										<label for="remember-me" class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="submit">
									</div>
									<input type="hidden" name="placeTravelBoardNo" value="0">
									<input type="hidden" name="userId" value="${sessionScope.login.userId}">
									
			</form>

			</div>	<!-- end of table-responsive -->
				</div></div></div></div></section>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
/* datepicker */
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
</body>
</html>