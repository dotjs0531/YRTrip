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
			
			var str = "<tr id=\"USR"+datas[i].userId+"\"><td>"
			
					 + "<input type=\"checkbox\" name=\"userNoList\" value='"+datas[i].userId+"' />" 
					
					/* + "<div class=\"form-check\">"
					+ "<label class=\"form-check-label\">"
						+ "<input type=\"checkbox\" class=\"form-check-input\" name=\"travelNoList\" value='"+datas[i].itemId+"'>"
					+ "</label></div>" */

					+ "</td><td>"
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
	});

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
<!-- 전체 선택 -->
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=userNoList]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=userNoList]").prop("checked",false);
        }
    })
});
</script>
</head>
<body>
<div class="col-lg-12 grid-margin stretch-card">
         <div class="card">
           <div class="card-body">
             <h4 class="card-title"><strong>회원관리</strong></h4>
             <div class="input-group col-xs-12" style="width:300px; float:right;">
                  <input type="text" class="form-control file-upload-info">
                  <span class="input-group-append">
                     <button class="file-upload-browse btn" type="button">검색</button>
                   </span>
                 </div>
             <div class="table-responsive">
             
             <form action="deletUserList">
               <table class="table table-striped" style="text-align:center;">
                 <thead>
                   <tr>
					 <th>
						<div class="form-check">
                      		<label class="form-check-label" style="margin-left:20px">
                        		<input type="checkbox" class="form-check-input" id="checkall">
                      		</label>
                    	</div>
                     </th>
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
               
               <button class="btn btn-default" style="float:right; margin:20px 54px 0 0">삭제</button>
			   <p style="clear:both"/>
               
               </form>
               
             </div>
           </div>
         </div>
       </div>
</body>
</html>