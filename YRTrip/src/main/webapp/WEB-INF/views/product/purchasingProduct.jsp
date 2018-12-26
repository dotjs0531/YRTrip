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
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
#login-row {
	margin-left: -230px;
	margin-right: 440px;
}
</style>
<script>
	$(function(){
		var post_origin = $("#userPost").val();
		var address_origin = $("#userAddress").val();
		var item_total = $("#itemPrice").text() * $("#itemEa").text();
		$("#different-address").click(function(){
			$("#userAddress").val('');
			$("#userPost").val('');
		});
		$("#same-address").click(function(){
			$("#userAddress").val(address_origin);
			$("#userPost").val(post_origin);
		});
		
		$("#itemTotal").html(item_total);
		
		/* sellerid = buyid 일때 막아놓기 */
	});
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                
                	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    	extraRoadAddr += data.bname;
                	}
                	// 건물명이 있고, 공동주택일 경우 추가한다.
                	if(data.buildingName !== '' && data.apartment === 'Y'){
                   		extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                	}
                	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                	if(extraRoadAddr !== ''){
                    	extraRoadAddr = ' (' + extraRoadAddr + ')';
                    	addr += extraRoadAddr;
                	}
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userPost").value = data.zonecode;
                document.getElementById("userAddress").value = addr;
            }
        }).open();
    }
</script>
</head>

<body class="bg-light">
	<section class="about_us_area" id="about">
		<div class="container">
			<div class="py-5 text-center">
				<h2>주문서</h2>
				<p class="lead">
					중고 거래는 신중하게 해주시길 부탁드립니다.<br> -유어레알트립전직원일동
				</p>
			</div>
			<div class="row">
				<div class="col-md-6 center-block order-md-1">
					<h4 class="mb-3">필수정보</h4>
					<form action="./insertOrder" method="post" class="needs-validation" 
						novalidate="">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="buyerName">이름</label> <input type="text"
								class="form-control" id="buyerName" name="" placeholder=""
								value="${userPur.userName}" required="" disabled>
							<div class="invalid-feedback">이름을 입력해주세요</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="buyerId">회원아이디</label> <input type="text"
								class="form-control" id="buyerId" name="buyerId" placeholder=""
								value="${sessionScope.login.userId}" required="">
							<div class="invalid-feedback">이름을 입력해주세요</div>
						</div>
					</div>
					
					<div class="mb-3">
						<div class="custom-control custom-radio">
							<input id="same-address" name="orderDelivery" type="radio"
								class="custom-control-input" value="카드결제" checked="" required="">
							<label class="custom-control-label address" for="same-address">회원정보에 있는 주소와 동일</label>
						</div>
						<!-- 주소 리셋해주기 -->
						<div class="custom-control custom-radio">
							<input id="different-address" name="orderDelivery" type="radio"
								class="custom-control-input" value="현금결제" required=""> <label
								class="custom-control-label address" for="different-address">새 주소 입력</label>
						</div>
					</div>

					<div class="mb-3">
						<div class="row">
							<label class="col-md-12" for="userAddress">주소</label>
						</div>

						<input class="form-control col-md-5 mr-4 mb-3" type="text"
							value="${userPur.userPost}" id="userPost"> <a
							role="button" class="btn btn-warning col-md-3 pull-right"
							onclick="sample4_execDaumPostcode()">우편번호 찾기</a> <input
							type="text" class="form-control" id="userAddress"
							name="orderAddress1" value="${userPur.userAddress}"
							placeholder="시/군/구/동/읍/면/리" required="">
							<div class="invalid-feedback">배달될 주소를 입력해주세요</div>
					</div>
					<div class="mb-3">
						<label for="address2">상세주소</label> <input type="text"
							class="form-control" id="address2" name="orderAddress2"
							placeholder="동/호/실/몇층과 같은 상세주소를 입력해주세요" required="">
					</div>
					<div class="mb-3">
						<label for="email">이메일<span class="text-muted">(선택)</span></label>
						<input type="email" class="form-control"
							value="${userPur.userEmail}" id="email"
							placeholder="you@example.com">
						<div class="invalid-feedback">배송내역을 이메일로 알려드립니다 필요시 입력해주세요</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">상품정보</h4>
					상품이미지 작게 넣기 60*60정도?
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="orderPrice">상품가격</label>
							<div id="orderPrice">
								<input type="text" name="orderPrice" value="${cart.itemPrice}">
								${cart.itemPrice}
							</div>
						</div>

						<div class="col-md-1 mb-3 mt-4">
							<div id="">*</div>
						</div>

						<div class="col-md-3 mb-3">
							<label for="OrderEa" class="">주문개수</label>
							<div id="OrderEa">
								<input type="text" name="OrderEa" value="${cart.itemEa}">
							</div>
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
							<label for="sellerId">판매자아이디</label> <input type="text"
								class="form-control" id="sellerId" placeholder=""
								value="${cart.sellerId}" required="" disabled>
						</div>
						<div class="col-md-4 mb-3">
							<label for="itemMethod">선호결제</label>
							<div id="itemMethod">${cart.itemMethod}</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="itemOrderdetail">구매가능여부</label>
							<div class="text-success" id="itemOrderdetail">${cart.itemOrderdetail}</div>
						</div>
					</div>

					<hr class="mb-4">

					<h4 class="mb-3">결제방법</h4>
					<div class="mb-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="orderDelivery" type="radio"
								class="custom-control-input" value="카드결제" checked="" required="">
							<label class="custom-control-label" for="credit">카드결제</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debit" name="orderDelivery" type="radio"
								class="custom-control-input" value="현금결제" required=""> <label
								class="custom-control-label" for="debit">현금결제</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="paypal" name="orderDelivery" type="radio"
								class="custom-control-input" required=""> <label
								class="custom-control-label" for="paypal">Paypal</label>
						</div>
					</div>
				<input type="hidden" value="${cart.itemId}" name="itemId">
				<hr class="mb-4">
				<button class="btn btn-lg btn-block"
					style="background-color: #f9bf3b; color: white;" type="submit"
					formaction="./insertOrder">주문하기!!</button>
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