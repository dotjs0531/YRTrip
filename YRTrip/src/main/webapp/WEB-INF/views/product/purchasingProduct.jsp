<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<style>
	#login-row {
		margin-left: -230px;
		margin-right: 440px;
	}
</style>
<script>
	$(function(){
		var address_origin = $("#address").val();
		var item_total = $("#itemPrice").text() * $("#itemEa").text();
		$("#different-address").click(function(){
			$("#address").val('');
		});
		$("#same-address").click(function(){
			$("#address").val(address_origin);
		});
		
		$("#itemTotal").html(item_total);
		
		/* sellerid = buyid 일때 막아놓기 */
	});
</script>
</head>

<body class="bg-light">
<section class="about_us_area" id="about">
    <div class="container">
       <div class="py-5 text-center">        
        <h2>주문서</h2>
        <p class="lead">중고 거래는 신중하게 해주시길 부탁드립니다.<br>
        -유어레알트립전직원일동</p>
      </div>
      <div class="row">
       
        <div class="col-md-6 center-block order-md-1">
          <h4 class="mb-3">필수정보</h4>
          <form class="needs-validation" novalidate="">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">이름</label>
                <input type="text" class="form-control" id="firstName"  name="${userPur.userName}" placeholder="" value="${userPur.userName}" required="" disabled>
                <div class="invalid-feedback">
                  이름을 입력해주세요
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="userId">회원아이디</label>
                <input type="text" class="form-control" id="buyerId" name="${userPur.userId}" placeholder="" value="${userPur.userId}" required="" disabled>
                <div class="invalid-feedback">
                  이름을 입력해주세요
                </div>
              </div>
             </div>  
             <div class="mb-3">  
				<div class="custom-control custom-radio">
	              <input type="radio" name="which-address" class="custom-control-input" id="same-address" checked="">
	              <label class="custom-control-label address" for="same-address">저장한 주소와 배달지 주소가 같아요!</label>
	            </div>
	            <!-- 주소 리셋해주기 -->
	            <div class="custom-control custom-radio">
	              <input type="radio" name="which-address" class="custom-control-input" id="different-address">
	              <label class="custom-control-label address" for="different-address">다른 주소를 쓸꺼예요</label>
	            </div>
            </div>
            <div class="mb-3">
              <label for="address">주소</label>
              <input type="text" class="form-control" id="address" name="${userPur.userAddress}" value="${userPur.userAddress}" placeholder="시/군/구/동/읍/면/리" required="">
              <div class="invalid-feedback">
                배달될 주소를 입력해주세요 
              </div>
            </div>

            <div class="mb-3">
              <label for="address2">상세주소</label>
              <input type="text" class="form-control" id="address2" placeholder="동/호/실/몇층과 같은 상세주소를 입력해주세요" required="">
            </div>		
            <div class="mb-3">
              <label for="email">이메일<span class="text-muted">(선택)</span></label>
              <input type="email" class="form-control" value="${userPur.userEmail}" id="email" placeholder="you@example.com">
              <div class="invalid-feedback">
                배송내역을 이메일로 실시간 알려드립니다 필요시 입력해주세요
              </div>
            </div>
            
            <hr class="mb-4">         
            <h4 class="mb-3">상품정보</h4>
        상품이미지 작게 넣기 60*60정도?
             <div class="row">
              <div class="col-md-3 mb-3">
                <label for="itemPrice">상품가격</label>
                <div id="itemPrice">${cart.itemPrice}</div>              
              </div>
              
              <div class="col-md-1 mb-3 mt-4">
                <div id="">*</div>
              </div>
              
               <div class="col-md-3 mb-3">
                <label for="itemEa" class="" for="itemEa">주문개수</label>
                <div id="itemEa">${cart.itemEa}</div>
              </div>
              
              <div class="col-md-1 mb-3 mt-4">
                <div id="">=</div>
              </div>
              
              <div class="col-md-4 mb-3">
                <label for="itemTotal">총가격</label>
	                <div id="itemTotal"></div>
              </div>	
             </div>
             
              <div class="row">
              <div class="col-md-4 mb-3">
                <label for="sellerId">판매자아이디</label>
                <input type="text" class="form-control" id="sellerId" placeholder="" value="${cart.sellerId}" required="" disabled>
              </div>
              <div class="col-md-4 mb-3">
                <label for="itemMethod">선호결제</label>
                <div id="itemMethod">${cart.itemMethod}</div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="itemMethod">구매가능여부</label>
                <div class="text-success" id="itemOrderdetail">${cart.itemOrderdetail}</div>
              </div>
             </div> 
            
			<hr class="mb-4">
            <h4 class="mb-3">결제방법</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                <label class="custom-control-label" for="credit">현금결제</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                <label class="custom-control-label" for="debit">카드결제</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                <label class="custom-control-label" for="paypal">???</label>
              </div>
            </div>
           <!--  <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div> -->
            <hr class="mb-4">
            <button class="btn btn-lg btn-block" style="background-color: #f9bf3b; color: white;" type="submit">주문하기!!</button>
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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
  

</body>

</html>