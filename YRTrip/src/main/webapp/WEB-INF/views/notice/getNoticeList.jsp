<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 게시글 사진 첨부 표시 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
					alert("로그인이 필요한 서비스입니다");
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
                            <li><a href="getNoticeList" style="color:black"><strong>공지사항</strong></a></li>
                            <li><a href="getQnaList" style="color:black">1:1 문의</a></li>
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
                	<div class="table-responsive" style="min-height:450px;">
                	
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
                    				<th style="text-align:center">작성일</th>
                    				<th style="text-align:center">조회수</th>
                    			</tr>
                    		</thead>
                    		<tbody>
							<c:forEach items="${noticeList}" var="notice">
								<tr>
									<td style="text-align:center">${notice.noticeId}</td>
									<td><a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;
										width:420px; vertical-align:middle" href="./getNotice?noticeId=${notice.noticeId}">${notice.noticeTitle}
										<!-- 게시글 사진 첨부 표시 -->
										<c:if test="${not empty notice.noticeImg}"><span class="glyphicon glyphicon-picture"></span></c:if></a></td>
									<td>${notice.userName}</td>
									<td style="text-align:center">${notice.noticeDate}</td>
									<td style="text-align:center">${notice.noticeHit}</td>
								</tr>
							</c:forEach>
                    		</tbody>
                    	</table>
                    </div>
                    
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