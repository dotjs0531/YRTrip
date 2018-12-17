<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">마이페이지</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="#" style="color:black"><strong>여행정보</strong></a></li>
                            <li><a href="#" style="color:black">좋아요</a></li>
                            <li><a href="#" style="color:black">상품</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="about_car">
            		<h3 style="color:black; text-align:center">${user.userId}</h3><br>
                    	<table class="table table-hover" >
                    		<thead>
                    			<tr>
                    				<th>no.</th>
                    				<th>글제목</th>
                    				<th>사진</th>
                    				<th>작성일</th>
                    				<th>조회수</th>
                    				<th>좋아요수</th>
                    			</tr>
                    		</thead>
                    		<tbody>
							<c:forEach items="${MyTravelList}" var="travel">
								<tr>
									<td>${travel.travelNo}</td>
									<td>${travel.travelTitle}</td>
									<td>${travel.travelPic}</td>
									<td>${travel.travelDate}</td>
									<td>${travel.travelHit}</td>
									<td>${travel.travelLike}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>