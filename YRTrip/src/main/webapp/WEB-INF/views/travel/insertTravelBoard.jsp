<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 글 수정</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="resources/vender/jquery.form.min.js" type="text/javascript"></script>
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
	color: #22313F;
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

#map {
	height: 400px;
}

.controls {
	background-color: #fff;
	border-radius: 2px;
	border: 1px solid transparent;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	box-sizing: border-box;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	height: 29px;
	margin-left: 17px;
	margin-top: 10px;
	outline: none;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 280px;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}
.pac-container{
	z-index:1051;
}
#map1 {
	height: 400px;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

#infowindow-content1 {
	display: none;
}

#map1 #infowindow-content1 {
	display: inline;
}
</style>

<script>

/* Modal 여행테마 select */      
function selectTravelWith(ele){
  	 if(ele.value=='alone'){
  	travelBoardModalfrm.travelPerson.disabled=true;
   } else {
	travelBoardModalfrm.travelPerson.disabled=false;	   
   }   
} 

$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';

	/* 여행등록 modal */
   $("#insertTravelBoardButton").click(function(){
    	$('div#insertTravelBoard').modal(true);
	});
	
   /* 장소 추가 modal */
   $("#insertTravelPlaceButton").click(function(){
	   jQuery.noConflict();
    	$('div#insertTravelPlace').modal(true);
    	$('.modal').on('hidden.bs.modal', function (e) {
	    	  $(this).find('#insertTravelPlaceAjaxData')[0].reset();
	    	});
	});	 
   
   /* 장소 수정 modal */
   $("#travelPlaceList").on("click", ".btnUpd", function(){
 		var div = $(this).closest('.travelPlace');
 		$("#updateTravelPlaceAjaxData [name=placeNo]").val(div[0].data.placeNo);
 		$("#updateTravelPlaceAjaxData [name=placeName]").val(div[0].data.placeName);
 		$("#updateTravelPlaceAjaxData [name=placeAddress]").val(div[0].data.placeAddress);
 		$("#updateTravelPlaceAjaxData [name=placeTitle]").val(div[0].data.placeTitle);
 		$("#updateTravelPlaceAjaxData [name=placefile]").val(div[0].data.placePic);
 		$("#updateTravelPlaceAjaxData [name=placeContent]").val(div[0].data.placeContent);
 		$("#updateTravelPlaceAjaxData [name=placeVisitDate]").val((div[0].data.placeVisitDate).substring(0,10));
 		jQuery.noConflict();
 		$('div#updateTravelPlace').modal(true);
	});	
   
    /* 사진 업로드 Board */
	$("#fileInput").on('change', function(){ 
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#userfile").val(filename);
	});
    
    /* 사진 업로드 insert place */
	$("#placefileInput").on('change', function(){ 
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#placefile").val(filename);
	});
    
    /* 사진 업로드 update place */
	$("#updateplacefileInput").on('change', function(){ 
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#updateplacefile").val(filename);
	});
   

	/* modal 자동완성 시작 */
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
    /* modal 자동완성 끝 */
    
    
    
    $("#autocompleteTinfoListModal").change(function(){
		selectedListModal = "";
	   $("#tinfoListModal").val("");
	   $("#tinfoListDispModal").val("");
	   $('[name=searchTinfoListboxModal]').val("");
	});


	//장소 등록
 	$("#insertTravelPlaceBtn").click(function(){
		jQuery.noConflict();
		var form = $("#insertTravelPlaceAjaxData")[0];        
        var formData = new FormData(form);

        $.ajax({
            cache : false,
            url : "insertTravelPlaceAjax",
            processData: false,
            contentType: false,
            type : 'POST', 
            data : formData, 
            success : function(data) {
            	var div = makeTravelPlaceView(data);
    			$(div).prependTo("#travelPlaceList");
    			jQuery.noConflict();
    			$('#insertTravelPlace').modal("hide");
            }
        }); 
	});
	
	//장소 삭제
	$("#travelPlaceList").on("click", ".btnDel", function(){
 		var placeNo = $(this).closest('.travelPlace').attr("id").substr(1);
		if(confirm("삭제할까요?")) {
			var params = "placeNo=" + placeNo;
			var url = "deleteTravelPlaceAjax";
			$.getJSON(url, params, function(datas){
				$('#c'+placeNo).remove();
			});
		}
	});
	//장소 수정
	$("#updateTravelPlaceBtn").click(function(){
		jQuery.noConflict();
		var form = $("#updateTravelPlaceAjaxData")[0];        
        var formData = new FormData(form);
        $.ajax({
            cache : false,
            url : "updateTravelPlaceAjax",
            processData: false,
            contentType: false,
            type : 'POST', 
            data : formData, 
            success : function(data) {
            	var div = makeTravelPlaceView(data);
    			$(div).prependTo("#travelPlaceList");
    			jQuery.noConflict();
    			$('#updateTravelPlace').modal("hide");
    			$("#c"+placeNo).remove();
    			loadTravelPlaceList();
            }
        }); 
	});
    
	loadTravelPlaceList();

});

