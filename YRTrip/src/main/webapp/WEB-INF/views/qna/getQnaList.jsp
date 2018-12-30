<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                            <a href="#">탈퇴</a>
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
								<label class="col-sm-2 control-label">검색어</label>
								<select name="searchCondition" class="form-control">
									<option value="qnaTitle">제목
									<option value="qnaContent">내용
								</select>
								<input type="text" name="searchKeyword" class="form-control">
								</div>
								
								<!-- 문의날짜 -->
								<div style="padding-bottom:5px">
								<label class="col-sm-2 control-label">문의일</label>
								<input type="date" name="searchDateStart" class="form-control">
								<input type="date" name="searchDateEnd" class="form-control">
								</div> 
								
								<!-- 답변여부 -->
								<div>
								<label class="col-sm-2 control-label">답변여부</label>
								<input type="radio" name="qnaAnswer" id="complete" value="완료" class="form-control">완료 &nbsp;
								<input type="radio" name="qnaAnswer" id="incomplete" value="미완료" class="form-control">미완료
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
									<td><a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; 
										overflow: hidden; width:420px; vertical-align:middle" href="./getQna?qnaId=${qna.qnaId}">${qna.qnaTitle}
										<c:if test="${qna.qnaCommentCnt != '0'}"> [${qna.qnaCommentCnt}]</c:if></a></td>
									<td style="color:black;"><c:if test="${sessionScope.login.userId eq qna.userId}">${qna.userName}</c:if>
										<c:if test="${sessionScope.login.userId ne qna.userId}"><a style="color:black;" href="./getYourTravelList?userId=${qna.userId}">${qna.userName}</a></c:if>
									</td>
									<td style="text-align:center">${qna.qnaDate}</td>
									<td style="text-align:center">${qna.qnaAnswer}</td>
								</tr>
							</c:forEach>
                    		</tbody>
                    	</table>
                    </div>
                    
                    <!-- 글 등록 버튼 -->
                    <section >
                        <div class="order-buton" style="padding-top:160px;float:right">
                            <a href="${pageContext.request.contextPath}/insertQna">등록</a>
                        </div>
                    </section>
                    
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