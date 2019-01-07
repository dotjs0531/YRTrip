<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>여행게시판 글 상세보기</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<style>
.modal-backdrop {
	z-index: -1;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
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
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
    z-index: -1;
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

.son-span {
	background: #22313F;
	color: #fcfcfc;
	padding: 15px 45px;
	font-family: 'Josefin Slab', serif;
	font-style: italic;
	opacity: 0.6;
	border-radius: 30px;
}
.text-span {
	background: #22313F;
	padding:5px;
	color: #fcfcfc;
	font-family: 'Josefin Slab', serif;
	opacity: 0.6;
	display:inline;
	font-size: 0.5em;
}
.top-span {
	padding:5px;
	color: #22313F;
	font-family: 'Josefin Slab', serif;
	display:inline;
	font-size: 0.6em;
}
.update-input{
width:50px; 
background-color:#22313F;
}
.file-input {
    display: block;
    visibility: hidden;
    width: 0;
    height: 0;
}
</style>
<script>
$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';
});
	function disLike(uId, lC, lBid){
		   location.href = "./deleteLike?userId=" + uId + "&likeCategory=" + lC + "&likeBoardid=" + lBid;
	};
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
		   $("#mapBtn").click(function(){
		    	$('div#mapModal').modal(true);
			});
		};
	});
