<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
 $(function(){
	$(function() {
		$.getJSON("getManageTravelListAjax", null, function(datas){	
		for(i=0; i<datas.length; i++){
			
			var str = "<tr id=\"TB"+datas[i].travelNo+"\"><td>"
					 +"<strong>TB"+ datas[i].travelNo +"</strong>"
					 +"</td><td>"
					 +"<strong>" + datas[i].travelTitle +"</strong>"
					 +"</td><td>"
						 + datas[i].tinfoId
					 +"</td><td>"
						 + datas[i].userId
					 +"</td><td>"
						 + datas[i].travelDate
					 +"</td><td>"
					 +"<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getTravelBoard?travelNo="+ datas[i].travelNo +"'\">상세보기</button>"
					 + "<button type=\"button\" value='"+datas[i].travelNo+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
					 +"</td></tr>"
					$(str).appendTo("#travelList");
		}
		});	
	});
	
	$("#travelList").on("click", ".btnDel", function() {
		var travelNo = $(this).closest('.btnDel').val();		
		console.log(travelNo);
		if (confirm("삭제하시겠습니까?")) {
			var params = "travelNo=" + travelNo;
			var url = "deleteTravelAjax";
			$.getJSON(url, params, function(datas) {
				$("#TB" + travelNo).remove();

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
             <h4 class="card-title">여행관리</h4>
             <div class="input-group col-xs-12" style="width:450px; float:right;">
             <form name="./getManageTravelList" class="form-inline">
		           <select name="searchCondition" class="form-control" id="searchCondition">
							<option value="travelTitle">제목</option>
							<option value="travelContent">내용</option>
							<option value="userId">작성자</option>
				   </select>
                   <input type="text" class="form-control file-upload-info" name="searchKeyword" style="width:200px;" placeholder="검색할 내용을 입력하세요.">
                   <span class="input-group-append">
                     <button class="file-upload-browse btn" type="submit">검색</button>
                   </span>
             </form>
                 </div>
             <div class="table-responsive">
               <table class="table table-striped" style="text-align: center;">
                 <thead>
                   <tr>
                     <th>
                  	  	 글번호
                     </th>
                     <th>
                       	제목
                     </th>
                     <th>
                       	여행지
                     </th>
                     <th>
              		         작성자
                     </th>
                     <th>
              			 작성일
                     </th>
                     <th>
              		         관리
                     </th>
                   </tr>
                 </thead>
                 <tbody id="travelList">
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html>