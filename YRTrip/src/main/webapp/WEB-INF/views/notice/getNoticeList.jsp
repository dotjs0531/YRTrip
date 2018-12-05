<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%! int nid, nhit; String ntitle, uid, ndate; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Custom styles for this template -->
    <link href="resources/css/shop-homepage.css" rel="stylesheet">

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
                            <li><a href="getNoticeList" style="color:black">공지사항</a></li>
                            <li><a href="qna" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-offset-1 col-sm-6">
                    	<table class="table table-hover">
                    		<thead>
                    			<tr>
                    				<th>no.</th>
                    				<th>글제목</th>
                    				<th>작성자</th>
                    				<th>작성일</th>
                    				<th>조회수</th>
                    			</tr>
                    		</thead>
                    		<tbody>
							<c:forEach items="${noticeList}" var="notice">
								<tr>
									<td>${notice.nid}</td>
									<td><a href="./getNotice?nid=${notice.nid}">${notice.ntitle}</a></td>
									<td>${notice.uid}</td>
									<td>${notice.ndate}</td>
									<td>${notice.nhit}</td>
								</tr>
							</c:forEach>
                    		</tbody>
                    	</table>
                    	<section >
                        <div class="order-buton" style="padding-top:410px; float:right">
                            <a href="insertNotice">등록</a>
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
    <!--   end of about us area-->
</body>
</html>