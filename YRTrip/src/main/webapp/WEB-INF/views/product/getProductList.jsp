<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>상품</title>
<!-- 라디오버튼 -->
<link href="resources/css/icheck-bootstrap.css" rel="stylesheet">
<link href="./resources/css/product.bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/css/product.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		var productMenu = document.getElementById("productMenu");
		productMenu.className = 'current-menu-item';
		
		function go_page(page) {
			document.frm.page.value = page;
			document.frm.submit();
		}
	});
</script>
<script>
/* 	$(function(){
		itemIdeach = $(item)
		$(".itemPrice").each(function(index, item){
			var money = $(item).text();
			console.log(money);
			var money2 = money.toLocaleString();
			console.log(money);
			$(item).text(money2);
		});
	}); */
</script>
<script>
	$(function() {
		$('#product_view')
				.on(
						'show.bs.modal',
						function(e) {
							var button = $(event.target) // Button that triggered the modal
							console.log(button);
							var buttonstr = button.attr("id").substr(5);
							var param = {
								itemId : buttonstr
							}
							$
									.getJSON(
											"getProductAjax",
											param,
											function(data) {
												var itemId = data.itemId;
												var itemName = data.itemName;
												var itemContent = data.itemContent;
												var itemImgList = data.itemPic;
												console.log(itemImgList);
												var itemImgSlipt = itemImgList
														.split(',');
												console.log(itemImgSlipt);
												var itemStar = data.itemStar;
												var num = itemImgSlipt.length;
												console.log(num);
												$("#modal-title")
														.html(itemName);
												$("#popup_itemId").html(itemId);
												$("#popup_itemContent").html(
														itemContent);
												$("div#itemStar").find("span").html(itemStar);
												
												//캐러셀
												$("#item0").find("img").attr("src", "./images/product/"+ itemImgSlipt[0]);
												
												for (var i = 1; i < itemImgSlipt.length; i++) { //1, 2 ...
													$(".carousel-indicators").append("<li data-target=\"#quote-carousel\" data-slide-to="+ i +"></li>");
													$(".imgplus").append("<div class=\"item\" id=\"item"+i+"\"><div class=\"row\"><div class=\"col-12\"><img></div></div></div>");
													$("#item"+i).find("img").attr("src","./images/product/"+ itemImgSlipt[i]);
												}

											});
						});
	});
</script>
<script>
	$(function() {
		$(".insertbtn").click(function(e) {
			if ("${sessionScope.login.userId}" == '') {
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
			} else {
				$.ajax({
					type : "GET",
					url : "travelCountForInfo",
					data : {
						userId : "${sessionScope.login.userId}"
					},
					datatype : "integer",
					success : function(data) {
						console.log(data);
						if (data == 0) {
							alert("여행글 하나 이상 작성후 물품판매 가능합니다");
						} else {
							window.location = "./insertProduct";
						}
					}
				});
			}
		});
		$('[data-toggle="tooltip"]').tooltip();
		$(".loginRequired").click(function(e) {
			if ("${sessionScope.login.userId}" == '') {
				e.preventDefault();
				alert("로그인이 필요한 서비스입니다");
			}
		})
	});
</script>
<style>
#login-column {
   width:100% !important ;
   margin: 0 10px !important;
}
/* a#warn:hover {
	
}
 */
#btn-custom {
	background: #f9bf3b none repeat scroll 0 0;
	border-radius: 3px;
	color: #fff;
	display: inline-block;
	margin-top: 20px;
	padding: 10px 40px;
	text-transform: uppercase;
}

#login-column {
	width: 100%;
	margin: 0 10px;
}

