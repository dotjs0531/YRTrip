<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
input[type=submit] {
    width: 100%;
    background-color: #f9bf3b;
    color: white;
    padding: 10px 40px;
    margin: 8px auto;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
</style>
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
                            <li><a href="getQnaList" style="color:black"><strong>1:1 문의</strong></a></li>
                        </ul>
                        <div class="order-buton">
                        	<c:if test="${sessionScope.login.userGrant ne 'admin'}">
                     			<a href="${pageContext.request.contextPath}/insertQna">문의글 등록</a>
                     		</c:if>
                        	<c:if test="${sessionScope.login.userGrant eq 'admin'}">
                     			<a href="${pageContext.request.contextPath}/insertNotice">공지 등록</a>
                     		</c:if>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                <form action="./insertQna" method="post">
			 		<div style="min-height:350px;">
			 		<table class="table table-bordered table-striped" style="text-align:center;">
			 			<thead>
							<tr>
								<th colspan="2" style="background-color:#eeeeee; text-align: center;">문의 등록하기</th>
							</tr>		 		
			 			</thead>
			 			<tbody>
			 				<tr>
			 					<td><input type="text" class="form-control" placeholder="글제목" name="qnaTitle" maxlength="100" size="100" required></td>
			 					<td><input type="text" class="form-control" readonly="readonly" name="userId" value="${sessionScope.login.userId}" required></td>
			 				</tr>
			 				<tr>	
			 					<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="qnaContent" maxlength="1024" style="height:200px" required></textarea> </td>
			 				</tr>
			 			</tbody>
			 		</table>
			 		</div>
                    <section >
                        <div style="float:right">
                            <input type="submit" value="등록">
                        </div>
                    </section>
                    </form>
                    </div>
                </div>
            </div>
    </section>
    <!--   end of about us area-->
</body>
</html>