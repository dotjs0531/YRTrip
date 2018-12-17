<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>상품</title>

<link href="./resources/css/product.bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link href="resources/css/product.css" rel="stylesheet"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	}
</script>
<script>
	$(function() {
		$('#product_view').on('show.bs.modal', function(e) {
			var button = $(event.target) // Button that triggered the modal
			console.log(event);
			var param = {
				itemId : button.attr("id").substr(4)
			}
			$.getJSON("getProductAjax", param, function(data) {
				var itemId = data.itemId;
				var itemName = data.itemName;
				console.log(itemId);
				$("#modal-title").html(itemName);
				$("#popup_itemId").html(itemId);
			})
		});
	});
</script>
</head>

<body>
<form name="frm" class="form-inline">
	<input type="hidden" name="page" />
</form>
<section class="about_us_area" id="about">
	<!-- Page Content -->
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-4">
				<div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">카테고리</h2>
                        </div>
                        <ul class="price-list">
                        	<li><a href="#" style="color:black">전체보기</a></li>
                            <li><a href="#" style="color:black">의류</a></li>
                            <li><a href="#" style="color:black">티켓/쿠폰</a></li>
                            <li><a href="#" style="color:black">전자기기</a></li>
                            <li><a href="#" style="color:black">여행도서</a></li>
                            <li><a href="#" style="color:black">USIM</a></li>
                            <li><a href="#" style="color:black">기타</a></li>
                        </ul>
                        <div class="order-buton">
	                            <a href="#">상품요청</a>
	                        </div>
	                        <div class="order-buton">
	                            <a href="insertProduct">상품등록</a>
	                        </div>
                    </div>
			</div>
			<!-- /.col-lg-3 -->

			<!-- 여기서 부터 가운데 창! -->
			<div class="col-8">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<!--상품상세 페이지-->
				<div class="col-lg-container">
					<div class="row">
						<c:forEach items="${productList}" var="product">
							<div class="col-4">
								<div class="thumbnail">
									<img
										src="http://tech.firstpost.com/wp-content/uploads/2014/09/Apple_iPhone6_Reuters.jpg"
										alt="" class="img-fluid">
									<div class="caption">

										<h4 class="pull-right">${product.itemPrice}</h4>
										<h4>
											<a href="getProduct?itemId=${product.itemId}">${product.itemName}</a>
										</h4>
										<p>${product.itemContent}</p>
										<p>${product.itemOrderdetail}</p>
										<p>${product.itemCategory}</p>
										<p>${product.itemCondition}</p>
									</div>
									<div class="ratings text-center">
										<p>
											<!-- ${product.itemStar} 받아서 '별'로 나타내는 거 !!-->
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <a href="#">
												${product.itemStar}<br />(15 reviews)
											</a>
										</p>
									</div>
									<div class="space-ten"></div>
									<div class="btn-ground text-center" >
										<button type="button" class="btn" style="background-color: #f9bf3b; color:white">
											<i class="fa fa-shopping-cart"></i> Add To Cart</button>
										<div class="space-two"></div>
										<button id="item${product.itemId}"
										 type="button" class="btn" style="background-color: #f9bf3b; color:white" data-toggle="modal"
											data-target="#product_view">
											<i class="fa fa-search"></i>&nbsp; Quick View
										</button>
									</div>
									<div class="space-ten"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- 팝업창 -->

				<div class="modal fade product_view" id="product_view">
					<div class="modal-dialog" style="padding-top: 50px;">
						<div class="modal-content">
							<div class="modal-header">
								<a href="#" data-dismiss="modal" class="class pull-left"> <span
									class="glyphicon glyphicon-remove"></span></a>
								<h3 class="modal-title" id="modal-title"></h3>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-6 product_img">
										<img
											src="http://img.bbystatic.com/BestBuy_US/images/products/5613/5613060_sd.jpg"
											class="img-fluid">
									</div>
									<div class="col-md-6 product_content">
										<h4>
											<span class="pull-right" id="popup_itemId">제품번호:</span>
										</h4>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span> <span
												class="glyphicon glyphicon-star"></span>
											<!-- rating  -->
										</div>
										<p>${product.itemContent}</p>
										<h3 class="cost">
											<span class="glyphicon glyphicon-usd"></span><small
												class="pre-cost"><span
												class="glyphicon glyphicon-usd"></span></small>
										</h3>
										<div class="row">
											<div class="col-md-4 col-sm-6 col-xs-12">
												<select class="form-control" name="select">
													<option value="" selected="">Color</option>
													<option value="black">Black</option>
													<option value="white">White</option>
													<option value="gold">Gold</option>
													<option value="rose gold">Rose Gold</option>
												</select>
											</div>
											<!-- end col -->
											<div class="col-md-4 col-sm-6 col-xs-12">
												<select class="form-control" name="select">
													<option value="">Capacity</option>
													<option value="">16GB</option>
													<option value="">32GB</option>
													<option value="">64GB</option>
													<option value="">128GB</option>
												</select>
											</div>
											<!-- end col -->
											<div class="col-md-4 col-sm-12">
												<select class="form-control" name="select">
													<option value="" selected="">QTY</option>
													<option value="">1</option>
													<option value="">2</option>
													<option value="">3</option>
												</select>
											</div>
											<!-- end col -->
										</div>
										<div class="space-ten"></div>
										<div class="btn-ground">
											<button type="button" class="btn btn-primary">
												<span class="glyphicon glyphicon-shopping-cart"></span> Add
												To Cart
											</button>
											<button type="button" class="btn btn-primary">
												<span class="glyphicon glyphicon-heart"></span> Add To
												Wishlist
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 페이지 번호 -->
                    <div style="padding-top:50px;">
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>

			</div>
			<!-- /.col-lg-9 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</section>
	<!-- Bootstrap core JavaScript -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>