//장소리스트 조회 요청	
function loadTravelPlaceList(){
	var params = { travelNo : '${travelBoard.travelNo}' };
	$.getJSON("selectTravelPlaceList", params, function(datas){
		for(i=0; i<datas.length; i++){
			var div = makeTravelPlaceView(datas[i]);
			$(div).appendTo("#travelPlaceList");
		}
	});
} 	// end of loadTravelPlaceList


//장소리스트 조회 뷰
function makeTravelPlaceView(travelPlace){
	var div = $("<div>"); 
	div[0].data = travelPlace;
 	div.attr("id", "c"+travelPlace.placeNo);
	div.addClass('travelPlace');
   	var year = (travelPlace.placeVisitDate).substring(0,4) ;
	var month = (travelPlace.placeVisitDate).substring(5,7);
	var day = (travelPlace.placeVisitDate).substring(8,10);
	var str = "<article class=\"panel panel-warning placeNo\" id=\"c"+travelPlace.placeNo+"\">"
				+"<div class=\"panel-heading icon\">"
				+"<i class=\"glyphicon glyphicon glyphicon-map-marker\"></i>"
  				+"<p style=\"margin:-5px; background-color:#fff;\">" + year +"</p>"
  				+"<p style=\"margin:-15px;background-color:#fff;\">" + month +"</p>"
				+"<p style=\"background-color:#fff;\">" + day +"</p>" 
				+"</div>"
			
				+"<div class=\"panel-heading\">"
				+"<h2 class=\"panel-title\" style=\"display: inline;\">" + travelPlace.placeTitle + "</h2>"
 				+"<button type=\"button\" class=\"btnDel btn btn-sm btn-danger\" style=\"float:right;\">삭제</button>"
 				+"<button type=\"button\" value='"+travelPlace.placeNo+"' class=\"btnUpd btn btn-sm btn-warning\" style=\"float:right; margin-right:10px;\">수정</button>" 
				+"<br>"
				
				+"</div>"
			
				+"<div class=\"panel-body\">"
				+"<strong>"+travelPlace.placeName + "</strong><br>"
				+"<small>" + travelPlace.placeAddress + "</small>"
				+"<img class=\"img-responsive img-rounded\" src=\"./images/travel/"+ travelPlace.placePic+"\" /><br>"
				+"<pre style=\"background-color:#fff; border-style:none;\">"+travelPlace.placeContent+"</pre>"
				+"</div>"
			
				+"<div id=\"footer\" class=\"panel-footer\">"
				+"</div>"
				+"</article>"
	div.html(str);
	return div;
} 	// end of makeTravelPlaceView



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

				<!-- 여행기 수정 폼 -->
				<div>
					<div class="col-sm-6" style="min-width: 700px">
						<div class="table-responsive" style="min-height: 450px;">
						<form action="./updateTravelBoard"enctype="multipart/form-data" method="post">
						<!-- 여행기 정보 -->				
						<div class="container dad">
							<div class="son-1">
							<c:if test="${travelBoard.travelPic != null}">
							<img src="./images/travel/${travelBoard.travelPic}" class="img-responsive">
							</c:if>
							<c:if test="${travelBoard.travelPic == null}">
							<img src="./images/travel/noimage.jpg" class="img-responsive">
							</c:if>
							</div>
							<span class="top-span">T${travelBoard.travelNo}</span>
							<span class="top-span">${fn:substring(travelBoard.travelDate, 0, 10)}</span>
							<span class="top-span">조회수 : ${travelBoard.travelHit}</span><br>

							<p class="son-text">
								<span class="son-span"><input type="text" value="${travelBoard.travelTitle}" name="travelTitle"></span><br/><br/>
								<span class="text-span">여행지 : ${travelBoard.tinfoCity}</span>
								<span class="text-span">여행테마 : <select name="travelWith" style="background-color:#22313F;">
																		  <option value="alone">나홀로 여행</option>
																		  <option value="friend">친구와 함께</option>
																		  <option value="family">가족과 함께</option>
																		  <option value="couple">연인과 함께</option>
																		  <option value="group">단체여행</option>
																		  <option value="package">패키지여행</option>
																		</select>
								<script>
								$('[name="travelWith"]').val("${travelBoard.travelWith}");
								</script>
								</span> <br>
								<span class="text-span"> ${sessionScope.login.userName}님과 함께한 여행인원 
										<select name="travelPerson" style="background-color:#22313F;">
											  <option value="0">0명</option>
											  <option value="1">1명</option>
											  <option value="2">2명</option>
											  <option value="3">3명</option>
											  <option value="4">4명</option>
											  <option value="5">5명</option>
											  <option value="6">6명 이상</option>
										</select>
								<script>
								$('[name="travelPerson"]').val("${travelBoard.travelPerson}");
								</script>
								</span><br>
								<span class="text-span">여행일정 : <input type="text" value="${travelBoard.travelSche}" class="update-input" name="travelSche"></span>
								<span class="text-span">여행기간 : <input type="text" value="${fn:substring(travelBoard.travelStart, 0, 10)}" class="update-input datePicker" style="width:100px!important;" name="travelStart"> ~ 
																<input type="text" value="${fn:substring(travelBoard.travelEnd, 0, 10)}" class="update-input datePicker" style="width:100px!important;" name="travelEnd">
								</span><br>
							</p>

						</div>
							<!-- 타임라인 -->
							<div style="padding-top:10px;">
							<div class="timeline">
								<div class="line text-muted"></div>
								<article class="panel panel-default">
											<div class="panel-heading icon">
												<i class="glyphicon glyphicon glyphicon glyphicon-user"></i>
											</div>
	
											<div class="panel-heading">
												<h2 class="panel-title">${travelBoard.userId}</h2>
											</div>
	
											<div class="panel-body">
												<textarea class="form-control" rows="3" name="travelContent" placeholder="지난 여행에 대한 간단한 후기를 입력해주세요:-)"></textarea><br>
												<input type="number" class="form-control" name="travelPay" placeholder="여행에 사용한 총 경비를 입력해주세요.(숫자만 입력 가능)" required><br>
												<input type="file" name="travelPicFile"
						 							id="fileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);" value="${travelBoard.travelPic}">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="userfile" class="form-control"
														name="userfile" disabled="" placeholder="${travelBoard.travelPic}">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="fileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
											</div>
											<div class="panel-footer">
												<i class="glyphicon glyphicon-heart" style="color: #ff8000;"></i>
												<small>${travelBoard.travelLike}</small>
											</div>
								</article>
								<div id="travelPlaceList">
								</div>		
								<!-- 장소 추가 -->
								<article class="panel panel-success">

									<div class="panel-heading icon">
										<i class="glyphicon glyphicon-plus"></i>
									</div>

									<div class="panel-heading">
										<h2 class="panel-title">내가 방문한 장소를 등록하세요.</h2>
									</div>
									<div class="panel-body">
									<button type="button" class="btn btn-sm btn-default" id="insertTravelPlaceButton">
												<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 장소 추가</i>
									</button>
									</div>
								</article>

							</div>
							</div>
										<button class="btn btn-sm btn-warning pull-right" type="submit">
											<i class="fas fa-pencil-alt fa-fw"></i>등록 완료하기
										</button>
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
</form>
						</div><!-- end of table-responsive -->