.nav>li>a:focus, .nav>li>a:hover {
	background-color: white;
}
</style>
</head>
<body>
	<form name="frm" class="form-inline">
		<input type="hidden" name="page" />
	</form>
	<section class="about_us_area" id="about" style="background-color:white;">
		<!-- Page Content -->
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-4">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">중고거래</h2>
						</div>
						<ul class="price-list">
							<li><a href="getProductList" style="color: black">전체보기</a></li>
							<li><a href="getProductList?itemCategory=의류"
								style="color: black">의류</a></li>
							<li><a href="getProductList?itemCategory=티켓"
								style="color: black">티켓/쿠폰</a></li>
							<li><a href="getProductList?itemCategory=전자기기"
								style="color: black">전자기기</a></li>
							<li><a href="getProductList?itemCategory=여행도서"
								style="color: black">여행도서</a></li>
							<li><a href="getProductList?itemCategory=USIM"
								style="color: black">USIM</a></li>
							<li><a href="getProductList?itemCategory=기타"
								style="color: black">기타</a></li>
						</ul>
						<div class="order-buton">
							<button class="btn insertbtn" id="btn-custom">상품등록</button>
						</div>
					</div>
				</div>
				<!-- /.col-lg-3 -->

				<!-- 여기서 부터 가운데 창! -->
				<!-- 검색시작 -->
				<div class="col-8">
					<form name="./getProductList" class="form-inline">
						<div class="form-group single-pricing-table"
							style="width: 100%; text-align: left; padding: 20px; color: black;">

							<!-- 제품이름 & 제품내용 -->
							<div class="row">
								<label class="col-2 control-label" for="searchClass">카테고리
								</label> <label class="col-4 control-label" for="searchCondition">검색어</label>
							</div>

							<div style="padding-bottom: 5px">

								<select name="itemCategory" class="form-control"
									id="searchClass">
									<option value="">전체</option>
									<option value="의류">의류</option>
									<option value="티켓">티켓/쿠폰</option>
									<option value="전자기기">전자기기</option>
									<option value="여행도서">여행도서</option>
									<option value="USIM">USIM</option>
									<option value="기타">기타</option>
								</select>
								<!-- 
									<input type="hidden" name="itemCategory" id="itemCategory"/> -->

								<select name="searchCondition" class="form-control"
									id="searchCondition">
									<option value="itemName">제품명</option>
									<option value="itemContent">내용</option>
								</select> <input type="text" name="searchKeyword" class="form-control"
									placeholder="검색할 내용을 입력하세요" style="width:450px">
							</div>
							<!-- 가격 -->
							<!--  -->
							<!-- 구매가능여부 -->
							<div class="row" >
							<div class="col-2">
								<label class="control-label">구매가능여부</label>
							</div>
							<div style="word-spacing:10px" class="col-6">
								<input type="radio" name="itemOrderdetail" value=""
								class="vertical" checked style="">모두보기  
						
							<input
								type="radio" name="itemOrderdetail" value="구매가능"
								class="">구매가능 <input type="radio"
								name="itemOrderdetail" value="구매불가" class="">구매불가							
							</div>
							</div>
							<div>
								<button class="btn btn-warning signupbtn"
									style="float: right; margin-right: 10px">검색</button>
							</div>

							<input type="hidden" name="page">
						</div>
					</form>

					<div class="space-ten"></div>
					<!--상품상세 페이지-->
					<div class="col-lg-container">
						<div class="row">
							<c:forEach items="${productList}" var="product">

								<div class="col-4">
									<div class="thumbnail"
										style="max-height: 300px; min-height: 300px">
										<c:set var="productPicFile"
											value="${fn:split(product.itemPic, ',')[0]}" />
										<c:set var="pic" value="${productPicFile}" />
										<a href="getProduct?itemId=${product.itemId}"> <img
											src="./images/product/${pic}" alt="" class="img-fluid"
											style="max-height: 140px; min-height: 140px;"></a>
										<div class="caption">

											<h4 class="pull-right" id="itemPrice${product.itemId}" class="itemPrice">￦<fmt:formatNumber value="${product.itemPrice}" pattern="#,###"/></h4>
											<h4 class="text-truncate">
												<a href="getProduct?itemId=${product.itemId}">${product.itemName}</a>
											</h4>
											<div class="space-five"></div>
											<c:forEach items="${product.itemOrderdetail}" var="orderd"
												step="4">
												<c:if test="${orderd eq '구매가능'}">
													<p class="btn-which btn btn-xs btn-success">${product.itemOrderdetail}</p>
												</c:if>
												<c:if test="${orderd eq '구매불가'}">
													<p class="btn-which btn btn-xs btn-danger">${product.itemOrderdetail}</p>
												</c:if>
											</c:forEach>

											<p class="btn btn-xs btn-info">${product.itemCondition}</p>
											<p class="pull-right">
												<span class="glyphicon glyphicon-star"></span> <a href="#">${product.itemStar}</a>
											</p>

										</div>
										<div class="space-five"></div>
										<div class="btn-ground text-center">
											<!-- <button> -->
											<a class="loginRequired" data-toggle="tooltip"
												data-placement="bottom" title="상세페이지에서 수량결정하세요"
												href="./getProduct?itemId=${product.itemId}#quant"> <i
												class="fa fa-shopping-cart"></i> Cart
											</a>


											<!-- </button> -->
											<button id="item+${product.itemId}" class="btn btn-link"
												data-toggle="modal" data-target="#product_view">
												<i class="fa fa-search"></i> Quick View
											</button>
										</div>
										<%-- <c:forEach items="${order}" var="review">
												<p>
													<a href="#">${review.reviewName}</a>
												</p>
											</c:forEach> --%>

										<div class="space-five"></div>

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
											<div class="carousel slide" data-ride="carousel"
												id="quote-carousel">
												<!-- Bottom Carousel Indicators -->
												<ol class="carousel-indicators">
												<!-- 타켓0 -->
													<li data-target="#quote-carousel" data-slide-to="0"
														class="active"></li>
												</ol>

												<!-- Carousel Slides / Quotes -->
												<div class="carousel-inner text-center imgplus">
													<!-- 사진 0 -->
													<div class="item active" id="item0">
														<div class="row">
															<div class="col-12">
																<img src="">
															</div>
														</div>
													</div>
													
												</div>

												<!-- Carousel Buttons Next/Prev -->
												<a data-slide="prev" href="#quote-carousel"
													class="left carousel-control"></a> <a data-slide="next"
													href="#quote-carousel" class="right carousel-control"></a>
											</div>
										</div>
										<div class="col-md-6 product_content">
											<h4>
												<span class="pull-right" id="popup_itemId"></span>
											</h4>
											<div class="rating" id="itemStar">
												<span class="glyphicon glyphicon-star"></span>
												<!-- rating  -->
											</div>
											<p></p>
											<div class="card">
												<h3>상세설명</h3>
												<div id="popup_itemContent" class="pull-right "></div>
											</div>
											<div class="row">
												<!-- <div class="col-md-4 col-sm-6 col-xs-12">
													<select class="form-control" name="select">
														<option value="" selected="">Color</option>
														<option value="black">Black</option>
														<option value="white">White</option>
														<option value="gold">Gold</option>
														<option value="rose gold">Rose Gold</option>
													</select>
												</div>
												end col
												<div class="col-md-4 col-sm-6 col-xs-12">
													<select class="form-control" name="select">
														<option value="">Capacity</option>
														<option value="">16GB</option>
														<option value="">32GB</option>
														<option value="">64GB</option>
														<option value="">128GB</option>
													</select>
												</div>
												end col
												<div class="col-md-4 col-sm-12">
													<select class="form-control" name="select">
														<option value="" selected="">QTY</option>
														<option value="">1</option>
														<option value="">2</option>
														<option value="">3</option>
													</select>
												</div> -->
												<!-- end col -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지 번호 -->
					<%-- 			<div class="btn-ground text-center">
											<button type="button" class="btn"
												style="background-color: #f9bf3b; color: white">
												<i class="fa fa-shopping-cart"></i> 장바구니
											</button>
											<button id="item${product.itemId}" type="button" class="btn"
												style="background-color: #f9bf3b; color: white"
												data-toggle="modal" data-target="#product_view">
												<i class="fa fa-search"></i>&nbsp; 퀵 뷰
											</button>
										</div> --%>
				<c:if test="${not empty productList}">
					<div style="padding-top: 50px;">
						<my:paging paging="${paging}" jsFunc="go_page" />
					</div>
				</c:if>

				</div>
				<!-- /.col-lg-9 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	
	<!-- Bootstrap core JavaScript -->
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>