<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
$(function(){
    var partnerMenu = document.getElementById("partnerMenu");
    partnerMenu.className='current-menu-item';
});
function selectPay(ele){
	if (ele.value == 'other') {
		$("#partnerPay").attr("readonly", false); 
		updatePartner.partnerPay.value = '';
	} else {
		var partnerPay = document.getElementById("partnerPay");
		updatePartner.partnerPay.value = $("#selpartnerPay option:selected").text();
		$("#partnerPay").attr("readonly", true); 
	}
};
$(function(){
	$('#partnerClass option').each(function(){ //DB에서 가져온 값 select에 출력
		var partnerClass = document.getElementById("partnerClass").value;
		if($(this).val() == partnerClass){
			$(this).attr("selected","selected");
		}
	});
	$('#partnerPers option').each(function(){
		var partnerPers = document.getElementById("partnerPers").value;
		if($(this).val() == partnerPers){
			$(this).attr("selected","selected");
		}
	});
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
<style>
input[type=submit] {
    width: 100%;
    background-color: #f9bf3b;
    color: white;
    padding: 10px 40px;
    margin: 8px auto;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
@font-face {
 font-family: 'NanumSquareRoundEB';
 src: url(resources/fonts/NanumSquareRoundEB.eot);
 src: url(resources/fonts/NanumSquareRoundEB.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundEB.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundEB.ttf) format('truetype');
}
@font-face {
 font-family: 'NanumSquareRoundB';
 src: url(resources/fonts/NanumSquareRoundB.eot);
 src: url(resources/fonts/NanumSquareRoundB.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundB.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundB.ttf) format('truetype');
}
@font-face {
 font-family: 'NanumSquareRoundR';
 src: url(resources/fonts/NanumSquareRoundR.eot);
 src: url(resources/fonts/NanumSquareRoundR.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundR.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundR.ttf) format('truetype');
}
</style>
</head>
<body>
	<section class="about_us_area" id="about">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">여행목적</h2>
						</div>
						<ul class=price-list>
							<li><a href="getPartnerList" style="color: black">전체보기</a></li>
							<li><a
								href="getPartnerList?searchClass=partnerClass&searchKeyword=여행"
								style="color: black">여행</a></li>
							<li><a
								href="getPartnerList?searchClass=partnerClass&searchKeyword=문화"
								style="color: black">문화</a></li>
							<li><a
								href="getPartnerList?searchClass=partnerClass&searchKeyword=맛집"
								style="color: black">맛집</a></li>
							<li><a
								href="getPartnerList?searchClass=partnerClass&searchKeyword=교통"
								style="color: black">교통</a></li>
							<li><a
								href="getPartnerList?searchClass=partnerClass&searchKeyword=숙소"
								style="color: black">숙소</a></li>
						</ul>
						<div class="order-buton" style="padding-bottom: 1px;">
							<a href="${pageContext.request.contextPath}/insertPartnerForm">글쓰기</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6" style="min-width: 700px">
					<form action="./updatePartner" name="updatePartner" method="post">
						<div style="min-height: 450px;">
							<table class="table table-bordered table-striped" style="text-align: center;">
								<thead>
									<tr>
										<th colspan="6" style="background-color: #eeeeee; text-align: center; padding: 10px;">
											<h4 style="font-family: 'NanumSquareRoundB';">동행 게시판 글 수정</h4>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="width:20%">
											<select id="partnerClass" name="partnerClass" class="form-control" style="display:inline" required>
												<option value="" disabled="disabled">카테고리</option>
												<option value="여행">여행</option>
												<option value="문화">문화</option>
												<option value="맛집">맛집</option>
												<option value="교통">교통</option>
												<option value="숙소">숙소</option>
											</select>
										</td>
										<td colspan="5" style="width:80%">
											<input type="text" class="form-control" placeholder="글제목" name="partnerTitle" value="${partner.partnerTitle}" maxlength="50" required>
											<input type="hidden" name="partnerId" value="${partner.partnerId}">
											<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										</td>
									</tr>
									<tr>
										<td colspan="2" style="width:60%">
											<select id="selpartnerPay" class="form-control" style="width:42%; display:inline" onChange="selectPay(this)" required>
												<option value="other">직접입력</option>
												<option value="100,000원대">100,000원대</option>
												<option value="200,000원대">200,000원대</option>
												<option value="300,000원대">300,000원대</option>
												<option value="400,000원대">400,000원대</option>
											</select>
											<input class="form-control" type="text" id="partnerPay" name="partnerPay" value="${partner.partnerPay}" style="width:55%; display:inline" placeholder="비용" required/>
										</td>
										<td colspan="2" style="width:40%">
											<select id="partnerPers" name="partnerPers" class="form-control" required>
												<option value="" disabled="disabled">인원</option>
												<option value="2명">2명</option>
												<option value="3명">3명</option>
												<option value="4명">4명</option>
												<option value="5명">5명</option>
												<option value="단체">단체</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											여행기간 <input type="date" id="partnerStart" name="partnerStart" value="${partner.partnerStart}" class="form-control" style="width:44%; display:inline" required>
											 ~ <input type="date" id="partnerEnd" name="partnerEnd" value="${partner.partnerEnd}" class="form-control" style="width:44%; display:inline" required>
										</td>
									</tr>
									<tr>
										<td colspan="10"><textarea class="form-control" placeholder="글 내용" name="partnerContent" maxlength="2048" style="height: 200px" required>${partner.partnerContent}</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<section>
							<div  style="float: right">
								<input type="submit" value="수정">
							</div>
						</section>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>