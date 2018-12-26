<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript">
   function del(nid){
      if(confirm("삭제하시겠습니까?")){
         location.href = "./deleteNotice?noticeId=" + nid;
      } else { return; }
   };
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
                    <div class="about_car">
                    	<br/>
						<h3 style="color:black">${notice.noticeTitle}</h3>
						<br/>
						<strong>작성자</strong>&nbsp;&nbsp;${notice.userName} ｜ <strong>작성일</strong>&nbsp;&nbsp;${notice.noticeDate} ｜ <strong>조회수</strong>&nbsp;&nbsp;${notice.noticeHit}
						
						<hr />
						<div style="min-height:300px;">
						<c:if test="${not empty notice.noticeImg}">
							<img src="./images/notice/${notice.noticeImg}" />
						</c:if>
							<pre style="background-color:white; border-style: none; font-family: 'montserratbold'; font-size: 16px">${notice.noticeContent}</pre>
						</div>
						
                    	<c:if test="${sessionScope.login.userGrant eq 'admin'}">
						<div class="order-buton" style="float:right">
                            <a href="./updateNoticeForm?noticeId=${notice.noticeId}">수정</a>&nbsp;&nbsp;
                            <a onclick="del('${notice.noticeId}')">삭제</a>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>