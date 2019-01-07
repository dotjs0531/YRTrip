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
	});
	
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
             <div class="input-group col-xs-12" style="float:right;">
                   <!-- 검색 창 -->
                	<!-- 	<form name="frm" class="form-inline">
                			<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
								
								검색 내용
								<div style="padding-bottom:5px">
								<label class="col-sm-2 control-label">검색어</label>
								<select name="searchCondition" class="form-control">
									<option value="qnaTitle">제목
									<option value="qnaContent">내용
								</select>
								<input type="text" name="searchKeyword" class="form-control">
								</div>
								
								문의날짜
								<div style="padding-bottom:5px">
								<label class="col-sm-2 control-label">문의일</label>
								<input type="date" name="searchDateStart" class="form-control">
								<input type="date" name="searchDateEnd" class="form-control">
								</div> 
								
								답변여부
								<div>
								<label class="col-sm-2 control-label">답변여부</label>
								<input type="radio" name="qnaAnswer" value="" class="form-control" checked>전체&nbsp;
								<input type="radio" name="qnaAnswer" id="complete" value="완료" class="form-control">완료 &nbsp;
								<input type="radio" name="qnaAnswer" id="incomplete" value="미완료" class="form-control">미완료
								<button class="btn btn-warning signupbtn" style="float:right; margin-right:10px">검색</button>
								</div>
         					</div>
						</form> -->
                 </div>
             <div class="table-responsive">
               <table class="table table-striped" style="text-align: center;">
                 <thead>
                   <tr>
                     <th>
                  	  	 문의글번호
                     </th>
                     <th>
                       	제목
                     </th>
                     <th>
                       	내용
                     </th>
                     <th>
              		         작성자
                     </th>
                     <th>
              		         답변여부
                     </th>
                     <th>
              		         작성일자
                     </th>
                     <th>
               		      관리
                     </th>
                   </tr>
                 </thead>
                 <tbody id="qnaList">
                 </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
</body>
</html>