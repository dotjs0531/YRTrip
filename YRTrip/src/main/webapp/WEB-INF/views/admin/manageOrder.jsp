<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script>
 $(function(){
	$(function() {
		$.getJSON("getManageOrderListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr id=\"OR"+datas[i].orderId+"\"><td>"
					 +"<strong>OR"+ datas[i].orderId +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].itemId +"</strong>"
					 +"</td><td>"
						 + datas[i].orderEa
					 +"</td><td>"
						 + datas[i].buyerId
					 +"</td><td>"
						 + datas[i].orderCondition
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-success mr-2\" id=\"order" + datas[i].orderId + "\" data-toggle=\"modal\" data-target=\"#getOrder\">상세보기</button>"
					/*  +"<button type=\"button\" onclick=\"location.href='./getOrder?orderId="+datas[i].orderId+"'\" class=\"btn btn-success mr-2\">상세보기</button>" */
					 +"</td></tr>"
			$(str).appendTo("#orderList");
			}
		});	
	});
	
	$('#getOrder').on('show.bs.modal', function(e) {
		var button = $(event.target) // Button that triggered the modal
		console.log(event);
		var param = {
			orderId :  button.attr("id").substr(5)
		}
		$.getJSON("getManageOrder", param, function(data) {
			var orderId = data.orderId;
			var orderDate = data.orderDate;
			var orderDelivery = data.orderDelivery;
			
			var itemMethod = data.itemMethod;
			var orderEa = data.orderEa;
			var orderPrice = data.orderPrice;
			var totalPrice = orderEa*orderPrice;
			
			var userName = data.userName;
			var userPhone = data.userPhone;
			var userPost = data.userPost;
			var userAddress = data.userAddress;
			
			$("#orderId").html(orderId);
			$("#orderDate").html(orderDate);
			$("#orderDelivery").html(orderDelivery);
				
			$("#itemMethod").html(itemMethod);
			$("#orderEa").html(orderEa+"개");
			$("#orderPrice").html(orderPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
			$("#totalPrice").html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");

			$("#userName").html(userName);
			$("#userPhone").html(userPhone);
			$("#userPost").html(userPost);
			$("#userAddress").html(userAddress);
		})
	});
	
});	 
</script>
<style>
.modal {
        text-align: center;
}
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
.text-info {
    color: #31708f !important;
}
.single-pricing-table {
	width:100%;
	text-align:left;
	padding: 20px;
	color:black;
	margin-left:10px;
	border:solid;
	border-width: 1px;
	border-color: #f2f2f2;
}
.row{
	margin-left: -5px !important;
}
</style>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">주문내역 관리</h4>
				<div class="input-group col-xs-12"
					style="width: 300px; float: right;">
					<input type="text" class="form-control file-upload-info"
						style="width: 200px;"> <span class="input-group-append">
						<button class="file-upload-browse btn" type="button">검색</button>
					</span>
				</div>
				<div class="table-responsive">
					<table class="table table-striped" style="text-align: center;">
						<thead>
							<tr>
								<th>거래번호</th>
								<th>상품ID</th>
								<th>거래수량</th>
								<th>구매자</th>
								<th>거래상태</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody id="orderList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- 거래내역 상세보기 -->
	<div class="modal fade" id="getOrder">
		<div class="modal-dialog" style="width:700px">
			<div class="modal-content" style="background-color:white; width: 120%;">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- body -->
				<div class="modal-body">
					<div class="container" style="width:100%">
						<div id="login-row" class="row justify-content-center align-items-center">
							<div id="login-column" style="width:100%">
								<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
	            					<div class="form-group single-pricing-table">
									<h4 style="color:black;">주문정보</h4><hr/>
										<table style="width:100%;">
											<tr>
												<td><h5 class="text-info">주문번호</h5></td>
												<td style="text-align:right;"><h5 id="orderId"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">주문일자</h5></td>
												<td style="text-align:right;"><h5 id="orderDate"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">배송상태</h5></td>
												<td style="text-align:right;"><h5 id="orderDelivery"></h5></td>
											</tr>
										</table>
									</div>
								</div>
								<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
	            					<div class="form-group single-pricing-table">
									<h4 style="color:black;">결제정보</h4><hr/>
										<table style="width:100%;">
											<tr>
												<td><h5 class="text-info">결제수단</h5></td>
												<td style="text-align:right;"><h5 id="itemMethod"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">상품 금액</h5></td>
												<td style="text-align:right;"><h5 id="orderPrice"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">구매 수량</h5></td>
												<td style="text-align:right;"><h5 id="orderEa"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">결제 금액</h5></td>
												<td style="text-align:right;"><h5 id="totalPrice"></h5></td>
											</tr>
										</table>
									</div>
								</div>
								<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
	            					<div class="form-group single-pricing-table">
									<h4 style="color:black;">배송정보</h4><hr/>
										<table style="width:100%;">
											<tr>
												<td><h5 class="text-info">수령인</h5></td>
												<td style="text-align:right;"><h5 id="userName"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">연락처</h5></td>
												<td style="text-align:right;"><h5 id="userPhone"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">우편번호</h5></td>
												<td style="text-align:right;"><h5 id="userPost"></h5></td>
											</tr>
											<tr>
												<td><h5 class="text-info" style="color:#5f768b;">주소</h5></td>
												<td style="text-align:right;"><h5 id="userAddress"></h5></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	<!-- end of modal-body -->
			</div> <!-- end of modal-content -->
		</div> 
	</div> <!-- end of modal -->
					
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>