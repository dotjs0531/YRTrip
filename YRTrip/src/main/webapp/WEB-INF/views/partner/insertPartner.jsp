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
                    <form action="./insertNotice" method="post">
			 			<table class="table table-bordered table-striped" style="text-align:center;">
			 				<thead>
								<tr>
									<th colspan="10" style="background-color:#eeeeee; text-align: center;">동행 게시판 글쓰기</th>
								</tr>
			 				</thead>
			 				<tbody>
			 					<tr>
			 						<td colspan="1">글제목 : </td>
			 						<td colspan="9"><input type="text" class="form-control" placeholder="글제목" name="partnertitle" maxlength="50"></td>
			 					</tr>
			 					<tr>
			 						<td colspan="1">카테고리</td>
			 						<td colspan="3"><select name="tinfo_id">
    										<option value="여행">여행</option>
    										<option value="문화">문화</option>
    										<option value="맛집">맛집</option>
    										<option value="교통">교통</option>
    										<option value="숙소">숙소</option></select>
    								</td>
    								<td>비용</td>
    								<td colspan="2"><select name="partnerpay">
    										<option value="100000">100,000</option>
    										<option value="100000">200,000</option>
    										<option value="100000">300,000</option>
    										<option value="100000">400,000</option>
    										<option value="">직접입력\</option>
    								</select>
    								</td>
    								<td>인원</td>
    								<td><select name="partnerpers">
    									<option value="2">2명</option>
    									<option value="2">3명</option>
    									<option value="2">4명</option>
    									<option value="2">5명</option>
    									<option value="단체">단체</option>
    									<option value="직접입력">직접입력</option>    									
    								</select>
			 					</tr>
			 					<tr>
			 						<td>출발일 : </td>
    								<td colspan="4"><input type="date" id="partnerstartdate" name="partnerfinishdate" value=""></td>
    								<td>도착일 : </td>
    								<td colspan="4"><input type="date" id="partnerfinishdate" name="partnerfinishdate" value=""></td>
			 					</tr>
			 					<tr>
			 						<td colspan="10"><textarea class="form-control" placeholder="글 내용" name="partnercontent" maxlength="2048" style="height:200px"></textarea> </td>
			 					</tr>
			 				</tbody>
			 			</table>
                    	<section>
                    		<div class="order-buton" style="padding-top:410px; float:right">
                            	<a href="${pageContext.request.contextPath}/getPartnerList">등록</a>
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