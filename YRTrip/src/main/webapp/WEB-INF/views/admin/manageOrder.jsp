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
					 +"<button type=\"button\" onclick=\"location.href='./getOrder?orderId="+datas[i].orderId+"'\" class=\"btn btn-success mr-2\">상세보기</button>"
					 +"</td></tr>"
					$(str).appendTo("#orderList");
		}
		});	
	});

});	 
</script>
</head>
<body>
<div class="col-lg-12 grid-margin stretch-card">
         <div class="card">
           <div class="card-body">
             <h4 class="card-title">주문내역 관리</h4>
             <div class="input-group col-xs-12" style="width:300px; float:right;">
                   <input type="text" class="form-control file-upload-info" style="width:200px;">
                  <span class="input-group-append">
                     <button class="file-upload-browse btn" type="button">검색</button>
                   </span>
                 </div>
             <div class="table-responsive">
               <table class="table table-striped" style="text-align: center;">
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
                 <tbody id="orderList">
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html>