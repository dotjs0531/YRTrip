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
   
   $("#qnaList").empty();
   $("#pagination").html("");

   if(page == undefined || page == ""){
      page=1
      
   };      
   $("#page").val(page);
   
   $.ajax({
      
      url : "getManageQnaListPaging",
      data : $("#frm").serialize(),
      type : "POST",
      dataType : "json",
      error : function(xhr, status, msg) {
         alert("상태값 :" + status + "Http에러메시지 :" + msg);
      },
      success : function(data) {
         console.log(data.mqnaList);
         for (i = 0; i < data.mqnaList.length; i++) {
              var tr ="<tr id=\"QA"+data.mqnaList[i].qnaId+"\"><td>"
				 +"<strong>QA"+ data.mqnaList[i].qnaId +"</strong>"
				 +"</td><td>"
				 +"<strong>" + data.mqnaList[i].qnaTitle +"</strong>"
				 +"</td><td>"
					 + data.mqnaList[i].qnaContent
				 +"</td><td>"
				 	+ data.mqnaList[i].userId
				 +"</td><td>"
					+ data.mqnaList[i].qnaAnswer
				 +"</td><td>"
				 	+ data.mqnaList[i].qnaDate
				 +"</td><td>"
				 +"<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getQna?qnaId="+ data.mqnaList[i].qnaId +"'\">상세보기</button>"
				 + "<button type=\"button\" value='"+data.mqnaList[i].qnaId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
				 +"</td></tr>"
              $(tr).appendTo("#qnaList");
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
		$.getJSON("getManageQnaListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr id=\"QA"+datas[i].qnaId+"\"><td>"
					 +"<strong>QA"+ datas[i].qnaId +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].qnaTitle +"</strong>"
					 +"</td><td>"
						 + datas[i].qnaContent
					 +"</td><td>"
					 	+ datas[i].userId
					 +"</td><td>"
						+ datas[i].qnaAnswer
					 +"</td><td>"
					 	+ datas[i].qnaDate
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getQna?qnaId="+ datas[i].qnaId +"'\">상세보기</button>"
					 + "<button type=\"button\" value='"+datas[i].qnaId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					 +"</td></tr>"
					$(str).appendTo("#qnaList");
		}
		});	
	}); */
	
	$("#qnaList").on("click", ".btnDel", function() {
		var qnaId = $(this).closest('.btnDel').val();	
		if (confirm("삭제하시겠습니까?")) {
			var params = "qnaId=" + qnaId;
			var url = "deleteQnaAjax";
			$.getJSON(url, params, function(datas) {
				$("#QA" + qnaId).remove();
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
             <h4 class="card-title">1:1문의글 관리</h4>
             <div class="input-group col-xs-12" style="width:300px; float:right;">
                   <form name="frm" id="frm" class="form-inline">
	                <input type="text" class="form-control file-upload-info" name="searchKeyword" style="width:200px;" placeholder="회원ID를 입력해주세요.">
	                <span class="input-group-append">
	                  <button type="button" class="file-upload-browse btn" onclick='go_page(1)'>검색</button>
	                </span>
	            	<input type="hidden" name="page" id="page" >
	         	</form>
                 </div>
             <div class="table-responsive">
               <table class="table table-striped" style="text-align: center;">
                 <thead>
                   <tr>
                     <th>문의글번호</th>
                     <th>제목</th>
                     <th>내용</th>
                     <th>작성자</th>
                     <th>답변여부</th>
                     <th>작성일자</th>
                     <th>관리</th>
                   </tr>
                 </thead>
                 
                 <tbody id="qnaList"></tbody>
                 
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