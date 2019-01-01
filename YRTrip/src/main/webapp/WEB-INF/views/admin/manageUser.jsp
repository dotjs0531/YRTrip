<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script>
$(function(){
	$(function() {
		$.getJSON("getUserListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr><td>"
					 +"<strong>"+ datas[i].userId +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].userName +"</strong>"
					 +"</td><td>"
						 + datas[i].userBirth
					 +"</td><td>"
						 + datas[i].userEmail
					 +"</td><td>"
						 + datas[i].userPhone
					 +"</td><td>"
						 + datas[i].userDate
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					 +"<input type=\"hidden\" id=\"userId\" value=\""+datas[i].userId+"\">"
					 +"</td></tr>"
					$(str).appendTo("#userList");
		}
		});	
	});

	$("#userList").on("click", ".btnDel", function(){
 		var userId = $(this).closest('#userList').find('#userId').val();
		if(confirm("삭제하시겠습니까?")) {
			var params = "userId=" + userId;
			var url = "deleteUserAjax";
			$.getJSON(url, params, function(datas){
				$(userId).remove();
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
             <h4 class="card-title"><strong>회원관리</strong></h4>
             <div class="input-group col-xs-12" style="width:300px; float:right;">
                   <input type="text" class="form-control file-upload-info" style="width:200px;">
<!--  시간 남으면 추가                  <span class="input-group-append">
                     <button class="file-upload-browse btn" type="button">검색</button>
                   </span> -->
                 </div>
             <div class="table-responsive">
               <table class="table table-striped">
                 <thead style="text-align:center;">
                   <tr>
                     <th>
              		         아이디
                     </th>
                     <th>
                       	이름
                     </th>
                     <th>
                       	생년월일
                     </th>
                     <th>
                       	메일주소
                     </th>
                     <th>
                       	전화번호
                     </th>
                     <th>
                       	가입일
                     </th>
                     <th>
                     	관리
                     </th>
                   </tr>
                 </thead>
                 <tbody id="userList">
                 
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html>