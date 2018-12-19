<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- 제품명들어갈듯 -->
<title>등록 제품 수정에서 가지고 온</title>

<link href="resources/css/product.bootstrap.min.css" rel="stylesheet">
<link
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
   integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz">

<style>
#login-row {
   margin-left: -230px;
   margin-right: 440px;
}
</style>
<script>
   $(function() {
      if($('#itemAva').val()=='구매가능'){
         if ($('#itemCon').text()=='카드결제') {
            $('#p_togglebtn').text('결제하기');
         }
         else{
            $('#p_togglebtn').text('대화하기');
         }
      }   
      else {
         $("#p_togglebtn").removeAttr("style");
         $('#p_togglebtn').text('구매불가');
      }
   });
</script>
</head>

<body class="bg-light">
   <section class="about_us_area" id="about">
      <div class="container">
         <div class="py-5 text-center">
            <h2>장바구니(찜리스트)${sessionScope.login.userId}</h2>
            <p class="lead">
               중고 거래는 신중하게 해주시길 부탁드립니다.<br> -유어레알트립전직원일동
            </p>
         </div>
         <div class="row">
            
            <div class="col-md-6 center-block order-md-1">
               <h4 class="d-flex justify-content-between align-items-center mb-3">
                  <span class="text-muted">목록</span> 
                  <span class="badge badge-secondary badge-pill">3 이거 숫자</span>
               </h4>
               <!-- 내가 사려고 선택한 물건 목록들 c:forEach -->

               <ul class="list-group mb-3">
               <c:forEach items="${cartList}" var="cart" varStatus="status">
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                        <input type="hidden" value="${cart.cartId}">
                        <input type=hidden id="itemAva" value="${cart.itemOrderdetail}">
                           <h3 class="my-0">${cart.itemName}</h3>
                           <small class="text-muted">${cart.itemCategory}</small> <br>
                           <small class="text-muted" id="itemCon">${cart.itemCondition}</small> <br>
                           
                     </div> 
                     <span class="text-muted">￦${cart.itemPrice}</span> 
                     <!-- 수정클릭하면 itemEa창 input창으로 바뀌게 -->
                        <input class="form-control col-md-1" type="text" value="${cart.itemEa}" />
                        <a>수정</a>
                     <div>
                        <!-- if getproduct에서 가져온 itemOrderdetail상태가 구매가능 일때는 색상 : #f9bf3b
              if get~~~~~~~~~~~~~ ITEM_METHOD가 직접판매, 현금결제일때는 : 채팅으로 연결되도록
                  ~~~~~~~~~~~~~~~~ ITEM_METHOD가 카드결제        일때는   : 바로 주문서로  -->
                        <a class="btn btn-lg btn-block"
                           style="background-color: #f9bf3b; color: white;"
                           id="p_togglebtn">대화하기</a>
                         <%-- href="./deleteCart?CartId=${cartId}" --%>
                        <a class="btn btn-lg btn-block">취소하기</a>
                     </div>
                  </li>
               </c:forEach>
                  <!-- 내가 사려고 선택한 물건 목록들 c:forEach 끝-->


                  <li
                     class="list-group-item d-flex justify-content-between bg-light">
                     <div class="text-success">
                        <h6 class="my-0">마일맂...?</h6>
                        <small>마일리지 넣을까..?</small>
                     </div> <span class="text-success">-$5</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between"><span>최종금액
                        (WON)</span> <strong>이부분은 필요할지 모르겠네...</strong></li>
               </ul>

               <form class="card p-2">
                  <div class="input-group">
                     <input type="text" class="col-md-10 form-control ml-4"
                        placeholder="쿠폰 코드">
                     <div class="input-group-append pull-right">
                        <button type="submit" class="btn btn-secondary">적용</button>
                     </div>
                  </div>
               </form>

            </div>
         </div>

         <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">© 2018 유어레알트립</p>
            <ul class="list-inline">
               <li class="list-inline-item"><a href="#">Privacy</a></li>
               <li class="list-inline-item"><a href="#">Terms</a></li>
               <li class="list-inline-item"><a href="#">Support</a></li>
            </ul>
         </footer>
      </div>
   </section>
   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"></script>
   <script>
      window.jQuery
            || document
                  .write(
                        '<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
   </script>
   <script src="../../assets/js/vendor/popper.min.js"></script>
   <script src="../../dist/js/bootstrap.min.js"></script>
   <script src="../../assets/js/vendor/holder.min.js"></script>
   <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
                  (
                        function() {
                           'use strict';

                           window
                                 .addEventListener(
                                       'load',
                                       function() {
                                          // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                          var forms = document
                                                .getElementsByClassName('needs-validation');

                                          // Loop over them and prevent submission
                                          var validation = Array.prototype.filter
                                                .call(
                                                      forms,
                                                      function(
                                                            form) {
                                                         form
                                                               .addEventListener(
                                                                     'submit',
                                                                     function(
                                                                           event) {
                                                                        if (form
                                                                              .checkValidity() === false) {
                                                                           event
                                                                                 .preventDefault();
                                                                           event
                                                                                 .stopPropagation();
                                                                        }
                                                                        form.classList
                                                                              .add('was-validated');
                                                                     },
                                                                     false);
                                                      });
                                       }, false);
                        })();
   </script>


</body>

</html>