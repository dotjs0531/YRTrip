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
$(function(){
    var partnerMenu = document.getElementById("partnerMenu");
    partnerMenu.className='current-menu-item';
});
   function go_sort(sortCol) {
      document.frm.sortCol.value = sortCol;
      document.frm.submit();
   }
   function go_page(page) {
      document.frm.page.value = page;
      document.frm.submit();
   }
</script>
</head>
<body>
   <section class="about_us_area" id="about">
      <div class="container">
         <div class="row">
            <!-- 왼쪽 사이드바 -->
            <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
               <div class="single-pricing-table">
                  <div class="pricing-title">
                     <h2 style="color: black">동행구하기</h2>
                  </div>
                  <ul class=price-list>
                     <li><a href="getPartnerList" style="color: black">전체보기</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=여행" style="color: black">여행</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=문화" style="color: black">문화</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=맛집" style="color: black">맛집</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=교통" style="color: black">교통</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=숙소" style="color: black">숙소</a></li>
                  </ul>
                  <div class="order-buton" style="padding-bottom: 1px;">
                     <a href="${pageContext.request.contextPath}/insertPartnerForm">글쓰기</a>
                  </div>
               </div>
            </div>

            <!-- 검색 창 -->
            <div class="col-sm-6" style="min-width: 700px">
               <div class="table-responsive" style="min-height: 450px;">
                  <!-- 검색 창 & 페이징 처리 -->
                  <form name="frm" class="form-inline">
                     <div class="form-group"
                        style="padding-bottom: 10px; float: right">
                        <select name="searchCondition" class="form-control">
                           <option value="userId">글쓴이
                           <option value="partnerTitle">제목
                        </select> <input type="text" name="searchKeyword" class="form-control">
                        <button class="btn btn-warning signupbtn">검색</button>
                        <input type="hidden" name="page" />
                     </div>
                  </form>
                  <p style="clear: both">
                     <!-- 동행 게시판 리스트 -->
                  <table class="table table-hover">
                     <!-- 동행구하기 테이블 헤더부분 -->
                     <thead>
                        <tr>
                           <th>no.</th>
                           <th style="text-align:center">글제목</th>
                           <th>작성자</th>
                           <th style="text-align:center">작성일</th>
                           <th style="text-align:center">조회수</th>
                           <th style="text-align:center">진행상태</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${partnerList}" var="partner">
                           <tr>
                              <td>${partner.partnerId}</td>
                              <td><a style="color:black; display: inline-block; text-overflow: ellipsis; white-space: nowrap; 
									overflow: hidden; width:380px; vertical-align:middle" href="./getPartner?partnerId=${partner.partnerId}">${partner.partnerTitle}
									<c:if test="${partner.joinerCnt != '0'}"> [${partner.joinerCnt}]</c:if></a></td>
                              <td style="color:black;"><c:if test="${sessionScope.login.userId eq partner.userId}">${partner.userName}</c:if>
                                  <c:if test="${sessionScope.login.userId ne partner.userId}"><a style="color:black;" href="./getYourTravelList?userId=${partner.userId}">${partner.userName}</a></c:if>
                              </td>
                              <td style="text-align:center">${partner.partnerDate}
                              <td style="text-align:center">${partner.partnerHit}</td>
                              <td style="text-align:center">${partner.partnerCondition}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
               <!-- 페이지 번호 -->
               <div style="padding-top: 50px;">
                  <my:paging paging="${paging}" jsFunc="go_page" />
               </div>
            </div>
         </div>
      </div>
   </section>
</body>
</html>