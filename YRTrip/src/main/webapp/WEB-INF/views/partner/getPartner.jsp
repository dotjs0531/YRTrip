<%@page import="com.yrtrip.app.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 카카오톡 공유하기 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>KakaoLink v2 Demo(Default / List) - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>동행 게시판 글쓰기</title>
<script>
function del(partnerId) {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "./deletePartner?partnerId=" + partnerId;
	} else {
		return;
	}
};
function close(partnerId) {
	if (confirm("완료하시겠습니까?")) {
		location.href = "./closePartner?partnerId=" + partnerId;
	} else {
		return;
	}
};
	$(function() {
		//동행 신청 목록 조회	
		loadJoinerList();
 		var apply = document.getElementById("btnAdd");		
 		
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
			var partnerId = '${partner.userId}';
			var pCondition = '${partner.partnerCondition}';
			
			if(userId == joiner.userId){	//동행 신청자
				if(joiner.joinerCondition == 'N'){
					var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#919191'>" + joiner.userName + "("+joiner.userGen+")</label>"
							+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px;  color:#919191'>" + joiner.joinerDate + "</span>"
							+ "<button type=\"button\" class=\"btn btn-default btn-sm btnDel\">취소</button>";
				}else{
					var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#009933'>" + joiner.userName + "("+joiner.userGen+")</label>"
					+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#009933'>" + joiner.joinerDate + "</span>"
					+ "<button type=\"button\" class=\"btn btn-default btn-sm btnDel\">취소</button>";
				}
            	apply.style.display="none";
			}else if(userId == partnerId){	//동행글 작성자
				if(pCondition == '미완료'){
					if(joiner.joinerCondition == 'N'){	//동행 수락 전
						var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#919191'>"
							+ "<a style='color:#919191' href='./getYourTravelList?userId="+joiner.userId+"'>" + joiner.userName + "</a>("+joiner.userGen+")</label>"
							+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#919191'>" + joiner.joinerDate + "</span>"
							+ "<button type=\"button\" class=\"btn btn btn-success btn-sm btnAccept\" id="+joiner.joinerId+">수락 </button>"
					}else{	//동행 수락 후
							var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#009933'>"
							+ "<a style='color:#009933' href='./getYourTravelList?userId="+joiner.userId+"'>" + joiner.userName + "</a>("+joiner.userGen+")</label>"
							+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#009933'>" + joiner.joinerDate + "</span>"
							+ "<button type=\"button\" class=\"btn btn-default btn-sm btnCancle\" id="+joiner.joinerId+">취소</button>"
					}
				}else if(pCondition == '완료'){
					if(joiner.joinerCondition == 'N'){
						var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#919191'>"
							+ "<a style='color:#919191' href='./getYourTravelList?userId="+joiner.userId+"'>" + joiner.userName + "</a>("+joiner.userGen+")</label>"
							+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#919191'>" + joiner.joinerDate + "</span>"
					}else{
						var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#009933'>"
							+ "<a style='color:#009933' href='./getYourTravelList?userId="+joiner.userId+"'>" + joiner.userName + "</a>("+joiner.userGen+")</label>"
							+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#009933'>" + joiner.joinerDate + "</span>"
					}
				}
			}else{	//동행 신청을 하지 않은 사용자
				if(joiner.joinerCondition == 'N'){
					var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#919191'>"
					+ "<a style='color:#919191' href='./getYourTravelList?userId="+joiner.userId+"'>" + joiner.userName + "</a>("+joiner.userGen+")</label>"
					+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#919191'>" + joiner.joinerDate + "</span>"
				}else{
					var str = "<label class='col-sm-3 control-label joinerName' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; color:#009933'>"
						+ "<a style='color:#009933' href='./getYourTravelList?userId="+joiner.userId+"'>" + joiner.userName + "</a>("+joiner.userGen+")</label>"
						+ "<span class='joinerDate' style='font-family: \"NanumSquareRoundR\"; font-size: 15px; padding-right:20px; color:#009933'>" + joiner.joinerDate + "</span>"
				}
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
					$(div).appendTo("#joinerList");
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
					apply.style.display="block";
				});
			};
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
						<h5 class="control-label" style="font-family: 'NanumSquareRoundR'; display: inline; float:right">
							<strong>작성자</strong>&nbsp;&nbsp;
								<c:if test="${sessionScope.login.userId eq partner.userId}">${partner.userName}(${partner.userGen})</c:if>
								<c:if test="${sessionScope.login.userId ne partner.userId}"><a style='color:#919191' href='./getYourTravelList?userId=${partner.userId}'>${partner.userName}</a>(${partner.userGen})</c:if>
							<strong> ｜ 조회수</strong>&nbsp;&nbsp;${partner.partnerHit}
							<strong> ｜ 작성일</strong>&nbsp;&nbsp;${partner.partnerDate}</h5>
						<p style="clear:both"/><br/>
						<h3 class="control-label" style="font-family: 'NanumSquareRoundEB'; color:#666666; display: inline; float:left">${partner.partnerTitle}</h3>
						
						<!-- 카톡 공유하기 버튼 -->
						<a id="kakao-link-btn" href="javascript:;" style="float:right; color:#f9bf3b;">
							<i class="fas fa-comment"></i>
						</a>
						
						<p style="clear:both"/>
						<hr />
						
               			<table style="width:100%">
							<tr>
								<td style="width:33%">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>여행지 : </strong>
										<c:if test="${partner.tinfoCountry ne null}">${partner.tinfoCountry}</c:if><c:if test="${partner.tinfoState ne null}"> ${partner.tinfoState}</c:if> ${partner.tinfoCity}
									</h5>
								</td>
								<td style="width:33%">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>경비 : </strong>${partner.partnerPay}</h5>
								</td>
								<td style="width:33%">
									<h5 class="control-label" style="font-family: 'NanumSquareRoundR';"><strong>인원 : </strong>${partner.partnerPers}</h5>
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
									<button class="btn btn-success" onclick="close('${partner.partnerId}')">완료하기</button>
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
<script type='text/javascript'>
  //<![CDATA[
	  
	// // 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('4115609fb50877ceef895d9a2db54237');
	// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	Kakao.Link.createDefaultButton({
		container : '#kakao-link-btn',
		objectType : 'feed',
		content : {
			title : '${partner.partnerTitle}',
			description : '${partner.partnerContent}',
			imageUrl: 'https://postfiles.pstatic.net/MjAxODEyMjlfNiAg/MDAxNTQ2MDE0ODM1ODk5.VlG0P4NPq3mfRH0WkShxFV1TQFTrxJzDCSrkglA9g-kg.ClRMBKh_OXXzAFp7xDzEwlTzFCH1sb0ZCrFiOLMCDcMg.PNG.dotjs0531/%EB%8F%84%EC%8B%9C+%EB%B0%94%ED%83%95%ED%99%94%EB%A9%B4+(1).png?type=w773',
			link : {
				mobileWebUrl : document.location.href,
				webUrl : document.location.href
			}
		},
		social : {
			//likeCount : 286,  //좋아요수(여행정보, 여행지, 상품)
			commentCount : Number('${joinerCnt}'),  //댓글수(동행글)
			viewCount  : Number('${partner.partnerHit}')  //조회수(여행정보, 여행지, 동행글)
		},
		buttons : [ {
			title : '웹으로 보기',
			link : {
				mobileWebUrl : document.location.href,
				webUrl : document.location.href
			}
		} ]
	});
	//]]>
</script>
</body>
</html>