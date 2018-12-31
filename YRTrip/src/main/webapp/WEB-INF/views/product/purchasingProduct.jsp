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
<!-- 결제를 위한 아임포트 라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#login-column {
   width:100%;
   margin: 0 10px;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
</style>

<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp75074879'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
$(function(){
	var post_origin = $("#orderPost").val();
	var address_origin = $("#orderAddress").val();
	var item_total = $("div#orderPriceSingle").text() * $("div#orderEa").text();
	/* 넘길정보들... */
	var orderEa_ = $("div#orderEa").text();
	console.log(orderEa_);
	var buyerId = 'user2';
	var itemId = '${cart.itemId}';
	/* var orderPost = 
	var orderAddress=  */
	var cartId='${cart.cartId}';
	var orderMethod=$('input[name="orderMethod"]:checked').val();
	
	$("#different-address").click(function(){
		$("#orderAddress").val('');
		$("#orderPost").val('');
	});
	$("#same-address").click(function(){
		$("#orderAddress").val(address_origin);
		$("#orderPost").val(post_origin);
	});

	$("#itemTotal").html(item_total);
	
		$("#pay").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
			    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
			    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
			    name : '주문명:결제테스트',
			    amount : item_total,
			    buyer_email : '${userPur.userEmail}',
			    buyer_name :  '${userPur.userName}',
			    buyer_tel : '${userPur.userPhone}',//누락되면 이니시스 결제창에서 오류
			    buyer_addr : '${userPur.userAddress}',
			    buyer_postcode : '${userPur.userPost}'
			}, function(rsp) {
				console.log('호출실행');
			    if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "./insertOrder", //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid
				    		
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		}
			    	}).done(function(data) {
			    		console.log(imp_uid);
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\n결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;
			    			
			    			alert(msg);
			    		} else {
			    			alret("에러");//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			});
		});
	});
</script>

<script>
	/* 주소찾기 */
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
                document.getElementById("orderPost").value = data.zonecode;
                document.getElementById("orderAddress").value = addr;
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
					<!-- ./insertOrder -->
						<!-- <form action="./insertOrder" method="post" class="needs-validation" 
							novalidate="" id="insertOrderId"> -->
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="buyerName">이름</label> <input type="text"
								class="form-control" id="buyerName" name="" placeholder=""
								value="${userPur.userName}" required="" readonly>
							<div class="invalid-feedback">이름을 입력해주세요</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="buyerId">회원아이디</label> <input type="text"
								class="form-control" id="buyerId" name="buyerId"
								value="${sessionScope.login.userId}" required="" readonly>
							<div class="invalid-feedback">이름을 입력해주세요</div>
						</div>
					</div>
					
					<div class="mb-3">
						<div class="custom-control custom-radio">
							<input id="same-address" name="orderDelivery" type="radio"
								class="custom-control-input" value="동일주소" checked="" required="">
							<label class="custom-control-label address" for="same-address">회원정보에 있는 주소와 동일</label>
						</div>
						<!-- 주소 리셋해주기 -->
						<div class="custom-control custom-radio">
							<input id="different-address" name="orderDelivery" type="radio"
								class="custom-control-input" value="다른주소" required=""> <label
								class="custom-control-label address" for="different-address">새 주소 입력</label>
						</div>
					</div>

					<div class="mb-3">
						<div class="row">
							<label class="col-md-12" for="orderAddress">주소<span class="text-muted">(상세주소도 같이 써주세요)</span></label>
						</div>

						<input class="form-control col-md-5 mb-3" type="text"
							value="${userPur.userPost}" name="orderPost" id="orderPost" placeholder="검색하세요!→"> <a
							role="button" class="btn btn-warning col-md-3 pull-right"
							onclick="sample4_execDaumPostcode()">우편번호 찾기</a> 
						<input
							type="text" class="form-control" id="orderAddress"
							name="orderAddress" value="${userPur.userAddress}"
							placeholder="시/군/구/동/읍/면/리 + 상세주소" required="">
							<div class="invalid-feedback">배달될 주소를 입력해주세요</div>
							<!-- 상세주소도 써달라고 하기! -->
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
							<label for="orderPriceSingle">상품가격</label>
							<div id="orderPriceSingle">
								${cart.itemPrice}
							</div>
						</div>

						<div class="col-md-1 mb-3 mt-4">
							<div id="">*</div>
						</div>

						<div class="col-md-3 mb-3">
							<label for="orderEa" class="">주문개수</label>
							<div id="orderEa">
								<%-- <input type="text" name="orderEa" value="${cart.itemEa}"> --%>
								${cart.itemEa}
							</div>
						</div>

						<div class="col-md-1 mb-3 mt-4">
							<div id="">=</div>
						</div>

						<div class="col-md-4 mb-3">
							<label for="itemTotal">총가격</label>
							<div id="itemTotal" name=""></div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="sellerId">판매자아이디</label> 
							<div id="sellerId">
							${cart.sellerId}
							</div>
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
							<input id="credit" name="orderMethod" type="radio"
								class="custom-control-input" value="카드결제" checked="" required="">
							<label class="custom-control-label" for="credit">카드(KG이니시스)</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debit" name="orderMethod" type="radio"
								class="custom-control-input" value="현금결제" required=""> <label
								class="custom-control-label" for="debit">현금결제</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="paypal" name="orderMethod" type="radio"
								class="custom-control-input" value="직거래" required=""> <label
								class="custom-control-label" for="paypal">직거래</label>
						</div>
					</div>
				<input type="text" value="${cart.itemId}" name="itemId">
				<input type="text" value="${cart.cartId}" name="cartId">
				<input type="text" value="${cart.itemEa}" name="orderEa">
				<%-- <input type="text" value="${cart.itemPrice}" name="itemPrice"> --%>
				
				<hr class="mb-4">
				<input class="btn btn-lg btn-block"
					style="background-color: #f9bf3b; color: white;"
					 id="pay" type="button" value="주문하기!!">
<!-- 					 <button class="btn btn-lg btn-block"
					style="background-color: #f9bf3b; color: white;" type="submit"
					 id="pay">주문하기!!</button> -->
				<!-- </form> -->
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