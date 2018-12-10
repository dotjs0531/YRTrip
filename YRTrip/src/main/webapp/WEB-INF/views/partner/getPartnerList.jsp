<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- 동행게시판 메뉴 목록-->
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
					<table class="table table-hover">
						<!-- 동행구하기 테이블 헤더부분 -->
						<thead>
							<tr>
								<th>글제목</th>
								<th>글쓴이</th>
								<th>문화</th>
								<th>게시일</th>
								<th>여행경비</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${partnerList}" var="partner">
								<tr>
									<td>${partner.partnerid}</td>
									<td><a href="./getPartner?partnerid=${partner.partnerid}">${partner.partnertitle}</a></td>
									<td>${partner.userid}</td>
									<td>${partner.partnerclass}</td>
									<td>${partner.partnerdate}<!-- 여행 경비 넣는 부분 -->
									<td>${partner.partnerpay}</td>
									<td class="tbl-apply"><a href="#">${partner.partnercondition}</a></td>
								</tr>
								<!-- 페이징처리 -->
								<!-- 숨긴 페이징 부분 hide jobs -->
							</c:forEach>
						</tbody>
					</table>
					<section>
							<div class="order-buton" style="padding-top:410px; float:right">
            				<a href="${pageContext.request.contextPath}/insertPartnerForm">글쓰기</a>
            			</div>
        			</section>
        			<div class="text-center" style="padding-top:460px;">
            			<ul class="pagination">
                			<li><a href="#">1</a></li>
                    		<li><a href="#">2</a></li>
                    		<li><a href="#">3</a></li>
                    		<li><a href="#">4</a></li>
                    		<li><a href="#">5</a></li>
                		</ul>
            		</div>
				</div>
			</div>
    	</div>
	</section>
</body>
</html>