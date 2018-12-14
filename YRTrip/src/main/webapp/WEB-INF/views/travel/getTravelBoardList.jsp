<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 목록보기</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

<style>
.modal-backdrop {
	z-index: -1;
}
</style>
<script>
/* 유저 tooltip */
jQuery( document ).ready(function( $ ) {
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
jQuery( document ).ready(function( $ ) {
	   $("#insertTravelBoardButton").click(function(){
	    	$('div#insertTravelBoard').modal(true);
		})
});

</script>
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
                            <li><a href="./getTravelInfoList" style="color:black">베스트 여행기</a></li>
                            <li><a href="./getTravelPlaceList" style="color:black">베스트 장소</a></li>
                        </ul>
	                        <div class="order-buton" style="padding-bottom:30px;">
	                            <a id="insertTravelBoardButton">여행기 등록</a>
	                        </div>                   
</div>
</div>

<!-- 여행기 리스트 -->
	<div class="list-box">
	<!-- 검색 창 & 페이징 처리 -->
                		<form name="frm" class="form-inline">
                			<div class="form-group single-pricing-table" style="width:670px; text-align:left; padding: 20px; color:black;">
								
								<!-- 검색 내용 -->
													
								<div style="padding-bottom:5px">
								<label class="col-sm-2 control-label">국가</label>
								<input type="text" name="tinfoCountry" class="form-control"><br>
								<label class="col-sm-2 control-label">주/도</label>
								<input type="text" name="tinfoState" class="form-control"><br>
								<label class="col-sm-2 control-label">도시명</label>
								<input type="text" name="tinfoCity" class="form-control">
																<button class="btn btn-warning signupbtn" style="float:right; margin-right:10px">검색</button>
								</div>
								
								<input type="hidden" name="page" />
								</div>
							
	</form>
						<c:forEach items="${travelBoardList}" var="board">
							<article>
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
								<nav aria-label="Page navigation example" style="padding:50px 5% 0 0;">
									<my:paging paging="${paging}" jsFunc="go_page"/>
								</nav>
					</div>
					
<!-- modal body -->			
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
						<div id="login-row"
							class="row justify-content-center align-items-center">
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

				</div>

			</div>
		</div>
	</div>
</section>
<!-- js -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>

/* 페이징 */	
function go_page(page) {
		document.frm.page.value=page;
		document.frm.submit();	//검색폼 submit
};

/* datepicker */
$(function() {
    $( "#Datepicker" ).datepicker({   
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