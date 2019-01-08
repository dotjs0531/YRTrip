<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="com.yrtrip.app.Paging" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.pagination {
  display: inline-block;
}
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}
.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function go_page(page) {
   
   $("#userList").empty();
   $("#pagination").html("");

   if(page == undefined || page == ""){
      page=1
      
   };      
   $("#page").val(page);
   
   $.ajax({
      
      url : "getUserListPaging",
      data : $("#frm").serialize(),
      type : "POST",
      dataType : "json",
      error : function(xhr, status, msg) {
         alert("상태값 :" + status + "Http에러메시지 :" + msg);
      },
      success : function(datas) {
         console.log(datas.muserList);
         for (i = 0; i < datas.muserList.length; i++) {
              var tr = "<tr id=\"USR"+datas.muserList[i].userId+"\"><td>"
				 +"<strong>"+ datas.muserList[i].userId +"</strong>"
				 +"</td><td>"
				 +"<strong>" + datas.muserList[i].userName +"</strong>"
				 +"</td><td>"
					 + datas.muserList[i].userBirth
				 +"</td><td>"
					 + datas.muserList[i].userEmail
				 +"</td><td>"
					 + datas.muserList[i].userPhone
				 +"</td><td>"
					 + datas.muserList[i].userDate
				 +"</td><td>"
				 +"<button type=\"button\" value='"+datas.muserList[i].userId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
				 +"</td></tr>"
              $(tr).appendTo("#userList");
         }
            
         var dd = "<a href='#' onclick='go_page(1)' >&laquo;</a>";
         $(dd).appendTo("#pagination");
         
         var begin = data.paging.startPage;
         var end = data.paging.endPage;               
         for(j = begin; j <= end; j++ ) {
            if(j != data.paging.page) {
               var bb = "<a href='#' onclick='go_page("+j+")'>"+j+"</a>";
               $(bb).appendTo("#pagination");
            }
             else if(j == data.paging.page) {
               var cc = "<a href='#' class='active'>"+j+"</a>";
               $(cc).appendTo("#pagination");
            }
         }
         var ee = "<a href='#' onclick='go_page("+data.paging.lastPage+")'>&raquo;</a>";
         $(ee).appendTo("#pagination");
         
      }
   })
};
</script>
<script>
$(function(){
	/* $(function() {
		$.getJSON("getUserListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr id=\"USR"+datas[i].userId+"\"><td>"
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
					 +"<button type=\"button\" value='"+datas[i].userId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					 +"</td></tr>"
					$(str).appendTo("#userList");
		}
		});	
	}); */

	$("#userList").on("click", ".btnDel", function(){
		var userId = $(this).closest('.btnDel').val();
		if(confirm("삭제하시겠습니까?")) {
			var params = "userId=" + userId;
			var url = "deleteUserAjax";
			$.getJSON(url, params, function(datas){
				$("#USR" + userId).remove();
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
	             <form name="frm" id="frm" class="form-inline">
	                <input type="text" class="form-control file-upload-info" name="searchKeyword" style="width:200px;" placeholder="회원ID를 입력해주세요.">
	                <span class="input-group-append">
	                  <button type="button" class="file-upload-browse btn" onclick='go_page(1)'>검색</button>
	                </span>
	            	<input type="hidden" name="page" id="page" >
	         	</form>
         	 </div>
         	
             <!-- <div class="input-group col-xs-12" style="width:300px; float:right;">
                   <input type="text" class="form-control file-upload-info" style="width:200px;">
                  <span class="input-group-append">
                     <button class="file-upload-browse btn" type="button">검색</button>
                   </span>
                 </div> -->
             <div class="table-responsive">
               <table class="table table-striped" style="text-align:center;">
                 <thead>
                   <tr>
                     <th>아이디</th>
                     <th>이름</th>
                     <th>생년월일</th>
                     <th>메일주소</th>
                     <th>전화번호</th>
                     <th>가입일</th>
                     <th>관리</th>
                   </tr>
                 </thead>
                 
                 <tbody id="userList"></tbody>
                 
               </table>
             </div>
             
             <!-- 페이징 처리 -->
		     <div align="center">
		     	<div id="pagination" class="pagination"></div>
		     </div>
		     
           </div>
         </div>
       </div>       
       
<script>
go_page(1);
</script>

</body>
</html>