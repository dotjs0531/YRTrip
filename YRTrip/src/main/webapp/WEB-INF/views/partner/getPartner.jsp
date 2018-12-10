<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
<script>
function del(partnerid){
    if(confirm("삭제하시겠습니까?")){
       location.href = "./deletePartner?partnerid=" + partnerid;
    } else { return; }
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
							<li><a href="*" style="color: black">여행</a></li>
							<li><a href="*" style="color: black">문화</a></li>
							<li><a href="*" style="color: black">맛집</a></li>
							<li><a href="*" style="color: black">교통</a></li>
							<li><a href="*" style="color: black">숙소</a></li>
						</ul>
					</div>
				</div>
                <div class="col-md-offset-1 col-sm-6">
			 			<table class="table table-bordered table-striped" style="text-align:center;">
			 				<thead>
								<tr>
									<th colspan="10" style="background-color:#eeeeee; text-align: center;">동행 게시판 글쓰기</th>
								</tr>
			 				</thead>
			 				<tbody>
			 					<tr>
			 						<td style="text-align : left;" colspan="11">카테고리 > ${partner.partnerclass}</td>
			 					</tr>
			 					<tr>
			 						<td colspan="1">No.${partner.partnerid}</td>
			 						<td colspan="3">${partner.partnertitle}</td>
			 						<td colspan="3">${partner.userid}</td>
			 						<td colspan="3">${partner.partnerdate}</td>
			 					</tr>
			 					<tr>
			 						<td colspan="2">여행지 : 일단보류</td>
			 						<td colspan="4">비용 : ${partner.partnerpay}</td>
			 						<td colspan="4">인원 : ${partner.partnerpers}</td>
			 					</tr>
			 					<tr>
			 						<td colspan="2">출발일 : ${partner.partnerstart}</td>
    								<td colspan="8">도착일 : ${partner.partnerend}</td>
			 					</tr>
			 					<tr>
			 						<td colspan="10">${partner.partnercontent}</td>
			 					</tr>
			 				</tbody>
			 			</table>
                    	<section>
                    		<div class="order-buton" style="padding-top:410px; float:right">
                    			<a href="./updatePartnerForm?partnerid=${partner.partnerid}">수정</a>&nbsp;&nbsp;
                    			<button class="submit-btn" onclick="del('${partner.partnerid}')">삭제</button>
                            	<a href="${pageContext.request.contextPath}/getPartnerList">뒤로가기</a>
                        	</div>
                    	</section>
				</div>
			</div>
		</div>
	</section>
</body>
</html>