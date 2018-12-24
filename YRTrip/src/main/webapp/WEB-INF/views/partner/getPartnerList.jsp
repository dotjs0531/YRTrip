<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
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
                     <h2 style="color: black">여행목적</h2>
                  </div>
                  <ul class=price-list>
                     <li><a href="getPartnerList" style="color: black">전체보기</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=여행&page=" style="color: black">여행</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=문화&page=" style="color: black">문화</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=맛집&page=" style="color: black">맛집</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=교통&page=" style="color: black">교통</a></li>
                     <li><a href="getPartnerList?searchClass=partnerClass&searchKeyword=숙소&page=" style="color: black">숙소</a></li>
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
                           <th>글번호</th>
                           <th>글제목</th>
                           <th>글쓴이</th>
                           <th>문화</th>
                           <th>게시일</th>
                           <th>여행경비</th>
                           <th>진행상태</th>
                           <th>조회수</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${partnerList}" var="partner">
                           <tr>
                              <td>${partner.partnerId}</td>
                              <td><a href="./getPartner?partnerId=${partner.partnerId}">${partner.partnerTitle}</a></td>
                              <td>${partner.userId}</td>
                              <td>${partner.partnerClass}</td>
                              <td>${partner.partnerDate}<!-- 여행 경비 넣는 부분 -->
                              <td>${partner.partnerPay}</td>
                              <td class="tbl-apply"><a href="#">${partner.partnerCondition}</a></td>
                              <td>${partner.partnerHit}</td>
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