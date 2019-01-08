<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="com.yrtrip.app.Paging" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> -->

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
   
   $("#productList").empty();
   $("#pagination").html("");

   if(page == undefined || page == ""){
      page=1
      
   };      
   $("#page").val(page);
   
   $.ajax({
      
      url : "getManageProductListPaging",
      data : $("#frm").serialize(),
      type : "POST",
      dataType : "json",
      error : function(xhr, status, msg) {
         alert("상태값 :" + status + "Http에러메시지 :" + msg);
      },
      success : function(data) {
         console.log(data.mproductList);
         for (i = 0; i < data.mproductList.length; i++) {
              var tr = "<tr id=\"PR"+data.mproductList[i].itemId+"\"><td>"
				+ "<strong>PR"+ data.mproductList[i].itemId+ "</strong>"
				+ "</td><td>"
				+ "<strong>"+ data.mproductList[i].itemName+ "</strong>"
				+ "</td><td>"
				  + data.mproductList[i].itemEa
				+ "Ea</td><td>"
				  + data.mproductList[i].itemMethod
				+ "</td><td>"
				  + data.mproductList[i].sellerId
				+ "</td><td>"
				  + data.mproductList[i].itemCondition
				+ "</td><td>"
				+ "<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getProduct?itemId="+ data.mproductList[i].itemId +"'\">상세보기</button>"
				+ "<button type=\"button\" value='"+data.mproductList[i].itemId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
				+ "</td></tr>"
              $(tr).appendTo("#productList");
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
	$(function() {/* 
		$(function() {
			$.getJSON("getManageProductListAjax", null, function(datas) {
					for (i = 0; i < datas.length; i++) {
						var str = "<tr id=\"PR"+datas[i].itemId+"\"><td>"
								+ "<strong>PR"+ datas[i].itemId+ "</strong>"
								+ "</td><td>"
								+ "<strong>"+ datas[i].itemName+ "</strong>"
								+ "</td><td>"
								  + datas[i].itemEa
								+ "Ea</td><td>"
								  + datas[i].itemMethod
								+ "</td><td>"
								  + datas[i].sellerId
								+ "</td><td>"
								  + datas[i].itemCondition
								+ "</td><td>"
								+ "<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='getProduct?itemId="+ datas[i].itemId +"'\">상세보기</button>"
								+ "<button type=\"button\" value='"+datas[i].itemId+"' class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
								+ "</td></tr>"
									$(str).appendTo("#productList");
								}
							});
		});
 */
		$("#productList").on("click", ".btnDel", function() {
			var itemId = $(this).closest('.btnDel').val();
			if (confirm("삭제하시겠습니까?")) {
				var params = "itemId=" + itemId;
				var url = "deleteProductAjax";
				$.getJSON(url, params, function(datas) {
					$("#PR" + itemId).remove();
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
				<h4 class="card-title">
					<strong>상품내역관리</strong>
				</h4>
				<div class="input-group col-xs-12" style="width: 300px; float: right;">
					<!-- <input type="text" class="form-control file-upload-info"
						style="width: 200px;"> <span class="input-group-append">
						<button class="file-upload-browse btn" type="button">검색</button>
					</span> -->
					<form name="frm" id="frm" class="form-inline">
		                <input type="text" class="form-control file-upload-info" name="searchKeyword" style="width:200px;" placeholder="회원ID를 입력해주세요.">
		                <span class="input-group-append">
		                  <button type="button" class="file-upload-browse btn" onclick='go_page(1)'>검색</button>
		                </span>
		            	<input type="hidden" name="page" id="page" >
		         	</form>
				</div>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead style="text-align: center;">
							<tr>
								<th>글번호</th>
								<th>상품명</th>
								<th>수량</th>
								<th>결제방식</th>
								<th>판매자ID</th>
								<th>상품상태</th>
								<th>관리</th>
							</tr>
						</thead>
						
						<tbody id="productList" style="text-align: center;"></tbody>
						
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