<!-- 장소 추가 modal -->			
<div class="modal fade" id="insertTravelPlace">
	<div class="modal-dialog" style="padding: 30px 0 0 0;">
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
									<form action="./insertTravelPlaceAjax" id="insertTravelPlaceAjaxData" method="post" enctype="multipart/form-data">
									<div id="map"></div>
								<input id="pac-input" class="controls" type="text" placeholder="다녀온 장소를 입력해주세요.">
								<div id="infowindow-content">
									<span id="place-name" class="title"></span>
									<span id="place-address"></span>
									</div>
										<div class="panel-body">
												<div class="form-group">
													<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeTitle" class="form-control" placeholder="장소에 대한 제목을 입력해주세요."style="margin: -10px 0;">
												</div>
												<div class="form-group">
													<label for="placeName" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeName" class="form-control" placeholder="장소명은 지도에서 선택하면 자동으로 입력됩니다.">
												</div>
												<div class="form-group">
													<label for="placeAddress" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeAddress" class="form-control" placeholder="주소는 지도에서 선택하면 자동으로 입력됩니다.">
												</div>
												<div class="form-group">
													<input type="file" name="placePicFile"
						 							id="placefileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="placefile" class="form-control"
														name="placefile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="placefileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
												</div>
												<div class="form-group">
													<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
													<textarea class="form-control" rows="3" name="placeContent" placeholder="방문했던 장소에 대한 후기를 입력해주세요."></textarea>
												</div>
												<div class="form-group">
													<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeVisitDate" class="form-control datePicker" placeholder="장소에 방문한 날짜를 선택해주세요.">
												</div>
												<button type="button" id="insertTravelPlaceBtn" class="btn btn-sm btn-default">
													<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 등록</i>
												</button>
											</div>
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
									</form>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- end of modal-body -->
		</div> <!-- end of modal-content -->
	</div> 
