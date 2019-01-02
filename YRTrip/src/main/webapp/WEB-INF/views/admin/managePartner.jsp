<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
 $(function(){
	$(function() {
		$.getJSON("getManagePartnerListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr id=\"PT"+datas[i].partnerId+"\"><td>"
					 +"<strong>PT"+ datas[i].partnerId +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].partnerTitle +"</strong>"
					 +"</td><td>"
						 + datas[i].tinfoId
					 +"</td><td>"
						 + datas[i].partnerCondition
					 +"</td><td>"
						 + datas[i].userId
					 +"</td><td>"
						 + datas[i].partnerDate
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-success mr-2\">상세보기</button>"
					 + "<button type=\"button\" value='"+datas[i].partnerId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					 +"</td></tr>"
					$(str).appendTo("#partnerList");
		}
		});	
	});
	
	$("#partnerList").on("click", ".btnDel", function() {
		var partnerId = $(this).closest('.btnDel').val();
		if (confirm("삭제하시겠습니까?")) {
			var params = "partnerId=" + partnerId;
			var url = "deletePartnerAjax";
			$.getJSON(url, params, function(datas) {
				$("#PT" + partnerId).remove();
			});
		}
	});

});	 
</script>
</head>
<body>
<div class="col-lg-12 grid-margin stretch-card">
         <div class="card">
           <div class="card-body">
             <h4 class="card-title">동행관리</h4>
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
                 <tbody id="partnerList">
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html>