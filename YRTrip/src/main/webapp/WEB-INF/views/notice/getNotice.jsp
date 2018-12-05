<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

</head>
<body>
    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">고객센터</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="notice.tiles" style="color:black">공지사항</a></li>
                            <li><a href="qna_admin.tiles" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-offset-1 col-sm-6">
                    <div class="about_car">
                    	<br/>
						<h3 style="color:black"></h3>
						<br/>
						<strong>작성자</strong>&nbsp;&nbsp; ｜ <strong>작성일</strong>&nbsp;&nbsp; ｜ <strong>조회수</strong>&nbsp;&nbsp;
						<hr />
							<c:forEach items="${notice_list}" var="dto">
								<tr>
									<td>${dto.nid}</td>
									<td>${dto.ntitle}</td>
									<td>${dto.uid}</td>
									<td>${dto.ndate}</td>
									<td>${dto.nhit}</td>
								</tr>
							</c:forEach>
                        <div class="order-buton" style="padding-top:50px; float:right">
                            <a href="#">수정</a>&nbsp;&nbsp;<a href="#">삭제</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>