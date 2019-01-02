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
		$.getJSON("getManageNoticeListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr id=\"NT"+datas[i].noticeId+"\"><td>"
					 +"<strong>NT"+ datas[i].noticeId +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].noticeTitle +"</strong>"
					 +"</td><td>"
						 + datas[i].noticeDate
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-success mr-2\">상세보기</button>"
					 + "<button type=\"button\" value='"+datas[i].noticeId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					
					 +"</td></tr>"
					$(str).appendTo("#noticeList");
		}
		});	
	});
	
	$("#noticeList").on("click", ".btnDel", function() {
		var noticeId = $(this).closest('.btnDel').val();
		if (confirm("삭제하시겠습니까?")) {
			var params = "noticeId=" + noticeId;
			var url = "deleteNoticeAjax";
			$.getJSON(url, params, function(datas) {
				$("#NT" + noticeId).remove();
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
             <h4 class="card-title">공지사항 관리</h4>
             <div class="table-responsive">
               <table class="table table-striped">
                 <thead>
                   <tr>
                     <th>
                  	  	 공지번호
                     </th>
                     <th>
                       	제목
                     </th>
                     <th>
                       	작성일자
                     </th>
                     <th>
              		         관리
                     </th>
                   </tr>
                 </thead>
                 <tbody id="noticeList">
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html> 