</div> <!-- end of modal -->		

<!-- 장소 수정 modal -->			
<div class="modal fade" id="updateTravelPlace">
	<div class="modal-dialog" style="padding: 30px 0 0 0;">
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
									<form action="./updateTravelPlaceform" id="updateTravelPlaceAjaxData" method="post" enctype="multipart/form-data">
									<div id="map1"></div>
								<input id="pac-input1" class="controls" type="text" placeholder="다녀온 장소를 입력해주세요.">
								<div id="infowindow-content1">
									<span id="place-name1" class="title"></span>
									<span id="place-address1"></span>
									</div>
										<div class="panel-body">
												<div class="form-group">
													<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeTitle" class="form-control">
												</div>
												<div class="form-group">
													<label for="placeName" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeName" class="form-control">
												</div>
												<div class="form-group">
													<label for="placeAddress" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeAddress" class="form-control">
												</div>
													<input type="file" name="placePicFile"
						 							id="updateplacefileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="updateplacefile" class="form-control"
														name="updateplacefile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="updateplacefileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
												<div class="form-group">
													<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
													<textarea class="form-control" rows="3" name="placeContent"></textarea>
												</div>
												<div class="form-group">
													<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeVisitDate" class="form-control datePicker">
												</div>
												<button type="button" id="updateTravelPlaceBtn" class="btn btn-sm btn-default">
													<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 수정</i>
												</button>
											</div>
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
										<input type="hidden" name="placeNo" value="${travelPlace.placeNo}">
									</form>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- end of modal-body -->
		</div> <!-- end of modal-content -->
	</div> 
</div> <!-- end of modal -->							
						
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
				</div>
				<!-- end of list -->

			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</section>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7TwRGWpLz6wVhQ537n2nMcDGO5wKa_Jw&libraries=places&callback=initMap" async defer></script> 
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
/* 지도 */
function initMap() {
		/* 장소 등록 modal부분 */
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.565598, lng: 126.978031},
          zoom: 13
        });

        var input = document.getElementById('pac-input');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        var infowindow = new google.maps.InfoWindow();
        
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
        
        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }
          
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          }

          marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
          });
          marker.setVisible(true);

          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = place.formatted_address;
          infowindow.open(map, marker);
			
          $("#insertTravelPlaceAjaxData [name=placeName]").val(place.name);
          $("#insertTravelPlaceAjaxData [name=placeAddress]").val(place.formatted_address);
        });
        
        /* 장소 수정 modal부분 */
        var map1 = new google.maps.Map(document.getElementById('map1'), {
            center: {lat: 37.565598, lng: 126.978031},
            zoom: 13
          });
        var input1 = document.getElementById('pac-input1');
        var autocomplete1 = new google.maps.places.Autocomplete(input1);
        autocomplete1.bindTo('bounds', map1);
        
        map1.controls[google.maps.ControlPosition.TOP_LEFT].push(input1);
        
        var infowindow1 = new google.maps.InfoWindow();
        var infowindowContent1 = document.getElementById('infowindow-content1');
        infowindow1.setContent(infowindowContent1);
        
        var marker1 = new google.maps.Marker({
          map: map1
        });
        marker1.addListener('click', function() {
          infowindow1.open(map1, marker1);
        });
        autocomplete1.addListener('place_changed', function() {
            infowindow1.close();
            var place1 = autocomplete1.getPlace();
            if (!place1.geometry) {
              return;
            }
            
            if (place1.geometry.viewport) {
              map1.fitBounds(place1.geometry.viewport);
            } else {
              map1.setCenter(place1.geometry.location);
              map1.setZoom(17);
            }

            marker1.setPlace({
              placeId: place1.place_id,
              location: place1.geometry.location
            });
            marker1.setVisible(true);

            infowindowContent1.children['place-name1'].textContent = place1.name;
            infowindowContent1.children['place-address1'].textContent = place1.formatted_address;
            infowindow1.open(map1, marker1);
  			
            $("#updateTravelPlaceAjaxData [name=placeName]").val(place1.name);
            $("#updateTravelPlaceAjaxData [name=placeAddress]").val(place1.formatted_address);
          });
      }