/* 글 삭제 */
function del(travelNo){
 if(confirm("삭제하시겠습니까?")){
    location.href = "./deleteTravelBoard?travelNo=" + travelNo;
 } else { return; }
};
	$(function(){
		loadTravelPlaceList();
		
		//장소리스트 조회 요청	
		function loadTravelPlaceList(){
			var params = { travelNo : '${travelBoard.travelNo}' };
			$.getJSON("selectTravelPlaceList", params, function(datas){
				for(i=0; i<datas.length; i++){
					var div = makeTravelPlaceView(datas[i]);
					$(div).appendTo("#travelPlaceList");
				}
			});
		}; 	// end of loadTravelPlaceList
		
		//장소리스트 조회 뷰(좋아요 누르기 전)
		function makeTravelPlaceView(travelPlace){
			var div = $("<div>"); 
		 	div.attr("id", "c"+travelPlace.placeNo);
			div.addClass('travelPlaceList');
			div[0].travelPlaceList=travelPlace;  //{id:1,.... } 
			var year = (travelPlace.placeVisitDate).substring(0,4) ;
			var month = (travelPlace.placeVisitDate).substring(5,7);
			var day = (travelPlace.placeVisitDate).substring(8,10);
			var str = "<article class=\"panel panel-warning\">"
						+"<div class=\"panel-heading icon\">"
						+"<i class=\"glyphicon glyphicon glyphicon-map-marker\"></i>"
						+"<p style=\"margin:-5px; background-color:#fff;\">" + year +"</p>"
		 				+"<p style=\"margin:-15px;background-color:#fff;\">" + month +"</p>"
						+"<p style=\"background-color:#fff;\">" + day +"</p>"
						+"</div>"
						+"<div class=\"panel-heading\">"
						+"<h2 class=\"panel-title\" style=\"display: inline;\">" + travelPlace.placeTitle + "</h2>"
						+"<button type=\"button\" class=\"btn btn-sm btn-default\" style=\"float:right;\" onclick=\"location.href='./getTravelPlace?placeNo="+travelPlace.placeNo+"'\">상세보기</button>"
						+"</div>"
						+"<div class=\"panel-body\">"
						+ travelPlace.placeName + "<br>"
						+"<small>" + travelPlace.placeAddress + "</small><br>"
						+"<img class=\"img-rounded\" src=\"./images/travel/"+ travelPlace.placePic+"\" /><br>"
						+"<pre style=\"background-color:white; font-size: 12px;\">"+travelPlace.placeContent+"</pre>"
						+"</div>"
					
						+"<div id=\"footer\" class=\"panel-footer\">"
				var login = '${sessionScope.login.userId}';
				if(login != ''){
				str += "<div id='LikeConditionP"+travelPlace.placeNo+"'>";
	
				var params = { userId : '${sessionScope.login.userId}',
				   		 	   likeCategory : 'P',
				   		 	   likeBoardid : travelPlace.placeNo
			   				  };
				$.getJSON("getLike", params, function(data){
				   if (!data) {
					   var div = makeDisLikeBtn('P',travelPlace.placeNo);
						$(div).appendTo("#LikeConditionP"+travelPlace.placeNo);
				    }
				   else {
					   var div = makeLikeBtn('P',travelPlace.placeNo);
						$(div).appendTo("#LikeConditionP"+travelPlace.placeNo);
				   }
			    });		
				
				str += "</div>";
			} else {
				str += "<div><img src='./images/dislike.png' width='20px'></div>";
			}
			str += "</div></article>";
						
			div.html(str);
			return div;
		}; 	// end of makeTravelPlaceView
		
		/* 여행정보 좋아요 */
	   function likeCondition() {
		   var params = { userId : '${sessionScope.login.userId}',
				   		 likeCategory : 'T',
				   		 likeBoardid :'${travelBoard.travelNo}'
		   				}
		   $.getJSON("getLike", params, function(data){
			   if (!data) {
				   var div = makeDisLikeBtn('T','${travelBoard.travelNo}');
					$(div).appendTo("#LikeConditionT"+'${travelBoard.travelNo}');
			   }
			   else {
				   var div = makeLikeBtn('T','${travelBoard.travelNo}');
					$(div).appendTo("#LikeConditionT"+'${travelBoard.travelNo}');
			   }
		   });
	   }
	   function makeDisLikeBtn(likeCategory,likeBoardid) {
			var div =$("<div>");
			div.addClass('LikeCondition'+likeCategory+likeBoardid);
			var str = "<form action='./insertLike' method='post'>"
						+ "<input type='hidden' name='likeCategory' value="+likeCategory+">"
						+ "<input type='hidden' name='likeBoardid' value="+likeBoardid+">"
						+ "<input type='hidden' name='userId' value='${sessionScope.login.userId}'>"
						+ "<button type='submit' style='border:0; outline:0; background-color: transparent !important; width:20px; height:20px;'>"
						+ "<img src='./images/dislike.png'></button></form>"
			div.html(str);
			return div;
	   }
	   function makeLikeBtn(likeCategory,likeBoardid) {
			var div =$("<div>");
			div.addClass('LikeCondition'+likeCategory+likeBoardid);
			var str = "<button onclick=\"disLike('${sessionScope.login.userId}','"+likeCategory+"','"+likeBoardid+"')\" style='border:0; outline:0; background-color: transparent !important; width:20px; height:20px;'>"
					+ "<img src='./images/like.png'></button>"
			div.html(str);
			return div;
	   }
	   likeCondition();
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
}  
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

			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
						
						<!-- 여행기 정보 -->				
						<div class="container dad">
							<div class="son-1">
							<c:if test="${travelBoard.travelPic != null}">
							<img src="./images/travel/${travelBoard.travelPic}" style="width:100%;">
							</c:if>
							<c:if test="${travelBoard.travelPic == null}">
							<img src="./images/travel/noimage.jpg" style="width:100%;">
							</c:if>
							</div>
							<span class="top-span">NO : T${travelBoard.travelNo}</span>
							<span class="top-span">${fn:substring(travelBoard.travelDate, 0, 10)}</span>
							<span class="top-span">조회수 : ${travelBoard.travelHit}</span><br>
							
							<p class="son-text">
								<span class="son-span">${travelBoard.travelTitle}</span><br/><br/>
								<span class="text-span">여행지 : ${travelBoard.tinfoCity}</span>
								<span class="text-span">여행테마 : <c:if test="${travelBoard.travelWith == 'alone'}">
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
								</span><br>
								<span class="text-span">여행인원 : ${travelBoard.travelPerson+1}명</span>
								<span class="text-span">여행경비 : ${travelBoard.travelPay}원</span><br>
								<span class="text-span">여행일정 : ${travelBoard.travelSche}</span>
								<span class="text-span">여행기간 : ${fn:substring(travelBoard.travelStart, 0, 10)} ~ ${fn:substring(travelBoard.travelEnd, 0, 10)}</span><br>
							</p>

						</div>
						<!-- 장소 리스트 -->
						<div style="padding:10px;">
							<div class="timeline">
								<div class="line text-muted"></div>
								<article class="panel panel-default">
											<div class="panel-heading icon">
												<i class="glyphicon glyphicon glyphicon glyphicon-user"></i>
											</div>
	
											<div class="panel-heading">
											<c:if test="${sessionScope.login.userId eq travelBoard.userId}"><strong>${travelBoard.userId}</strong>
											
											</c:if>
				                            <c:if test="${sessionScope.login.userId ne travelBoard.userId}">
												<h2 class="panel-title"><a href="getYourTravelList?userId=${travelBoard.userId}" class="goToUserPage" style="text-decoration:none;"><strong>${travelBoard.userId}</strong></a></h2>
											</c:if>
											</div>
	
											<div class="panel-body">
												<pre style="background-color:white; font-size: 12px; ">${travelBoard.travelContent}</pre>
											</div>
											
											<div class="panel-footer">
											<c:choose>
												<c:when test="${not empty sessionScope.login}">
													<div id="LikeConditionT${travelBoard.travelNo}"></div>
												</c:when>
												<c:otherwise>
													<img src="./images/dislike.png" width="20px">
												</c:otherwise>
											</c:choose>
											</div>
								</article>
								
								<div id="travelPlaceList"></div>
								</div>
								<c:if test="${sessionScope.login.userId eq travelBoard.userId}">
								
								<div class="form-group" style="float:right;"><br>
										<label for="update" class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md" 
												onClick="location.href='./updateTravelBoardform?travelNo=${travelBoard.travelNo}'" 
												style="background-color:#f9bf3b; border:#f9bf3b;" value="수정">&nbsp;
								<label for="delete" class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md" onClick="del('${travelBoard.travelNo}')" style="background-color:#f9bf3b; border:#f9bf3b;" value="삭제">
							</div>
								 </c:if>
							</div>
						</div>	<!-- end of table-responsive -->					
						
<!-- 여행 등록 modal -->			
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
										<input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="여행기 만들기">
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
</body>
</html>
