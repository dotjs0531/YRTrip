<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
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
			 					<h3></h3>
								<tr>
									<th colspan="10" style="background-color:#eeeeee; text-align: center;">동행 게시판 글쓰기</th>
								</tr>
			 				</thead>
			 				<tbody>
			 					<tr>
			 						<td colspan="9">글제목 : ${partner.partnertitle}</td>
			 						<td>현재 상태 : ${partner.partnercondition}	</td>
			 					</tr>
			 					<tr>
			 						<td>글쓴이 : ${partner.userid}</td>
			 					</tr>
			 					<tr>
			 						<td colspan="1">카테고리></td>
			 						<td colspan="3">${partner.partnerclass}</td>
    								<td>비용</td>
    								<td colspan="2">
    								<td>${partner.partnerpay}
    								</td>
    								<td>인원</td>
    								<td>${partner.partnerperson}
			 					</tr>
			 					<tr>
			 						<td>출발일 : </td>
    								<td colspan="4">${partner.partnerstartdate}</td>
    								<td>도착일 : </td>
    								<td colspan="4">${partner.partnerfinishdate}</td>
			 					</tr>
			 					<tr>
			 						<td colspan="10">${partner.partnercontent}</td>
			 					</tr>
			 				</tbody>
			 			</table>
                    	<section>
                    		<div class="order-buton" style="padding-top:410px; float:right">
                            	<button class="submit-btn">등록</button>
                            	<a href="${pageContext.request.contextPath}/getPartnerList">취소</a>
                        	</div>
                    	</section>
                    </form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>