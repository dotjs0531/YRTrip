<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	}
</script>
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
                            <li><a href="getNoticeList" style="color:black"><strong>공지사항</strong></a></li>
                            <li><a href="getQnaList" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:500px;">
                	
                		<!-- 검색 창 & 페이징 처리 -->
                		<form name="frm" class="form-inline">
                			<div class="form-group" style="padding-bottom:10px; float:right">
								<select name="searchCondition" class="form-control">
									<option value="noticeTitle">제목
									<option value="noticeContent">내용
								</select>
								<input type="text" name="searchKeyword" class="form-control">
								<button class="btn btn-warning signupbtn">검색</button>
								<input type="hidden" name="page" />
         					</div>
						</form>
						<p style="clear:both">
         				
         				<!-- 게시글 목록 -->
                    	<table class="table table-hover" >
                    		<thead>
                    			<tr>
                    				<th>no.</th>
                    				<th style="text-align:center">글제목</th>
                    				<th>작성자</th>
                    				<th>작성일</th>
                    				<th>조회수</th>
                    			</tr>
                    		</thead>
                    		<tbody>
							<c:forEach items="${noticeList}" var="notice">
								<tr>
									<td>${notice.noticeId}</td>
									<td><a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; 
										overflow: hidden; width:420px" href="./getNotice?noticeId=${notice.noticeId}">
											${notice.noticeTitle}</a></td>
									<td>${notice.userName}</td>
									<td>${notice.noticeDate}</td>
									<td>${notice.noticeHit}</td>
								</tr>
							</c:forEach>
                    		</tbody>
                    	</table>
                    </div>
                    
                    <!-- 글 등록 버튼 -->
                    <c:if test="${sessionScope.login.userGrant eq 'admin'}">
                    <section >
                        <div class="order-buton" style="float:right; padding-top:15px;">
                            <a href="${pageContext.request.contextPath}/insertNotice">등록</a>
                        </div>
                    </section>
                    </c:if>
                    
                    <!-- 페이지 번호 -->
                    <div style="padding-top:50px;">
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>