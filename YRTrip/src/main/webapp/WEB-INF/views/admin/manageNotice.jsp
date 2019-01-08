<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   
   $("#travelList").empty();
   $("#pagination").html("");

   if(page == undefined || page == ""){
      page=1
      
   };      
   $("#page").val(page);
   
   $.ajax({
      
      url : "getManageTravelListPaging",
      data : $("#frm").serialize(),
      type : "POST",
      dataType : "json",
      error : function(xhr, status, msg) {
         alert("상태값 :" + status + "Http에러메시지 :" + msg);
      },
      success : function(data) {
         console.log(data.mtravelList);
         for (i = 0; i < data.mtravelList.length; i++) {
              var tr = "<tr id=\"TB"+data.mtravelList[i].travelNo+"\"><td>"
					 +"<strong>TB"+ data.mtravelList[i].travelNo +"</strong>"
					 +"</td><td>"
					 +"<strong>" + data.mtravelList[i].travelTitle +"</strong>"
					 +"</td><td>"
						 + data.mtravelList[i].tinfoId
					 +"</td><td>"
						 + data.mtravelList[i].userId
					 +"</td><td>"
						 + data.mtravelList[i].travelDate
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getTravelBoard?travelNo="+ data.mtravelList[i].travelNo +"'\">상세보기</button>"
					 + "<button type=\"button\" value='"+data.mtravelList[i].travelNo+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					 +"</td></tr>"
              $(tr).appendTo("#travelList");
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
					 +"<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getNotice?noticeId="+ datas[i].noticeId +"'\">상세보기</button>"
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