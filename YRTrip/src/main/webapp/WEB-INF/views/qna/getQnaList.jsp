<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 라디오버튼 -->
<link href="resources/css/icheck-bootstrap.css" rel="stylesheet">

<style>
a { text-decoration:none !important; }
a:hover { color:white }
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
</style>
<script>
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	}
	jQuery( document ).ready(function( $ ) {
		if("${sessionScope.login.userId}" == ''){
			$(".insertQna").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다.");
		});
			$(".goToUserPage").click(function(e){
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다.");
		});
			$(".cantGetQna").click(function(e){
				e.preventDefault();
				alert("작성자만 열람 가능합니다.");
		});
		}
	});
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
                            <li><a href="getNoticeList" style="color:black">공지사항</a></li>
                            <li><a href="getQnaList" style="color:black"><strong>1:1 문의</strong></a></li>
                        </ul>
                        <div class="order-buton">
                        	<c:if test="${sessionScope.login.userGrant ne 'admin'}">
                     			<a href="${pageContext.request.contextPath}/insertQna" class="insertQna">문의글 등록</a>
                     		</c:if>
                        	<c:if test="${sessionScope.login.userGrant eq 'admin'}">
                     			<a href="${pageContext.request.contextPath}/insertNotice">공지 등록</a>
                     		</c:if>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:420px;">
                	
                		<!-- 검색 창 & 페이징 처리 -->
                		<form name="frm" class="form-inline">
                			<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
								
								<!-- 검색 내용 -->
								<div style="padding-bottom:5px">
								<label style="width:70px">검색어</label>
								<select name="searchCondition" class="form-control">
									<option value="qnaTitle">제목
									<option value="qnaContent">내용
								</select>
								<input type="text" name="searchKeyword" class="form-control" style="width:60%">
								</div>
								
								<!-- 문의날짜 -->
								<div style="padding-bottom:5px">
								<label style="width:70px">문의일</label>
								<input type="date" name="searchDateStart" class="form-control" style="width:36%">
								<input type="date" name="searchDateEnd" class="form-control" style="width:36%">
								</div> 
								
								<!-- 답변여부 -->
								<div>
								<label style="width:70px">답변여부</label>
								
								<div class="radio icheck-primary">
									<input type="radio" id="qnaAnswer" name="qnaAnswer" value="" class="form-control" checked>
									<label for="qnaAnswer">전체</label>
								</div>
								<div class="radio icheck-primary">
									&nbsp;<input type="radio" name="qnaAnswer" id="complete" value="완료" class="form-control">
									<label for="complete">완료</label>
								</div>
								<div class="radio icheck-primary">
									&nbsp;<input type="radio" name="qnaAnswer" id="incomplete" value="미완료" class="form-control">
									<label for="incomplete">미완료</label>
								</div>
								
								<button class="btn btn-warning signupbtn" style="float:right; margin-right:10px">검색</button>
								</div>
								
								<input type="hidden" name="page" />
         					</div>
						</form>
						<p style="clear:both">
						
                		<!-- 게시글 목록 -->
                    	<table class="table table-hover">
                    		<thead>
                    			<tr>
                    				<th>no.</th>
                    				<th style="text-align:center">글제목</th>
                    				<th>작성자</th>
                    				<th style="text-align:center">작성일</th>
                    				<th style="text-align:center">답변여부</th>
                    			</tr>
                    		</thead>
                    		<tbody>
							<c:forEach items="${qnaList}" var="qna">
								<tr>
									<td>${qna.qnaId}</td>
									<td>
									<c:if test="${sessionScope.login.userId eq qna.userId || sessionScope.login.userGrant eq 'admin'}">
									<a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; 
										overflow: hidden; width:420px; vertical-align:middle" href="./getQna?qnaId=${qna.qnaId}">${qna.qnaTitle}
										<c:if test="${qna.qnaCommentCnt != '0'}"> [${qna.qnaCommentCnt}]</c:if></a>
									</c:if>
									<c:if test="${sessionScope.login.userId ne qna.userId && sessionScope.login.userGrant ne 'admin'}">
									<a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; 
										overflow: hidden; width:420px; vertical-align:middle" href="#" class="cantGetQna">${qna.qnaTitle}
										<c:if test="${qna.qnaCommentCnt != '0'}"> [${qna.qnaCommentCnt}]</c:if></a>
									</c:if>
									</td>
									<td style="color:black;"><c:if test="${sessionScope.login.userId eq qna.userId}">${qna.userName}</c:if>
										<c:if test="${sessionScope.login.userId ne qna.userId}"><a style="color:black;" href="./getYourTravelList?userId=${qna.userId}" class="goToUserPage">${qna.userName}</a></c:if>
									</td>
									<td style="text-align:center">${qna.qnaDate}</td>
									<td style="text-align:center">${qna.qnaAnswer}</td>
								</tr>
							</c:forEach>
                    		</tbody>
                    	</table>
                    </div>
                    
                    <!-- 글 등록 버튼 -->
                    <%-- <section >
                        <div class="order-buton" style="padding-top:160px;float:right">
                            <a href="${pageContext.request.contextPath}/insertQna">등록</a>
                        </div>
                    </section> --%>
                    
                    <!-- 페이지 번호 -->
                    <div style="padding-top:210px;">
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>