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
/* $(function(){
	$(function() {
		$.getJSON("getOrderListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr><td>"
					 +"<strong>"+ datas[i].orderId +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].itemId +"</strong>"
					 +"</td><td>"
						 + datas[i].orderEa
					 +"</td><td>"
						 + datas[i].userEmail
					 +"</td><td>"
						 + datas[i].buyerId
					 +"</td><td>"
						 + datas[i].orderCondition
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-danger mr-2\">상세보기</button>"
					 +"<input type=\"hidden\" id=\"orderId\" value=\""+datas[i].orderId+"\">"
					 +"</td></tr>"
					$(str).appendTo("#orderList");
		}
		});	
	});

});	 */
</script>
</head>
<body>
<div class="col-lg-12 grid-margin stretch-card">
         <div class="card">
           <div class="card-body">
             <h4 class="card-title">주문내역 관리</h4>
             <div class="table-responsive">
               <table class="table table-striped">
                 <thead>
                   <tr>
                     <th>
                  	  	 거래번호
                     </th>
                     <th>
                       	상품ID
                     </th>
                     <th>
                       	거래수량
                     </th>
                     <th>
              		         구매자
                     </th>
                     <th>
              		         거래상태
                     </th>
                     <th>
              		         상세보기
                     </th>
                   </tr>
                 </thead>
                 <tbody>
                 <c:forEach items="${manageOrder}" var="order">
                 <tr>
                 	<td><strong>${order.orderId}</strong></td>
					 <td><strong>${order.itemId}</strong></td>
					 <td>${order.orderEa}</td>
					 <td></td>
					 <td>${order.buyerId}</td>
					 <td>${order.orderCondition }</td>
					 <td>
					 	<button type="button" class="btn btn-danger mr-2">상세보기</button>
					 </td>
				</tr>
					 </c:forEach>
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html>