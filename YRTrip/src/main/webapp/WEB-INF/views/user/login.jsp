<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<section class="about_us_area" id="about">
		<div class="container">
			<div class="row">
				<c:if test="${empty sessionScope.login}">
					<a href="loginForm">로그인</a>
				</c:if>
				<c:if test="${not empty sessionScope.login}">
					${sessionScope.login.userId}님 <a href="logout">로그아웃</a>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>