<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YOUR REAL TRIP:-)</title>
    <!--  bootstrap css -->
    <link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css">
    <!--  font Awesome Css  -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Reset css-->
    <link href="resources/css/reset.css" rel="stylesheet">
    <!--  style css  -->
    <link href="resources/style.css" rel="stylesheet">
	<!-- CSS -->
    <!-- <link rel="stylesheet" href="resources/assets/css/style.css"> -->
</head>
<body class="js">
<div id="wrapper">
		<header>
		<tiles:insertAttribute name="header" />
		</header>
		<article>
		<tiles:insertAttribute name="content" />
		</article>
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
</div>
</body>

</html>
