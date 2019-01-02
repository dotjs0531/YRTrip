<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script>
	$(function() {
		$(function() {
			$
					.getJSON(
							"getManageProductListAjax",
							null,
							function(datas) {
								console.log(datas);
								for (i = 0; i < datas.length; i++) {

									var str = "<tr><td>"
											+ "<strong>PR"
											+ datas[i].itemId
											+ "</strong>"
											+ "</td><td>"
											+ "<strong>"
											+ datas[i].itemName
											+ "</strong>"
											+ "</td><td>"
											+ datas[i].itemEa
											+ "</td><td>"
											+ datas[i].itemMethod
											+ "</td><td>"
											+ datas[i].sellerId
											+ "</td><td>"
											+ datas[i].itemCondition
											+ "</td><td>"
											+ "<button type=\"button\" class=\"btn btn-success mr-2\" onclick=\"location.href='./getProduct?itemId='\""
											+ datas[i].itemId
											+ ">상세보기</button>"
											+ "<button type=\"button\" class=\"btn btn-danger mr-2 btnDel\">삭제</button>"
											+ "<input type=\"hidden\" id=\"itemId\" value=\""+datas[i].itemId+"\">"
											+ "</td></tr>"
									$(str).appendTo("#productList");
								}
							});
		});

		$("#productList").on("click", ".btnDel", function() {
			var itemId = $(this).closest('#productList').find('#itemId').val();
			if (confirm("삭제하시겠습니까?")) {
				var params = "itemId=" + itemId;
				var url = "deleteProductAjax";
				$.getJSON(url, params, function(datas) {
					$(itemId).remove();
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
				<div class="input-group col-xs-12"
					style="width: 300px; float: right;">
					<input type="text" class="form-control file-upload-info"
						style="width: 200px;"> <span class="input-group-append">
						<button class="file-upload-browse btn" type="button">검색</button>
					</span>
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
						<tbody id="productList">

						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>
</html>