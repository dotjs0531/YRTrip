<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
div.container {
	width: 100%;
	border: 1px solid gray;
}

header, footer {
	padding: 1em;
	color: white;
	background-color: black;
	clear: left;
	text-align: center;
}

nav {
	float: left;
	max-width: 160px;
	margin: 0;
	padding: 1em;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>City Gallery</h1>
		</header>
		<nav>
			<tiles:getAsString name="header" />
			<ul>
				<li><a href="./">홈</a></li>
				<li><a href="loginForm">로그인</a></li>
				<li><a href="getBoardList">일반게시판</a></li>
				<li><a href="getUserList">회원목록</a></li>
			</ul>
		</nav>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>