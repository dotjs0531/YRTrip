<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 리스트</title>
<script>
//스타일시트 추가
</script>
</head>
<body>
	<!-- 동행 게시판 테이블 부분 -->
	 <section class="about_us_area" id="about">
	 <div class="container">
		<div class="row page-title text-center wow bounce" data-wow-delay="1s">
			<h2>동행 게시판</h2>
		</div>
		<div class="col-md-offset-1 col-sm-6">
			<table class="type01">
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
							<td><a href="./getPartner?partnerno=${partner.partnerno}">${partner.partnertitle}</a></td>
							<td>${partner.userid}</td>
							<td>${partner.partnerclass}</td>
							<td>${partner.partnerdate}
							<!-- 여행 경비 넣는 부분 -->
							<td>${partner.partnerpay}</td>
							<td class="tbl-apply" ><a href="#">${partner.partnercondition}</a></td>
						</tr>
						<!-- 페이징처리 -->
						<!-- 숨긴 페이징 부분 hide jobs -->
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</section>
</body>
</html>