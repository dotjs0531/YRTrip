<%@page import="com.yrtrip.app.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
<script>
	$(function() {
		//동행 신청 목록 조회	
		loadJoinerList();
		
		function loadJoinerList() {
			var params = { partnerId : '${partner.partnerId}'};
			console.log(params);
			$.getJSON("getJoinerList", params, function(datas) {
				for (i = 0; i < datas.length; i++) {
					var div = JoinerView(datas[i]);
					$(div).appendTo("#joinerList");
				}
			});
		}	// 신청 리스트 조회 끝.
		
		function JoinerView(joiner) {
			var div = $("<div class='form-group'>"); 
			div.attr("id", "c" + joiner.joinerId);
			div.addClass('joiner');
			div.joiner = joiner; //{id:1,.... }
			
			var userId =  '${sessionScope.login.userId}';
			console.log(userId);
			var partnerId = '${partner.userId}';
			
			if(userId == joiner.userId){	//동행 신청자
				var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px'>" + joiner.userId + "</label>"
						+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px'>" + joiner.joinerDate + "</span>"
						+ "<button type=\"button\" class=\"btn btn-default btnDel\">신청취소</button>"			
			}else if(userId == partnerId){	//동행글 작성자
				if(joiner.joinerCondition == 'N'){	//동행 수락 전
					var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px'>" + joiner.userId + "</label>"
					+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px'>" + joiner.joinerDate + "</span>"
					+ "<button type=\"button\" class=\"btn btn-default btnAccept\" id="+joiner.joinerId+">수락 하기</button>"
				}else{	//동행 수락 후
					var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px'>" + joiner.userId + "</label>"
					+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px'>" + joiner.joinerDate + "</span>"
					+ "<button type=\"button\" class=\"btn btn-default btnCancle\" id="+joiner.joinerId+">수락 취소</button>"
				}
			}else{	//동행 신청을 하지 않은 사용자
				var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px'>" + joiner.userId + "</label>"
				+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px'>" + joiner.joinerDate + "</span>"
			}
			div.html(str);
			return div;
		}
		
		//동행 신청(신청자)
		$("#btnAdd").click(function() {
			var partnerId = '${partner.userId}';
			var userId =  '${sessionScope.login.userId}';
			
			if(userId==partnerId){
				alert("글쓴이는 동행 신청을 할 수 없습니다.")
			} else{
				var params = $("#addForm").serialize();
				$.getJSON("insertJoiner", params, function(datas) {
					var div = JoinerView(datas);
					$(div).prependTo("#joinerList");
				});
			}
		}); //end btnAdd clcic event
		
		//동행 신청 취소(신청자)
		$("#joinerList").on("click", ".btnDel", function() {
			var joinerId = $(this).parent().attr("id").substr(1);
			if (confirm("신청 취소하시겠습니까?")) {
				var params = "joinerId=" + joinerId; 
				var url = "deleteJoiner";
				$.getJSON(url, params, function(datas) {
					$('#c' + datas.joinerId).remove();
				});
			}
		});
		
		//동행 신청 수락하기(작성자)
		$("#joinerList").on("click", ".btnAccept", function() {
			var joinerId = $(this).parent().attr("id").substr(1);
			var param = "joinerId=" + joinerId; 
			
			$.getJSON("acceptJoiner", param, function(datas) {
				/* var newDiv = JoinerView(datas);
				var oldDiv = $("#c"+data.joinerId);
				$(newDiv).replaceAll(oldDiv);  // 수정된 DIV를 교체 */
				$('#joinerList').empty();
				loadJoinerList();
			});
		}); //end btnAdd clcic event
		
		//동행 신청 수락취소(작성자)
		$("#joinerList").on("click", ".btnCancle", function() {
			var joinerId = $(this).parent().attr("id").substr(1);
			var param = "joinerId=" + joinerId; 
			
			$.getJSON("cancleJoiner", param, function(data){
				/* var newDiv = JoinerView(datas);
				var oldDiv = $("#c"+data.joinerId);
				$(newDiv).replaceAll(oldDiv);  // 수정된 DIV를 교체 */
				$('#joinerList').empty();
				loadJoinerList();
			});
		});

	function del(partnerId) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "./deletePartner?partnerId=" + partnerId;
		} else {
			return;
		}
	};
});
</script>
<style>
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
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=여행" style="color: black">여행</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=문화" style="color: black">문화</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=맛집" style="color: black">맛집</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=교통" style="color: black">교통</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=숙소" style="color: black">숙소</a></li>
						</ul>
						<div class="order-buton" style="padding-bottom: 1px;">
							<a href="${pageContext.request.contextPath}/insertPartnerForm">글쓰기</a>
						</div>
					</div>
				</div>
				<div class=" col-sm-6 table-responsive" style="min-width: 700px;">
					<div class="about_car" style="padding-top:20px; min-height: 450px;">
						<h4 class="control-label" style="font-family: 'NanumSquareRoundEB'; color:black; display: inline; float:left"><strong>카테고리></strong></h4>
						<h4 class="control-label" style="font-family: 'NanumSquareRoundB'; color:black; display: inline; float:left">&nbsp;${partner.partnerClass}</h4>
						<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:right"><strong>작성자</strong>&nbsp;&nbsp;${partner.userId} ｜ <strong>조회수</strong>&nbsp;&nbsp;${partner.partnerHit} ｜ <strong>작성일</strong>&nbsp;&nbsp;${partner.partnerDate}</h5>
						<p style="clear:both"/><br/>
						<h3 class="control-label" style="font-family: 'NanumSquareRoundEB'; color:#666666; display: inline; float:left">${partner.partnerTitle}</h3>
						<p style="clear:both"/>
						<hr />
						
               			<table style="width:100%">
							<tr>
								<td style="width:33%">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>여행지 : </strong>일단보류</h5>
								</td>
								<td style="width:33%">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>경비 : </strong>${partner.partnerPay}</h5>
								</td>
								<td style="width:33%">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>인원 : </strong>${partner.partnerPers}명</h5>
								</td>
							</tr>
							<tr>
								<td colspan="1" style="text-align:left; padding:10px 0">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>출발일 : </strong>${partner.partnerStart}</h5>
								</td>
								<td colspan="2" style="text-align:left; padding:10px 0">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>도착일 : </strong>${partner.partnerEnd}</h5>
								</td>
							</tr>
						</table>
						
						<pre style="background-color:white; border-style: none; font-family: 'NanumSquareRoundR'; font-size: 16px; color: #666666; white-space: pre-wrap;">${partner.partnerContent}</pre>
	                </div>
	                
	                <c:if test="${not empty sessionScope.login.userId}">
	                	<c:if test="${sessionScope.login.userId ne partner.userId}">
							<div id="joinerAdd" class="order-buton" style="float: right">
								<form name="addForm" id="addForm">
									<c:if test="${sessionScope.login.userId != partner.userId}">
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="partnerId" value="${partner.partnerId}">
										<input type="hidden" id="joinerCondition" name="joinerCondition" value="Y">
										<br />
										<button type="button" class="btn btn-default" id="btnAdd">신청</button>
									</c:if>
								</form>
							</div>
							<p style="clear:both">
						</c:if>
						
						<c:if test="${sessionScope.login.userId eq partner.userId}">
							<div class="order-buton" style="float: right">
							<c:choose>
								<c:when test="${partner.partnerCondition eq '완료'}">
									<button class="btn btn-default" onclick="location.href='./updatePartnerForm?partnerId=${partner.partnerId}'">수정</button>
									<button class="btn btn-default" onclick="del('${partner.partnerId}')">삭제</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-default" onclick="location.href='./closePartner?partnerId=${partner.partnerId}'">완료하기</button>
									<button class="btn btn-default" onclick="location.href='./updatePartnerForm?partnerId=${partner.partnerId}'">수정</button>
									<button class="btn btn-default" onclick="del('${partner.partnerId}')">삭제</button>
								</c:otherwise>
							</c:choose>
							</div>
							<p style="clear:both">
						</c:if>
					</c:if>
					<hr/>
					
					<!-- 동행 신청  -->
					<h4 class="control-label" style="font-family: 'NanumSquareRoundB'; color: #666666;">동행 신청 리스트</h4><br/>
					<div class="about_car" id="joinerList" style="min-height:100px;">
					</div>
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>