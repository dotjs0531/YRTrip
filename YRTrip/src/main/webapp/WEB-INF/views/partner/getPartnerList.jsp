<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function showfield(name){
        if(name=='Others')document.getElementById('div1').innerHTML=' 비용 : <input type="text" name="partnerpay" />';
        else document.getElementById('div1').innerHTML='';
   }
   
   // 직접 입력 방식 선택 
   $('#partnerpay').change(function(){ $("#partnerpay option:selected").each(function(){
      if($(this).val()== '1'){ //직접입력일 경우
         $("#str_email02").val(''); //값 초기화
         $("#str_email02").attr("disabled",true); //활성화
      } else { //직접입력이 아닐경우
         $("#str_email02").val($(this).text()); //선택값 입력
         $("#str_email02").attr("disabled",false); //비활성화
         }
      });
   });
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
               </div>
            </div>
                <div class="col-md-offset-1 col-sm-6">
                    <form action="./insertPartner" method="post">
                   <table class="table table-bordered table-striped" style="text-align:center;">
                      <thead>
                        <tr>
                           <th colspan="10" style="background-color:#eeeeee; text-align: center;">동행 게시판 글쓰기</th>
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td colspan="1">글제목 : </td>
                            <td colspan="9">
                            <input type="text" class="form-control" placeholder="글제목" name="partnerTitle" maxlength="50">
                            <input type="hidden" name="partnerCondition" value="진행중">
                            <input type="hidden" name="userId" value="${sessionScope.login.userId}">
                            <input type="text" class="form-control" placeholder="??TinfoID에는 뭘넣어여?" name="tinfoId">
                            </td>
                         </tr>
                         <tr>
                            <td colspan="1">카테고리</td>
                            <td colspan="3"><select name="partnerClass">
                                  <option value="여행">여행</option>
                                  <option value="문화">문화</option>
                                  <option value="맛집">맛집</option>
                                  <option value="교통">교통</option>
                                  <option value="숙소">숙소</option></select>
                            </td>
                            <td>비용</td>
                            <td colspan="2">
                               <select name="partnerPay" id="partnerPay" onchange="showfield(this.options[this.selectedIndex].value)">
                                           <option value="100000">100,000</option>
                                           <option value="100000">200,000</option>
                                           <option value="100000">300,000</option>
                                           <option value="100000">400,000</option>
                                           <option value="Others">직접입력</option>
                                     </select>               
                           <div id="div1"></div>
                            </td>
                            <td>인원</td>
                            <td><select name="partnerPers">
                               <option value="2">2명</option>
                               <option value="3">3명</option>
                               <option value="4">4명</option>
                               <option value="5">5명</option>
                               <option value="단체">단체</option>
                            </select></td>
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
                          <div class="order-buton" style="padding-top:500px; float:right">
                               <button class="submit-btn">등록</button>
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