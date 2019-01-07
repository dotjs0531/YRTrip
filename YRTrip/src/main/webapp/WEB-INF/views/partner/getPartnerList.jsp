<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 라디오버튼 -->
<link href="resources/css/icheck-bootstrap.css" rel="stylesheet">

<style>
a { text-decoration:none !important; }
a:hover { color:white }
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
$(function(){
    var partnerMenu = document.getElementById("partnerMenu");
    partnerMenu.className='current-menu-item';
});
   function go_sort(sortCol) {
      document.frm.sortCol.value = sortCol;
      document.frm.submit();
   }
   function go_page(page) {
      document.frm.page.value = page;
      document.frm.submit();
   }
jQuery( document ).ready(function( $ ) {
	if("${sessionScope.login.userId}" == ''){
		$(".insertPartner").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
		});
		$(".goToUserPage").click(function(e){
			e.preventDefault();
			alert("로그인이 필요한 서비스입니다");
	});
	}
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
                     <h2 style="color: black">동행구하기</h2>
                  </div>
                  <ul class=price-list>
                     <li><a href="getPartnerList" style="color: black">전체보기</a></li>
                     <li><a href="getPartnerList?partnerClass=여행" style="color: black">여행</a></li>
                     <li><a href="getPartnerList?partnerClass=문화" style="color: black">문화</a></li>
                     <li><a href="getPartnerList?partnerClass=맛집" style="color: black">맛집</a></li>
                     <li><a href="getPartnerList?partnerClass=교통" style="color: black">교통</a></li>
                     <li><a href="getPartnerList?partnerClass=숙소" style="color: black">숙소</a></li>
                  </ul>
                  <div class="order-buton" style="padding-bottom: 1px;">
                     <a href="${pageContext.request.contextPath}/insertPartnerForm" class="insertPartner">글쓰기</a>
                  </div>
               </div>
            </div>

            <div class="col-sm-6" style="min-width: 700px">
               <div class="table-responsive" style="min-height: 450px;">
               
				<!-- 검색 창 & 페이징 처리 -->
				<form class="form-inline">
					<div class="form-group single-pricing-table" style="width:670px; text-align:left; padding: 20px; color:black;">
						
						<!-- 여행지 -->
						<div style="padding-bottom:10px">
						
							<div class="radio icheck-primary">
								<input type="radio" id="domestic" name="searchCheck" checked="checked" value="domestic">
								<label for="domestic">국내</label>
							</div>
							<div style="margin-right:10px" class="radio icheck-primary">
								&nbsp;<input type="radio" id="overseas" name="searchCheck" value="overseas">
								<label for="overseas">해외</label>
							</div>
							
							<select id="partnerClass" name="partnerClass" class="form-control" style="display:inline; width:18%; margin-right:10px">
								<option value="" disabled="disabled" selected>카테고리</option>
								<option value="여행">여행</option>
								<option value="문화">문화</option>
								<option value="맛집">맛집</option>
								<option value="교통">교통</option>
								<option value="숙소">숙소</option>
							</select>
							
							<input type="text" class="form-control" id="autocompleteTinfoList" placeholder="떠나고 싶은 여행지를 검색해주세요." autocomplete="on" name="searchTinfoListbox" style="width:43%;">
							<input type="hidden" class="form-control" id="tinfoListDisp" name="searchTinfo">
							
						</div>
						
						<!-- <div style="padding-bottom:5px; padding-left:17%;">
							<input type="radio" id="domestic" name="searchCheck" checked="checked" value="domestic">
							<label for="domestic">국내</label>
							<input type="radio" id="overseas" name="searchCheck" value="overseas">
							<label for="overseas">해외</label>
						</div>
						<div style="padding-bottom:5px">
							<label class="col-sm-2 control-label">장소명</label>
							<input type="text" class="form-control" id="autocompleteTinfoList" placeholder="떠나고 싶은 여행지를 검색해주세요." autocomplete="on" style="width:350px;" name="searchTinfoListbox">
							<input type="hidden" class="form-control" id="tinfoListDisp" name="searchTinfo">
						</div> -->
						
						<!-- 여행기간 -->
						<div style="padding-bottom:5px">
							<label style="padding-right:10px">출발일</label>
							<input type="date" name="searchPartnerStart" class="form-control" style="margin-right:10px; width:32%">
							<label style="padding-right:10px">도착일</label>
							<input type="date" name="searchPartnerEnd" class="form-control" style="width:32%">
						
							<button class="btn btn-warning signupbtn" style="float:right; margin-right:10px">검색</button>
						</div> 
					</div>
					
					<input type="hidden" name="page" />
				</form>
						<p style="clear:both">
						
                  <!-- 동행 게시판 리스트 -->
                  <table class="table table-hover">
                     <!-- 동행구하기 테이블 헤더부분 -->
                     <thead>
                        <tr>
                           <th>no.</th>
                           <th style="text-align:center">글제목</th>
                           <th>작성자</th>
                           <th style="text-align:center">작성일</th>
                           <th style="text-align:center">조회수</th>
                           <th style="text-align:center">진행상태</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${partnerList}" var="partner">
                           <tr>
                              <td>${partner.partnerId}</td>
                              <td><a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; 
									overflow: hidden; width:380px; vertical-align:middle" href="./getPartner?partnerId=${partner.partnerId}">${partner.partnerTitle}
									<c:if test="${partner.joinerCnt != '0'}"> [${partner.joinerCnt}]</c:if></a></td>
                              <td style="color:black;"><c:if test="${sessionScope.login.userId eq partner.userId}">${partner.userName}</c:if>
                                  <c:if test="${sessionScope.login.userId ne partner.userId}"><a style="color:black;" href="./getYourTravelList?userId=${partner.userId}" class="goToUserPage">${partner.userName}</a></c:if>
                              </td>
                              <td style="text-align:center">${partner.partnerDate}
                              <td style="text-align:center">${partner.partnerHit}</td>
                              <td style="text-align:center">${partner.partnerCondition}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
               <p style="clear: both">
               
               <!-- 페이지 번호 -->
               <div style="padding-top: 50px;">
                  <my:paging paging="${paging}" jsFunc="go_page" />
               </div>
            </div>
         </div>
      </div>
   </section>
</body>
</html>