<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
<script type="text/javascript">
   function showfield(name){
        if(name=='Others')document.getElementById('div1').innerHTML=' 비용 : <input type="text" name="partnerPay" />';
        else document.getElementById('div1').innerHTML='';
   }
   
   
</script>
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
                  <div class="order-buton" style="padding-bottom: 1px;">
                  	<a href="${pageContext.request.contextPath}/insertPartnerForm">글쓰기</a>
                  </div>
               </div>
            </div>
            <div class="col-md-offset-1 col-sm-6">
               <form action="./updatePartner" method="post">
                  <table class="table table-bordered table-striped" style="text-align: center;">
                     <thead>
                        <tr>
                           <th colspan="10" style="background-color: #eeeeee; text-align: center;">동행 게시판 글수정</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td colspan="10">카테고리 >
                           <select name="partnerClass">
                               <option value="여행">여행</option>
                               <option value="문화">문화</option>
                               <option value="맛집">맛집</option>
                               <option value="교통">교통</option>
                               <option value="숙소">숙소</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                           <td colspan="1"><input type="hidden" name="partnerId" value="${partner.partnerId}">
                           No.${partner.partnerId}</td>
                           <td colspan="3">글제목 : <input type="text" class="form-control" name="partnerTitle" maxlength="50" value="${partner.partnerTitle}"></td>
                           <td colspan="3">글쓴이 : ${partner.userId}</td>
                           <td colspan="3">${partner.partnerDate}</td>
                        </tr>
                        <tr>
                           <td colspan="1">여행지 : 일단보류</td>
                           <td colspan="4">여행 경비 :
                               <select name="partnerPay" id="partnerPay" onchange="showfield(this.options[this.selectedIndex].value)">
                                           <option value="100000">100,000원대</option>
                                           <option value="100000">200,000원대</option>
                                           <option value="100000">300,000원대</option>
                                           <option value="100000">400,000원대</option>
                                           <option value="Others">직접입력</option>
                                     </select>               
                           <div id="div1"></div>
                            </td>
                            <td>인원</td>
                            <td colspan="3">
                               <select name="partnerPers">
                                  <option value="2">2명</option>
                                  <option value="3">3명</option>
                                  <option value="4">4명</option>
                                  <option value="5">5명</option>
                                  <option value="단체">단체</option>
                               </select>
                            </td>
                            <td colspan="3">
                               <select name="partnerCondition">
                                  <option value="미완료">미완료</option>
                                  <option value="완료">완료</option>
                               </select>
                            </td>
                        </tr>
                        <tr>
                            <td>출발일 : </td>
                            <td colspan="4"><input type="date" id="partnerStart" name="partnerStart" value="partnerStart"></td>
                            <td>도착일 : </td>
                            <td colspan="4"><input type="date" id="partnerEnd" name="partnerEnd" value="partnerEnd"></td>
                         </tr>
                        <tr>
                            <td colspan="10"><textarea class="form-control" placeholder="글 내용" name="partnerContent" maxlength="2048" style="height:200px"></textarea> </td>
                         </tr>
                     </tbody>
                  </table>
                  <section>
                     <div  class="order-buton" style="padding-top:500px; float:right">
                        <button class="submit-btn">등록</button>
                        <a href="${pageContext.request.contextPath}/getPartnerList">뒤로가기</a>
                     </div>
                  </section>
               </form>
            </div>
         </div>
      </div>
   </section>
</body>
</html>