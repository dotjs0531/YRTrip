<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 결제를 위한 아임포트 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

	var IMP = window.IMP; // 생략가능
	IMP.init('imp75074879'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	$(function(){
		$("#pay").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : item_total,
			    buyer_email : '${userPur.userEmail}',
			    buyer_name : '${userPur.userName}',
			    buyer_tel : '${userPur.userPhone}',
			    buyer_addr : address_origin,
			    buyer_postcode : $("#userPost").val(),
			    m_redirect_url : 'http://localhost:8081/app/pay.jsp'

			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		});
	});
</script>
</head>
<body>

</body>
</html>