</script>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 글 수정</title>
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
	color: #22313F;
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

#map {
	height: 400px;
}

.controls {
	background-color: #fff;
	border-radius: 2px;
	border: 1px solid transparent;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	box-sizing: border-box;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	height: 29px;
	margin-left: 17px;
	margin-top: 10px;
	outline: none;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 280px;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}
.pac-container{
	z-index:1051;
}
</style>

<script>

$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';
});
jQuery( document ).ready(function( $ ) {
		/* 여행등록 modal */
	   $("#insertTravelBoardButton").click(function(){
	    	$('div#insertTravelBoard').modal(true);
		});
		
	   /* 장소 추가 modal */
	   $("#insertTravelPlaceButton").click(function(){
	    	$('div#insertTravelPlace').modal(true);
	    	$('.modal').on('hidden.bs.modal', function (e) {
		    	  $(this).find('#insertTravelPlaceAjaxData')[0].reset();
		    	});
		});	 
	   
	   /* 장소 수정 modal */
	   $("#travelPlaceList").on("click", ".btnUpd", function(){
	 		var div = $(this).closest('.travelPlace');
	 		$("#updateTravelPlaceAjaxData [name=placeNo]").val(div[0].data.placeNo);
	 		$("#updateTravelPlaceAjaxData [name=placeName]").val(div[0].data.placeName);
	 		$("#updateTravelPlaceAjaxData [name=placeAddress]").val(div[0].data.placeAddress);
	 		$("#updateTravelPlaceAjaxData [name=placeTitle]").val(div[0].data.placeTitle);
	 		$("#updateTravelPlaceAjaxData [name=placefile]").val(div[0].data.placePic);
	 		$("#updateTravelPlaceAjaxData [name=placeContent]").val(div[0].data.placeContent);
	 		$("#updateTravelPlaceAjaxData [name=placeVisitDate]").val((div[0].data.placeVisitDate).substring(0,10));
	    	$('div#updateTravelPlace').modal(true);
		});	
	   
	   /* 사진 업로드 Board */
		$("#fileInput").on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}

			// 추출한 파일명 삽입
			$("#userfile").val(filename);
		});
	    /* 사진 업로드 insert place */
		$("#placefileInput").on('change', function(){ 
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$("#placefile").val(filename);
		});
	    
	    /* 사진 업로드 update place */
		$("#updateplacefileInput").on('change', function(){ 
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$("#updateplacefile").val(filename);
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
} 	// end of loadTravelPlaceList
//장소리스트 조회 뷰
	function makeTravelPlaceView(travelPlace){
	var div = $("<div>"); 
	div[0].data = travelPlace;
 	div.attr("id", "c"+travelPlace.placeNo);
	div.addClass('travelPlace');
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
 				+"<button type=\"button\" class=\"btnDel btn btn-sm btn-danger\" style=\"float:right;\">삭제</button>"
 				+"<button type=\"button\" value='"+travelPlace.placeNo+"' class=\"btnUpd btn btn-sm btn-warning\" style=\"float:right; margin-right:10px;\">수정</button>" 
				+"<br>"
				
				+"</div>"
			
				+"<div class=\"panel-body\">"
				+"<strong>"+travelPlace.placeName + "</strong><br>"
				+"<small>" + travelPlace.placeAddress + "</small>"
				+"<img class=\"img-responsive img-rounded\" src=\"./images/travel/"+ travelPlace.placePic+"\" /><br>"
				+"<pre style=\"background-color:#fff; border-style:none;\">"+travelPlace.placeContent+"</pre>"
				+"</div>"
			
				+"<div id=\"footer\" class=\"panel-footer\">"
				+"</div>"
				+"</article>"
	div.html(str);
	return div;
} 	// end of makeTravelPlaceView

	//장소 등록
 	$("#insertTravelPlaceBtn").click(function(){
		jQuery.noConflict();
		var form = $("#insertTravelPlaceAjaxData")[0];        
        var formData = new FormData(form);

        $.ajax({
            cache : false,
            url : "insertTravelPlaceAjax",
            processData: false,
            contentType: false,
            type : 'POST', 
            data : formData, 
            success : function(data) {
            	var div = makeTravelPlaceView(data);
    			$(div).prependTo("#travelPlaceList");
    			jQuery.noConflict();
    			$('#insertTravelPlace').modal("hide");
            }
        }); 
	});
//장소 삭제
	$("#travelPlaceList").on("click", ".btnDel", function(){
 		var placeNo = $(this).closest('.travelPlace').attr("id").substr(1);
		if(confirm("삭제할까요?")) {
			var params = "placeNo=" + placeNo;
			var url = "deleteTravelPlaceAjax";
			$.getJSON(url, params, function(datas){
				$('#c'+placeNo).remove();
			});
		}
	});
	//장소 수정
	$("#updateTravelPlaceBtn").click(function(){
		jQuery.noConflict();
		var form = $("#updateTravelPlaceAjaxData")[0];        
        var formData = new FormData(form);
        $.ajax({
            cache : false,
            url : "updateTravelPlaceAjax",
            processData: false,
            contentType: false,
            type : 'POST', 
            data : formData, 
            success : function(data) {
            	var div = makeTravelPlaceView(data);
    			$(div).prependTo("#travelPlaceList");
    			jQuery.noConflict();
    			$('#updateTravelPlace').modal("hide");
    			$("#c"+placeNo).remove();
    			loadTravelPlaceList();
            }
        }); 
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

				<!-- 여행기 등록 폼 -->
				<div>
					<div class="col-sm-6" style="min-width: 700px">
						<div class="table-responsive" style="min-height: 450px;">
						<form action="./updateTravelBoard" method="post" enctype="multipart/form-data">
						<!-- 여행기 정보 -->				
						<div class="container dad">
							<div class="son-1">
							<c:if test="${travelBoard.travelPic != null}">
							<img src="./images/travel/${travelPic}" class="img-responsive">
							</c:if>
							<c:if test="${travelBoard.travelPic == null}">
							<img src="./images/travel/noimage.jpg" class="img-responsive">
							</c:if>
							</div>
							<span class="top-span">T${travelBoard.travelNo}</span>
							<span class="top-span">${fn:substring(travelBoard.travelDate, 0, 10)}</span>
							<span class="top-span">조회수 : ${travelBoard.travelHit}</span><br>

							<p class="son-text">
								<span class="son-span"><input type="text" value="${travelBoard.travelTitle}" name="travelTitle"></span><br/><br/>
								<span class="text-span">여행지 : ${travelBoard.tinfoCity}</span>
								<span class="text-span">여행테마 :
																	 <select name="travelWith" style="background-color:#22313F;" required>
																		  <option value="alone">나홀로 여행</option>
																		  <option value="friend">친구와 함께</option>
																		  <option value="family">가족과 함께</option>
																		  <option value="couple">연인과 함께</option>
																		  <option value="group">단체여행</option>
																		  <option value="package" selected>패키지여행</option>
																		</select>
																		<script>
								$('[name="travelWith"]').val("${travelBoard.travelWith}");
								</script>
								</span> <br>
								<span class="text-span"> ${sessionScope.login.userName}님과 함께한 여행인원 : 
										<select name="travelPerson" style="background-color:#22313F;" required>
											  <option value="0" selected>0명</option>
											  <option value="1">1명</option>
											  <option value="2">2명</option>
											  <option value="3">3명</option>
											  <option value="4">4명</option>
											  <option value="5">5명</option>
											  <option value="6">6명 이상</option>
										</select>
								<script>
								$('[name="travelPerson"]').val("${travelBoard.travelPerson}");
								</script>
								</span><br>
								<span class="text-span">여행일정 : <input type="text" value="${travelBoard.travelSche}" class="update-input" name="travelSche" required></span>
								<span class="text-span">여행기간 : <input type="text" value="${fn:substring(travelBoard.travelStart, 0, 10)}" class="update-input datePicker" style="width:100px!important;" name="travelStart" required> ~ 
																<input type="text" value="${fn:substring(travelBoard.travelEnd, 0, 10)}" class="update-input datePicker" style="width:100px!important;" name="travelEnd" required>
								</span><br>
							</p>

						</div>
							<!-- 타임라인 -->
							<div style="padding-top:10px;">
							<div class="timeline">
								<div class="line text-muted"></div>
								<article class="panel panel-default">
											<div class="panel-heading icon">
												<i class="glyphicon glyphicon glyphicon glyphicon-user"></i>
											</div>
	
											<div class="panel-heading">
												<h2 class="panel-title">${travelBoard.userId}</h2>
											</div>
	
											<div class="panel-body">
												<textarea class="form-control" rows="3" name="travelContent" placeholder="여행에 대해 간단한 후기를 작성해주세요:-)" required></textarea><br>
												<input type="number" class="form-control" name="travelPay" placeholder="여행에 사용한 총 경비를 입력해주세요.(숫자만 입력 가능)" required><br>
												<input type="file" name="travelPicFile"
						 							id="fileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="userfile" class="form-control"
														name="userfile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="fileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
											</div>
											<div class="panel-footer">
											</div>
								</article>
								<div id="travelPlaceList">
								</div>		
								<!-- 장소 추가 -->
								<article class="panel panel-success">

									<div class="panel-heading icon">
										<i class="glyphicon glyphicon-plus"></i>
									</div>

									<div class="panel-heading">
										<h2 class="panel-title">내가 방문한 장소를 등록하세요.</h2>
									</div>
									<div class="panel-body">
									<button type="button" class="btn btn-sm btn-default" id="insertTravelPlaceButton">
												<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 장소 추가</i>
									</button>
									</div>
								</article>

							</div>
							</div>
										<button class="btn btn-sm btn-warning pull-right" type="submit">
											<i class="fas fa-pencil-alt fa-fw"></i>등록 완료하기
										</button>
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
</form>
						</div><!-- end of table-responsive -->

<!-- 장소 추가 modal -->			
<div class="modal fade" id="insertTravelPlace">
	<div class="modal-dialog" style="padding: 30px 0 0 0;">
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
									<form action="./insertTravelPlaceAjax" id="insertTravelPlaceAjaxData" method="post" enctype="multipart/form-data">
									<div id="map"></div>
								<input id="pac-input" class="controls" type="text" placeholder="다녀온 장소를 입력해주세요.">
								<div id="infowindow-content">
									<span id="place-name" class="title"></span>
									<span id="place-address"></span>
									</div>
										<div class="panel-body">
												<div class="form-group">
													<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeTitle" class="form-control" placeholder="장소에 대한 제목을 입력해주세요."style="margin: -10px 0;">
												</div>
												<div class="form-group">
													<label for="placeName" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeName" class="form-control" placeholder="장소명은 지도에서 선택하면 자동으로 입력됩니다.">
												</div>
												<div class="form-group">
													<label for="placeAddress" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeAddress" class="form-control" placeholder="주소는 지도에서 선택하면 자동으로 입력됩니다.">
												</div>
												<div class="form-group">
													<input type="file" name="placePicFile"
						 							id="placefileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="placefile" class="form-control"
														name="placefile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="placefileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
												</div>
												<div class="form-group">
													<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
													<textarea class="form-control" rows="3" name="placeContent" placeholder="방문했던 장소에 대한 후기를 입력해주세요."></textarea>
												</div>
												<div class="form-group">
													<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeVisitDate" class="form-control datePicker" placeholder="장소에 방문한 날짜를 선택해주세요.">
												</div>
												<button type="button" id="insertTravelPlaceBtn" class="btn btn-sm btn-default">
													<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 등록</i>
												</button>
											</div>
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
									</form>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- end of modal-body -->
		</div> <!-- end of modal-content -->
	</div> 
</div> <!-- end of modal -->		

<!-- 장소 수정 modal -->			
<div class="modal fade" id="updateTravelPlace">
	<div class="modal-dialog" style="padding: 30px 0 0 0;">
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
									<form action="./updateTravelPlaceform" id="updateTravelPlaceAjaxData" method="post" enctype="multipart/form-data">
									<div id="map1"></div>
								<input id="pac-input1" class="controls" type="text" placeholder="다녀온 장소를 입력해주세요.">
								<div id="infowindow-content1">
									<span id="place-name1" class="title"></span>
									<span id="place-address1"></span>
									</div>
										<div class="panel-body">
												<div class="form-group">
													<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeTitle" class="form-control">
												</div>
												<div class="form-group">
													<label for="placeName" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeName" class="form-control">
												</div>
												<div class="form-group">
													<label for="placeAddress" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeAddress" class="form-control">
												</div>
													<input type="file" name="placePicFile"
						 							id="updateplacefileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="updateplacefile" class="form-control"
														name="updateplacefile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="updateplacefileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
												<div class="form-group">
													<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
													<textarea class="form-control" rows="3" name="placeContent"></textarea>
												</div>
												<div class="form-group">
													<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
													<input type="text" name="placeVisitDate" class="form-control datePicker">
												</div>
												<button type="button" id="updateTravelPlaceBtn" class="btn btn-sm btn-default">
													<i class="glyphicon glyphicon glyphicon-map-marker" style="color: #009933;"> 수정</i>
												</button>
											</div>
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="travelNo" value="${travelBoard.travelNo}">
										<input type="hidden" name="placeNo" value="${travelPlace.placeNo}">
									</form>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- end of modal-body -->
		</div> <!-- end of modal-content -->
	</div> 
</div> <!-- end of modal -->								
						
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
										<input type="text" class="form-control" id="autocompleteTinfoListModal" placeholder="다녀 온 여행지를 검색해주세요." autocomplete="on" name="searchTinfoListboxModal">
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
				</div>
				<!-- end of list -->

			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</section>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7TwRGWpLz6wVhQ537n2nMcDGO5wKa_Jw&libraries=places&callback=initMap" async defer></script> 
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
/* 지도 */
function initMap() {
		/* 장소 등록 modal 부분 */
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.565598, lng: 126.978031},
          zoom: 13
        });

        var input = document.getElementById('pac-input');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }
          
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          }

          marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
          });
          marker.setVisible(true);

          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = place.formatted_address;
          infowindow.open(map, marker);
			
          $("#insertTravelPlaceAjaxData [name=placeName]").val(place.name);
          $("#insertTravelPlaceAjaxData [name=placeAddress]").val(place.formatted_address);
        });
        
        /* 장소 수정 modal부분 */
        var map1 = new google.maps.Map(document.getElementById('map1'), {
            center: {lat: 37.565598, lng: 126.978031},
            zoom: 13
          });
        var input1 = document.getElementById('pac-input1');
        var autocomplete1 = new google.maps.places.Autocomplete(input1);
        autocomplete1.bindTo('bounds', map1);
        
        map1.controls[google.maps.ControlPosition.TOP_LEFT].push(input1);
        
        var infowindow1 = new google.maps.InfoWindow();
        var infowindowContent1 = document.getElementById('infowindow-content1');
        infowindow1.setContent(infowindowContent1);
        
        var marker1 = new google.maps.Marker({
          map: map1
        });
        marker1.addListener('click', function() {
          infowindow1.open(map1, marker1);
        });
        autocomplete1.addListener('place_changed', function() {
            infowindow1.close();
            var place1 = autocomplete1.getPlace();
            if (!place1.geometry) {
              return;
            }
            
            if (place1.geometry.viewport) {
              map1.fitBounds(place1.geometry.viewport);
            } else {
              map1.setCenter(place1.geometry.location);
              map1.setZoom(17);
            }

            marker1.setPlace({
              placeId: place1.place_id,
              location: place1.geometry.location
            });
            marker1.setVisible(true);

            infowindowContent1.children['place-name1'].textContent = place1.name;
            infowindowContent1.children['place-address1'].textContent = place1.formatted_address;
            infowindow1.open(map1, marker1);
  			
            $("#updateTravelPlaceAjaxData [name=placeName]").val(place1.name);
            $("#updateTravelPlaceAjaxData [name=placeAddress]").val(place1.formatted_address);
          });
      }
</script>
</body>
</html> --%>