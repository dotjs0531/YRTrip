<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  
<!-- 별점 등록부분 -->
<link href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<!--suppress JSUnresolvedLibraryURL -->
<script src="resources/js/star-rating.js" type="text/javascript"></script>
 
<!-- 다중파일 업로드 -->
<link href="resources/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="resources/js/fileinput.js" type="text/javascript"></script>
    
<style class="cp-pen-styles">
#img { 
	float:left;
    width: auto; 
    height: auto;
    max-width: 180px;
    max-height: 180px;
} 
.modal-content{
  margin-top:70px;
}
@font-face {
 font-family: 'NanumSquareRoundEB';
 src: url(resources/fonts/NanumSquareRoundEB.eot);
 src: url(resources/fonts/NanumSquareRoundEB.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundEB.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundEB.ttf) format('truetype');
}
@font-face {
 font-family: 'NanumSquareRoundB';
 src: url(resources/fonts/NanumSquareRoundB.eot);
 src: url(resources/fonts/NanumSquareRoundB.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundB.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundB.ttf) format('truetype');
}
@font-face {
 font-family: 'NanumSquareRoundR';
 src: url(resources/fonts/NanumSquareRoundR.eot);
 src: url(resources/fonts/NanumSquareRoundR.eot?#iefix) format('embedded-opentype'),
      url(resources/fonts/NanumSquareRoundR.woff) format('woff'),
      url(resources/fonts/NanumSquareRoundR.ttf) format('truetype');
}
</style>
<script>
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	};
</script>
<script>
/* jQuery( document ).ready(function( $ ) {
	$("#fileInput").on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}

		// 추출한 파일명 삽입
		$("#userfile").val(filename);
	});
}); */
$(function() {
	$('#updateMyReviewForm').on('show.bs.modal', function(e) {
		var button = $(event.target) // Button that triggered the modal
		console.log(event);
		var param = {
			orderId :  button.attr("id").substr(6)
		}
		$.getJSON("getMyReview", param, function(data){
			var orderId = data.orderId;
			var reviewStar = data.reviewStar;
			var reviewContent = data.reviewContent;
			var reviewPic = data.reviewPic;
			
			$("#reviewId").val(orderId);
			$(".reviewStar").val(reviewStar);
			//$(".reviewStar").attr('value', reviewStar);
			$("textarea[name=reviewContent]").text(reviewContent);
		});
	});
});
</script>

<script src="//use.typekit.net/xyl8bgh.js"></script>
<script>try{Typekit.load();}catch(e){}</script>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
</head>
<body>
    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">마이페이지</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black">여행정보</a></li>
                            <li><a href="./getMyLikedTravelList?userId=${sessionScope.login.userId}"
                            	   style="color:black">좋아요</a></li>
                            <li><a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                            	   style="color:black"><strong>상품</strong></a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive">
                	
                		<!-- 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="sellerId" value="${sessionScope.login.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
                		<div class="form-group"><br/>
                			<table style="width:100%">
                				<tr>
                					<td style="text-align:center;"><h2>
                						<a href="./getMyProductList?sellerId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 상품</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyOrderList?buyerId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 구매내역</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyReviewList?buyerId=${sessionScope.login.userId}"
                						   style="color:black; font-family: 'NanumSquareRoundEB';">나의 리뷰</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
                	<div>
                	
					<c:forEach items="${MyReviewList}" var="review">
					<c:forEach items="${MyOrderList}" var="order">
					<c:if test="${not empty review.reviewContent}">
            			<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black;">
							<h5 class="control-label" style="font-family: 'NanumSquareRoundR'"><strong>${order.orderId}</strong> &nbsp;&nbsp; ${review.reviewDate}</h5><br/>
							<input type="checkbox" class="cbx" id="${order}" name="userId" value="${order.orderId}" style="display: none;" class="form-control">
							<c:set var="reviewPicname" value="${fn:split(review.reviewPic, ',')}"/>
							<c:forEach items="${reviewPicname}" var="pic">
								<a href="getProduct?itemId=${order.itemId}"><img id="img" src="./images/review/${pic}" style="height:200px" /></a>
							</c:forEach>
							<!-- 별점 표시 부분 -->
							<input id="reviewStar" name="reviewStar" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1"
								   value="${review.reviewStar}" style="" disabled>
							<p class="control-label" style="font-family: 'NanumSquareRoundR'; margin-left:190px;
								overflow:hidden; text-overflow:ellipsis; display:-webkit-box; -webkit-line-clamp:7;
								-webkit-box-orient:vertical; word-wrap:break-word; height:10em;">${review.reviewContent}</p>
							<!-- 수정/삭제 버튼 -->
							<form action="./deleteMyReview" method="post">
								<input type="hidden" name="orderId" value="${order.orderId}">
								<button type="submit" class="btn btn-default" style="float:right;">삭제</button>
							</form>
							<button type="button" class="btn btn-default" id="review${order.orderId}" 
									data-toggle="modal" data-target="#updateMyReviewForm" style="float:right; margin-right:10px">수정</button>
							<p style="clear:both"/>
						</div>
					</c:if>
					</c:forEach>
					</c:forEach><br/>
					
					
                    <!-- 페이지 번호 -->
					<c:if test="${not empty MyReviewList}">
                    <div>
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                    </c:if>
                    
                    <!-- 리뷰수정 페이지 -->			
					<div class="modal fade" id="updateMyReviewForm">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
								</div>
								<!-- body -->
								<div class="modal-body">
									<div class="container">
										<div id="login-row" class="row justify-content-center align-items-center">
											<div id="login-column" class="col-md-6">
												<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
					            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
													<form action="./updateMyReview" method="post" enctype="multipart/form-data">										
														<input type="hidden" id="reviewId" name="orderId">
														<h4 class="text-info" style="color:black;">리뷰 수정</h4><hr/>
														<div class="form-group">
															<!-- <img id="reviewimg" src="./images/review/Penguins.jpg" style="height:200px; float:left" /> -->
															<!-- 별점 등록 부분 -->
															<input name="reviewStar" class="rating rating-loading reviewStar" data-min="0" data-max="5" data-step="0.1" >
															<textarea name="reviewContent" class="form-control" placeholder="리뷰 내용을 입력해주세요." rows="5" style="margin-bottom:10px"></textarea>
															
															<!-- 사진 등록 부분 -->
								 							<!-- <input type="file" name="reviewPicFile" id="fileInput" data-class-button="btn btn-default"
																	data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control"
																	tabindex="-1" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
															<div class="bootstrap-filestyle input-group">
																<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
																<span class="group-span-filestyle input-group-btn" tabindex="0">
																	<label for="fileInput" class="btn btn-default ">
																		<span class="glyphicon fa fa-upload"></span>
																	</label>
																</span>
															</div> -->
															
															<!-- 다중파일 업로드 -->
															<div class="container my-4" style="width:100%; padding:0">
																<div class="form-group">
															    	<div class="file-loading">
															        	<input multiple="multiple" id="file-5" class="file" type="file" name="reviewPicFile" multiple data-preview-file-type="any" data-upload-url="#" data-theme="fas">
															        </div>
															    </div>
															</div>
															
														</div>
														<div class="form-group">
															<input type="submit" class="btn btn-default"  style="float:right;" value="수정">
															<p style="clear:both"/>
														</div>
													</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>	<!-- end of modal-body -->
							</div> <!-- end of modal-content -->
						</div> 
					</div> <!-- end of modal -->
					</div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>