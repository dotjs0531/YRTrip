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
		<div class="side-bar" style="width: 25%">
			<a href="#" class="w3-bar-item w3-button">Link 1</a>
			<a href="#" class="w3-bar-item w3-button">Link 2</a>
			<a href="#"	class="w3-bar-item w3-button">Link 3</a>
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
							<td><a href="./getPartner?partnerno=${partner.partnerno}">${partner.partnertitle}</a></td>
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
            		<a href="${pageContext.request.contextPath}/insertPartner">등록</a>
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
	</section>
</body>
</html>