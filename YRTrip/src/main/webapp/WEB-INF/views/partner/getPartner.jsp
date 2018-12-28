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
	function JoinerView(joiner) {
		var div = $("<div class='form-group'>"); 
		div.attr("id", "c" + joiner.joinerId);
		div.addClass('joiner');
		div.joiner = joiner; //{id:1,.... }
		
		var userId =  '${sessionScope.login.userId}';
		console.log(userId);
		var partnerId = '${partner.userId}';
		
		if(userId == joiner.userId){
		var str = "<strong class='joinerName'>동행 신청자 : " + joiner.userId
				+ "</strong>   " + "<span class='joinerDate'>신청일 : "
				+ joiner.joinerDate + "</span>"
				+ "<button type=\"button\" class=\"btnDel\">신청취소</button>"			
		}else if(userId == partnerId){
			if(joiner.joinerCondition == 'N'){
				var str = "<strong class='joinerName'>동행 신청자 : " + joiner.userId
				+ "</strong>   " + "<span class='joinerDate'>신청일 : " + joiner.joinerDate + "</span>"
				+ "<span class='joinerCondition'> 현재상태 : " + joiner.joinerCondition + "</span>"
				+  "<button type=\"button\" class=\"btnChange\">수락 하기</button>"
			}else{
				var str = "<strong class='joinerName'>동행 신청자 : " + joiner.userId
				+ "</strong>   " + "<span class='joinerDate'>신청일 : "
				+ joiner.joinerDate + "</span>"
				+  "<button type=\"button\" class=\"btnChange\">수락 취소</button>"
			}
		}else{
			var str = "<strong class='joinerName'>동행 신청자 : " + joiner.userId
			+ "</strong>   " + "<span class='joinerDate'>신청일 : "
			+ joiner.joinerDate + "</span>"
		}
		div.html(str);
		return div;
	}
	
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
		
		//동행 신청 등록처리
		$("#btnAdd").click(function() {
			var partnerId = '${partner.userId}';
			var userId =  '${sessionScope.login.userId}';
			
			if(userId==partnerId ){
				alert("글쓴이는 동행 신청을 할 수 없습니다.")
			} else{
			var params = $("#addForm").serialize();
			$.getJSON("insertJoiner", params, function(datas) {
				var div = JoinerView(datas);
				$(div).prependTo("#joinerList");
			});
		}
			
			
		}); //end btnAdd clcic event
		
		//동행 신청 취소처리
		$("#joinerList").on("click", ".btnDel", function() {
			var joinerId = $(this).parent().attr("id").substr(1);
			if (confirm("신청취소?")) {
				var params = "joinerId=" + joinerId; 
				var url = "deleteJoiner";
				$.getJSON(url, params, function(datas) {
					$('#c' + datas.joinerId).remove();
				});
			}
		});
		//동행 신청 수락 처리
		$("#joinerList").on("click", ".btnChange", function(){
			console.log(this);
			
			
			console.log(a);
			
			$.ajax({
				url: "/closeJoiner",
				
				type: "POST",
				
				data: {Condition :"" },
				
				success: function(data){
					console.log(data);
					data = JSON.toString(data);
		            var a = date
		            var a = data
		            if($(this).attr('data-click-state') == 1) {
		    			$(this).attr('data-click-state', 0)
		    			$(this).css('background-color', 'red')
		    		} else {
		    			$(this).attr('data-click-state', 1)
		    			$(this).css('background-color', 'orange')
		    		}
				}
				});
			});
		});

	function del(partnerid) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "./deletePartner?partnerId=" + partnerId;
		} else {
			return;
		}
	};
</script>
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
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=여행&page=" style="color: black">여행</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=문화&page=" style="color: black">문화</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=맛집&page=" style="color: black">맛집</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=교통&page=" style="color: black">교통</a></li>
							<li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=숙소&page=" style="color: black">숙소</a></li>
						</ul>
					</div>
				</div>
				<div class=" col-sm-6" style="min-width: 700px">
					<div class="table-responsive" style="min-height: 450px;">
						<p style="clear: both">
						<table class="table table-hover">
							<thead>
								<tr>
									<th colspan="10" style="background-color: #eeeeee; text-align: center;">동행 게시판 글쓰기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="text-align: left;" colspan="11">카테고리 > ${partner.partnerClass}</td>
								</tr>
								<tr>
									<td colspan="1">No.${partner.partnerId}</td>
									<td colspan="3">글제목 : ${partner.partnerTitle}</td>
									<td colspan="3">${partner.userId}</td>
									<td colspan="3">${partner.partnerDate}</td>
								</tr>
								<tr>
									<td colspan="2">여행지 : 일단보류</td>
									<td colspan="4">비용 : ${partner.partnerPay}</td>
									<td colspan="4">인원 : ${partner.partnerPers}</td>
								</tr>
								<tr>
									<td colspan="2">출발일 : ${partner.partnerStart}</td>
									<td colspan="8">도착일 : ${partner.partnerEnd}</td>
								</tr>
								<tr>
									<td colspan="10" style="min-height:200px;">${partner.partnerContent}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<c:if test="${sessionScope.login.userId eq partner.userId}">
							<div class="order-buton" style="float: right">
								<c:if test="${partner.partnerCondition eq '완료'}">
									<a href="./updatePartnerForm?partnerId=${partner.partnerId}">수정</a>
									<button class="submit-btn" onclick="del('${partner.partnerId}')">삭제</button>
									<a href="${pageContext.request.contextPath}/getPartnerList">뒤로가기</a>
								</c:if>
								<c:if test="${partner.partnerCondition eq '미완료'}">
								<a href="./closePartner?partnerId=${partner.partnerId}">완료하기</a>
									<a href="./updatePartnerForm?partnerId=${partner.partnerId}">수정</a>
									<button class="submit-btn" onclick="del('${partner.partnerId}')">삭제</button>
									<a href="${pageContext.request.contextPath}/getPartnerList">뒤로가기</a>
								</c:if>
							</div>
					</c:if>
						<hr/><br/>
						<!-- 동행 신청  -->
						<h5>동행 신청 리스트</h5><br/>
						<div class="about_car" id="joinerList" style="min-height:100px;">
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
						<br/>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>