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

 /* autocomplete */

 $(function() {
     //input id autocomplete
     var context = '${pageContext.request.contextPath}';
     $( "#tinfoList").autocomplete({
      source : function(request, response){
       $.ajax({
           type:"post",
           dataType:"json",
           url:context + "/getTravelInfoListData",
           data:{"tinfoList":$("#tinfoList").val()},
           success:function(data){
            response($.map(data, function(item){
            	console.log(data);
             return{
              label:item.tinfoCountry + " " + item.tinfoState + " " + item.tinfoCity,
              value:item.tinfoId,
              tinfoId:item.tinfoId,
              tinfoCountry:item.tinfoCountry,
              tinfoState:item.tinfoState,
              tinfoCity:item.tinfoCity
             }
            }));
           },

           error: function(jqxhr, status, error){
                 alert(jqxhr.statusText + ",  " + status + ",   " + error);
                alert(jqxhr.status);
                alert(jqxhr.responseText); 
           }
          })
      },
      autoFocus:true,
      matchContains:true,
      minLength:1,
      delay:100,
      select:function(event,ui){
    	  $("#tinfoList").val(ui.item.tinfoCity);
          selectedList = ui.item.tinfoCity;
          var flag = false;
          $("#tinfoList").keydown(function(e){
           if(e.keyCode == 13){
            if(!flag){
              fn_regist();
             flag = true;
            }
           }
          });
         },
         focus:function(event, ui){return false;}
        });
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
	                        <a id="insertTravelBoardButton">여행기 등록</a>
	                    </div>                   
				</div>
			</div>

			<!-- 검색 창 -->
			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
                			<div class="form-group single-pricing-table" style="width:670px; text-align:left; padding: 20px; color:black;">
								
								<!-- 검색 내용 -->
								<form class="form-inline">
								<div style="padding-bottom:5px">
									<label class="col-sm-2 control-label"></label>
									<input type="text" name="searchTinfo" class="form-control" id="tinfoList" placeholder="떠나고 싶은 여행지를 검색해주세요.">
								
									<button class="btn btn-warning signupbtn" style="float:right; margin-right:10px">검색</button>
								</div>
								</form>
							</div>

						<form name="frm" class="form-inline">
							<input type="hidden" name="page" />
						</form>
						
<!-- 여행기 리스트 -->
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
								<a href="#" data-placement="right" title="Like">
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
})
</script>
</body>
</html>