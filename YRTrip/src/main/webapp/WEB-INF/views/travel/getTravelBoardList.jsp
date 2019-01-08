<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="resources/css/icheck-bootstrap.css" rel="stylesheet">
<style>
.modal-backdrop {
	z-index: -1;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
</style>
<script>
$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';
});


 jQuery( document ).ready(function( $ ) {
	 	/* 여행등록 modal & 로그인 안했을시 예외처리 */
		if("${sessionScope.login.userId}" == ''){
			$("#insertTravelBoardButton").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
			});
			$(".goToUserPage").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
			});
		} else {
	   $("#insertTravelBoardButton").click(function(){
	    	$('div#insertTravelBoard').modal(true);
		});
	};
});

 /* autocomplete */
 $(document).ready(function(){ 
    //input id autocomplete
    var selectedLocation = document.getElementsByName('searchCheck');
	var searchCheckVal;
	for(var i=0; i<selectedLocation.length; i++) {
  	  if(selectedLocation[i].checked) {
   		 	searchCheckVal = selectedLocation[i].value;
   		 }
	}
     var context = '${pageContext.request.contextPath}';
     $( "#autocompleteTinfoList").autocomplete({
      source : function(request, response){
       $.ajax({
           type:"post",
           dataType:"json",
           url:context + "/getTravelInfoListData",
           data:{"tinfoList":$("#autocompleteTinfoList").val(), "searchCheck":$("[name='searchCheck']:checked").val()},
           success:function(data){
            response($.map(data, function(item){
             return{
              label:item.tinfoCountry + " " + item.tinfoState + " " + item.tinfoCity,
              value:item.tinfoCity,
              tinfoId:item.tinfoId
             }
            }));
           }
          })
      },
      autoFocus:true,
      matchContains:true,
      minLength:0,
      delay:0,
      select:function(event, ui){
     	 $("#tinfoList").val(ui.item.value);
          selectedList = ui.item.tinfoId;
      	 $("#tinfoListDisp").val(selectedList);
          var flag = false;
          $("#autocompleteTinfoList").keydown(function(e){
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
 
 $(function initSelectdList() {
$("#autocompleteTinfoList").change(function(){
	selectedList = "";
   $("#tinfoList").val("");
   $("#tinfoListDisp").val("");
   $('[name=searchTinfoListbox]').val("");
});
 });
/* modal 자동완성 */
 
 $(function() {
     //input id autocomplete
     var context = '${pageContext.request.contextPath}';
     $( "#autocompleteTinfoListModal").autocomplete({
      source : function(request, response){
       $.ajax({
           type:"post",
           dataType:"json",
           url:context + "/getTravelInfoListModalData",
           data:{"tinfoListModal":$("#autocompleteTinfoListModal").val(), "searchCheckModal":$("[name='searchCheckModal']:checked").val()},
           success:function(data){
            response($.map(data, function(item){
             return{
              label:item.tinfoCountry + " " + item.tinfoState + " " + item.tinfoCity,
              value:item.tinfoCity,
              tinfoId:item.tinfoId
             }
            }));
           }
          })
      },
      autoFocus:true,
      matchContains:true,
      minLength:0,
      delay:0,
      select:function(event, ui){
     	 $("#tinfoListModal").val(ui.item.value);
          selectedListModal = ui.item.tinfoId;
      	 $("#tinfoListDispModal").val(selectedListModal);
          var flag = false;
          $("#autocompleteTinfoListModal").keydown(function(e){
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
 $("#autocompleteTinfoListModal").change(function(){
		selectedListModal = "";
	   $("#tinfoListModal").val("");
	   $("#tinfoListDispModal").val("");
	   $('[name=searchTinfoListboxModal]').val("");
	});
 
 /* Modal 여행테마 select */      
 function selectTravelWith(ele){
   	 if(ele.value=='alone'){
   	travelBoardModalfrm.travelPerson.disabled=true;
    } else {
 	travelBoardModalfrm.travelPerson.disabled=false;	   
    }   
 } ;  

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
                            <h2 style="color:black">여행정보</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getTravelBoardList" style="color:black"><strong>전체 여행기</strong></a></li>
                            <li><a href="./getBestTravelList" style="color:black">베스트 여행기</a></li>
                            <li><a href="./getTravelPlaceList" style="color:black">세계의 여행지</a></li>
                        </ul>
	                    <div class="order-buton" style="padding-bottom:30px;">
	                        <a id="insertTravelBoardButton"><strong>새 여행기 등록</strong></a>
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
								<div style="padding-bottom:5px; padding-left:17%;">
									<div class="radio icheck-primary">
										<input type="radio" id="domestic" name="searchCheck" checked="checked" value="domestic">
										<label for="domestic">국내</label>
									</div>
									<div style="margin-right:10px" class="radio icheck-primary">
										&nbsp;<input type="radio" id="overseas" name="searchCheck" value="overseas">
										<label for="overseas">해외</label>
									</div>
								</div>
								<div style="padding-bottom:5px">
									<label class="col-sm-2 control-label"></label>
									<input type="text" class="form-control" id="autocompleteTinfoList" placeholder="떠나고 싶은 여행지를 검색해주세요." autocomplete="on" style="width:350px;" name="searchTinfoListbox">
									<button class="btn btn-warning signupbtn" style="float:right; margin-right:10px">검색</button>
									<input type="hidden" class="form-control" id="tinfoListDisp" name="searchTinfo">
								</div>
								</form>
							</div>

						<form name="frm" class="form-inline">
							<input type="hidden" name="page" />
						</form>
						
<!-- 여행기 리스트 -->
   			<c:forEach items="${travelBoardList}" var="board">
   			<c:if test="${board.travelNo != '0'}">
				<div class="content-box">
							<div style="width:140px; height:80px;">
							<c:if test="${board.travelPic != null}">
							<img src="./images/travel/${board.travelPic}" style="display:inline-block;">
							</c:if>
							<c:if test="${board.travelPic == null}">
							<img src="./images/travel/noimage.jpg" >
							</c:if>
							</div>
						<div class="content-title">
							<div class="text-center">
								<h3><a href="getTravelBoard?travelNo=${board.travelNo}" class="getTravelBoard">
								 <c:choose>
						           <c:when test="${fn:length(board.travelTitle) > 9}">
						           		<c:out value="${fn:substring(board.travelTitle,0,8)}"/>..
									</c:when>
						           <c:otherwise>
						            <c:out value="${board.travelTitle}"/>
						           </c:otherwise> 
						          </c:choose>
								</a></h3>
							</div>
						</div>
						<div class="content-footer">
						<hr style="margin-bottom:-3px;">
							<span class="user-info">
							<c:if test="${sessionScope.login.userId eq board.userId}"><a>${board.userName}</a></c:if>
                            <c:if test="${sessionScope.login.userId ne board.userId}">
								<a href="getYourTravelList?userId=${board.userId}" class="goToUserPage">${board.userName}</a>
							</c:if>
							</span>
						</div>
					</div>
					</c:if>
				</c:forEach>

				<!-- 페이징처리 -->
				<nav aria-label="Page navigation example" style="padding:50px 5% 0 0;">
					<my:paging paging="${paging}" jsFunc="go_page"/>
				</nav>
			</div>	<!-- end of table-responsive -->
				
<!-- modal -->			
<div class="modal fade" id="insertTravelBoard">
	<div class="modal-dialog" style="padding: 20px 0 0 0;">
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
								<form action="./insertTravelBoardform" class="form" name="travelBoardModalfrm" method="post">		
									<h3 class="text-center text-info" style="color:#5f768b;">여행기 작성</h3>										
									<div class="form-group">
										<label for="travelTitle" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelTitle" class="form-control" placeholder="여행기 제목을 입력하세요." required>
									</div>
									<div style="padding-bottom:-15px;">
										<input type="radio" id="modal-domestic" name="searchCheckModal" checked="checked" value="domestic">
										<label for="domestic">국내</label>
										<input type="radio" id="modal-overseas" name="searchCheckModal" value="overseas">
										<label for="overseas">해외</label>
									</div>
									<div style="padding-bottom:5px">
										<label class="col-sm-2 control-label"></label>
										<input type="text" class="form-control" id="autocompleteTinfoListModal" placeholder="떠나고 싶은 여행지를 검색해주세요." autocomplete="on" name="searchTinfoListboxModal" required>
										<input type="hidden" class="form-control" id="tinfoListModal" name="searchTinfoModal" required>
								</div>
									<div class="form-group">
										<label for="travelWith" class="text-info" style="color:#5f768b;"></label><br>
										<select id="travelWith" name="travelWith" class="form-control" onChange="selectTravelWith(this)" required>
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
										<select id="travelPerson" name="travelPerson" class="form-control" required>
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
										<input type="text" name="travelStart" class="form-control datePicker" placeholder="여행 시작일을 선택하세요." required>
									</div>
									<div class="form-group">
										<label for="travelEnd" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelEnd" class="form-control datePicker" placeholder="여행 도착일을 선택하세요." required>
									</div>
									<div class="form-group">
										<label for="travelSche" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="travelSche" class="form-control" placeholder="여행 일정을 입력하세요. 예: 1박2일" required>
									</div>
									<div class="form-group">
										<label class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="여행기 만들기">
									</div>
									<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
									<input type="hidden" name="userId" value="${sessionScope.login.userId}">
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