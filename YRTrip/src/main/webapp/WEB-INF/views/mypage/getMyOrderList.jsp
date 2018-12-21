<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
<!-- 체크박스 -->
<script src='//static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
<script src='//static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>

<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/andreasstorm/pen/deRvMy" />
<script src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>

<style class="cp-pen-styles">
html,
body {
  height: 100%;
}
body {
  display: grid;
}
#reviewimg { 
    width: auto; 
    height: auto;
    max-width: 100px;
    max-height: 100px;
} 
.check {
  cursor: pointer;
  position: relative;
  margin: auto;
  width: 18px;
  height: 18px;
  -webkit-tap-highlight-color: transparent;
  transform: translate3d(0, 0, 0);
}
.check:before {
  content: "";
  position: absolute;
  top: -15px;
  left: -15px;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: rgba(34,50,84,0.03);
  opacity: 0;
  transition: opacity 0.2s ease;
}
.check svg {
  position: relative;
  z-index: 1;
  fill: none;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke: #c8ccd4;
  stroke-width: 1.5;
  transform: translate3d(0, 0, 0);
  transition: all 0.2s ease;
}
.check svg path {
  stroke-dasharray: 60;
  stroke-dashoffset: 0;
}
.check svg polyline {
  stroke-dasharray: 22;
  stroke-dashoffset: 66;
}
.check:hover:before {
  opacity: 1;
}
.check:hover svg {
  stroke: #4285f4;
}
.cbx:checked + .check svg {
  stroke: #4285f4;
}
.cbx:checked + .check svg path {
  stroke-dashoffset: 60;
  transition: all 0.3s linear;
}
.cbx:checked + .check svg polyline {
  stroke-dashoffset: 42;
  transition: all 0.2s linear;
  transition-delay: 0.15s;
}
.checkboxes label {
  display: block;
  float: left;
  padding-right: 10px;
  white-space: nowrap;
  vertical-align: middle;
}
.checkboxes input {
  vertical-align: middle;
}
.checkboxes label span {
  vertical-align: middle;
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
/* 리뷰등록 modal */
jQuery( document ).ready(function( $ ) {
		$("#fileInput").on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}

			// 추출한 파일명 삽입
			$("#userfile").val(filename);
		});
});
	$(function() {
		$('#getMyOrder').on('show.bs.modal', function(e) {
			var button = $(event.target) // Button that triggered the modal
			console.log(event);
			var param = {
				orderId :  button.attr("id").substr(5)
			}
			$.getJSON("getMyOrder", param, function(data) {
				var orderId = data.orderId;
				var orderDate = data.orderDate;
				var itemDeliveryno = data.itemDeliveryno;

				var itemMethod = data.itemMethod;
				var orderEa = data.orderEa;
				var orderPrice = data.orderPrice;
				var totalPrice = orderEa*orderPrice;
				
				$("#orderId").html(orderId);
				$("#orderDate").html(orderDate);
				$("#itemDeliveryno").html(itemDeliveryno);
				
				$("#itemMethod").html(itemMethod);
				$("#orderEa").html(orderEa+"개");
				$("#orderPrice").html(orderPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
				$("#totalPrice").html(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
			})
		});
		$('#insertMyReviewForm').on('show.bs.modal', function(e) {
			var button = $(event.target) // Button that triggered the modal
			console.log(event);
			var param = {
				orderId :  button.attr("id").substr(6)
			}
			$.getJSON("getMyOrder", param, function(data) {
				var orderId = data.orderId;
				$("#reviewId").val(orderId);
			})
		});
	});
</script>

<script src="//use.typekit.net/xyl8bgh.js"></script>
<script>try{Typekit.load();}catch(e){}</script>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch' href='resources/css/mypage__codepen_io_andytran_pen.css'>
<link rel="stylesheet" href="resources/css/mypage.css">
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
                            <li><a href="./getMyLikedList?userId=${sessionScope.login.userId}"
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
                						   style="color:black; font-family: 'NanumSquareRoundEB';">나의 거래내역</a></h2></td>
                					<td style="text-align:center"><h2>
                						<a href="./getMyReviewList?buyerId=${sessionScope.login.userId}"
                						   style="color:#666666; font-family: 'NanumSquareRoundB';">나의 리뷰</a></h2></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
                	<div>
                	<form action="deleteMyOrderList">
						<div class="container card" style="width:100%">
							<!-- Normal Demo-->
							<c:forEach items="${MyOrderList}" var="order">
								<div class="column" style="padding-bottom:20px;">
									<div class="demo-title">
									<div class="checkboxes">
										<input type="checkbox" class="cbx" id="${order.orderId}" name="orderNoList" value="${order.orderId}" style="display: none;">
										<label for="${order.orderId}" class="check">
											<svg width="18px" height="18px" viewBox="0 0 18 18">
												<path d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
												<polyline points="1 9 7 14 15 4"></polyline>
											</svg>
										</label>&nbsp;&nbsp;${order.orderId}
									</div></div>
									<!-- Post-->
									<div class="post-module">
										<!-- Thumbnail-->
										<div class="thumbnail">
											<a href="getProduct?itemId=${order.itemId}"><img src="./images/notice/1.jpg" style="height:200px" /></a>
										</div>
										<!-- Post Content-->
										<div class="post-content">
											<div class="category">${order.orderDelivery}</div>
											<h4 class="pull-right">${order.itemMethod}</h4>
											<h1 class="title"><a href="getProduct?itemId=${order.itemId}" style="color:black">${order.itemName}</a></h1>
											<h2 class="sub_title">${order.orderCondition}</h2>
											<p class="description" align="center">
												<button type="button" class="btn btn-default">
													<c:if test="${order.orderCondition eq '결제완료'}">구매확정</c:if>
													<c:if test="${order.orderCondition eq '거래완료'}">확정완료</c:if>
												</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-default" id="review${order.orderId}" data-toggle="modal" data-target="#insertMyReviewForm">
													<c:if test="${order.reviewContent == null}">리뷰작성</c:if>
													<c:if test="${order.reviewContent != null}">리뷰완료</c:if>
												</button></p>
												<div class="post-meta">
												<button type="button" class="btn btn-default pull-right" id="order${order.orderId}" data-toggle="modal" data-target="#getMyOrder">상세보기</button>
												<span class="comments" style="font-size:15px; vertical-align: middle;">${order.orderPrice} 원 / ${order.orderEa} 개</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					<input type="hidden" name="userId" value="${sessionScope.login.userId}"/>
					<c:if test="${not empty MyOrderList}">
						<button type="submit" class="btn btn-default" style="float:right;">삭제</button>
					</c:if>
					<p style="clear:both"/>
					</form>
					
                    <!-- 페이지 번호 -->
					<c:if test="${not empty MyOrderList}">
                    <div>
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                    </c:if>
                    
<!-- 거래내역 상세보기 -->
<div class="modal fade" id="getMyOrder">
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
								<h4 class="text-info" style="color:black;">주문정보</h4><hr/>
									<table style="width:100%; margin-left:10px">
										<tr>
											<td><h5 class="text-info">주문번호</h5></td>
											<td style="text-align:right;"><h5 id="orderId"></h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">주문일자</h5></td>
											<td style="text-align:right;"><h5 id="orderDate"></h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">송장번호</h5></td>
											<td style="text-align:right;"><h5 id="itemDeliveryno"></h5></td>
										</tr>
									</table>
								</div>
							</div>
							<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
								<h4 class="text-info" style="color:black;">결제정보</h4><hr/>
									<table style="width:100%; margin-left:10px">
										<tr>
											<td><h5 class="text-info">결제수단</h5></td>
											<td style="text-align:right;"><h5 id="itemMethod"></h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">상품 금액</h5></td>
											<td style="text-align:right;"><h5 id="orderPrice"></h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">구매 수량</h5></td>
											<td style="text-align:right;"><h5 id="orderEa"></h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">결제 금액</h5></td>
											<td style="text-align:right;"><h5 id="totalPrice"></h5></td>
										</tr>
									</table>
								</div>
							</div>
							<div id="login-row" class="row justify-content-center align-items-center" style="width:100%;">
            					<div class="form-group single-pricing-table" style="width:100%; text-align:left; padding: 20px; color:black; margin-left:10px">
								<h4 class="text-info" style="color:black;">배송정보</h4><hr/>
									<table style="width:100%; margin-left:10px">
										<tr>
											<td><h5 class="text-info">수령인</h5></td>
											<td style="text-align:right;"><h5 id="userName">${sessionScope.login.userName}</h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">연락처</h5></td>
											<td style="text-align:right;"><h5 id="userPhone">${sessionScope.login.userPhone}</h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">우편번호</h5></td>
											<td style="text-align:right;"><h5 id="userPost">${sessionScope.login.userPost}</h5></td>
										</tr>
										<tr>
											<td><h5 class="text-info" style="color:#5f768b;">주소</h5></td>
											<td style="text-align:right;"><h5 id="userAddress">${sessionScope.login.userAddress}</h5></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	<!-- end of modal-body -->
		</div> <!-- end of modal-content -->
	</div> 
</div> <!-- end of modal -->


<!-- 리뷰작성 페이지 -->			
<div class="modal fade" id="insertMyReviewForm">
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
								<form action="./insertMyReview" method="post" enctype="multipart/form-data">										
									<input type="hidden" id="reviewId" name="orderId">
									<h4 class="text-info" style="color:black;">리뷰 작성</h4><hr/>
									<div class="form-group">
										<!-- <img id="reviewimg" src="./images/review/Penguins.jpg" style="height:200px; float:left" /> -->
										<!-- 별점 등록 부분 -->
										<input id="input-2" name="reviewStar" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1">
										<textarea name="reviewContent" class="form-control" placeholder="리뷰 내용을 입력해주세요."></textarea>
										<!-- 다중 파일 첨부 -->
										<!-- <input multiple="multiple"  type="file" name="filename[]" /> -->
										<!-- 사진 등록 부분 -->
			 							<input type="file" name="reviewPicFile" id="fileInput" data-class-button="btn btn-default"
												data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control"
												tabindex="-1" style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">
										<div class="bootstrap-filestyle input-group">
											<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
											<span class="group-span-filestyle input-group-btn" tabindex="0">
												<label for="fileInput" class="btn btn-default ">
													<span class="glyphicon fa fa-upload"></span>
												</label>
											</span>
										</div>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-default"  style="float:right;" value="등록">
										<p style="clear:both"/>
									</div>
								</form>
							</div>
						</div>
								<%-- 
								<!-- 다중파일 업로드 -->
								<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
        							<table class="table" width="100%" border="1px">
            							<tbody id="fileTableTbody">
                							<tr>
                    							<td id="dropZone">파일을 드래그 하세요</td>
                							</tr>
            							</tbody>
        							</table>
   							 	</form>
    							<a href="#" onclick="uploadFile(); return false;" class="btn bg_01">파일 업로드</a>
    							 --%>
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
        </div>
    </section>
    <!--   end of about us area-->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="resources/js/mypage.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 다중파일 업로드 -->
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
<!-- <script type="text/javascript">
    // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 500;
 
    $(function (){
        // 파일 드롭 다운
        fileDropDown();
    });
 
    // 파일 드롭 다운
    function fileDropDown(){
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
            
            var files = e.originalEvent.dataTransfer.files;
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
 
    // 파일 선택시
    function selectFile(fileObject){
        var files = null;
 
        if(fileObject != null){
            // 파일 Drag 이용하여 등록시
            files = fileObject;
        }else{
            // 직접 파일 등록시
            files = $('#multipaartFileList_' + fileIndex)[0].files;
        }
        
        // 다중파일 등록
        if(files != null){
            for(var i = 0; i < files.length; i++){
                // 파일 이름
                var fileName = files[i].name;
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                // 파일 사이즈(단위 :MB)
                var fileSize = files[i].size / 1024 / 1024;
                
                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                    // 확장자 체크
                    alert("등록 불가 확장자");
                    break;
                }else if(fileSize > uploadSize){
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                }else{
                    // 전체 파일 사이즈
                    totalFileSize += fileSize;
                    
                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];
                    
                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSize;
 
                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSize);
 
                    // 파일 번호 증가
                    fileIndex++;
                }
            }
        }else{
            alert("ERROR");
        }
    }
 
    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSize){
        var html = "";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "    <td class='left' >";
        html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
        html += "    </td>"
        html += "</tr>"
 
        $('#fileTableTbody').append(html);
    }
 
    // 업로드 파일 삭제
    function deleteFile(fIndex){
        // 전체 파일 사이즈 수정
        totalFileSize -= fileSizeList[fIndex];
        // 파일 배열에서 삭제
        delete fileList[fIndex];
        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
    }
 
    // 파일 등록
    function uploadFile(){
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);
 
        // 파일이 있는지 체크
        if(uploadFileList.length == 0){
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }
        
        // 용량을 500MB를 넘을 경우 업로드 불가
        if(totalFileSize > maxUploadSize){
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }
            
        if(confirm("등록 하시겠습니까?")){
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = $('#uploadForm');
            var formData = new FormData(form);
            for(var i = 0; i < uploadFileList.length; i++){
                formData.append('files', fileList[uploadFileList[i]]);
            }
            
            $.ajax({
                url:"업로드 경로",
                data:formData,
                type:'POST',
                enctype:'multipart/form-data',
                processData:false,
                contentType:false,
                dataType:'json',
                cache:false,
                success:function(result){
                    if(result.data.length > 0){
                        alert("성공");
                        location.reload();
                    }else{
                        alert("실패");
                        location.reload();
                    }
                }
            });
        }
    }
</script> -->

    <script>
        jQuery(document).ready(function () {
            $("#input-21f").rating({
                starCaptions: function (val) {
                    if (val < 3) {
                        return val;
                    } else {
                        return 'high';
                    }
                },
                starCaptionClasses: function (val) {
                    if (val < 3) {
                        return 'label label-danger';
                    } else {
                        return 'label label-success';
                    }
                },
                hoverOnClear: false
            });
            var $inp = $('#rating-input');

            $inp.rating({
                min: 0,
                max: 5,
                step: 1,
                size: 'lg',
                showClear: false
            });

            $('#btn-rating-input').on('click', function () {
                $inp.rating('refresh', {
                    showClear: true,
                    disabled: !$inp.attr('disabled')
                });
            });


            $('.btn-danger').on('click', function () {
                $("#kartik").rating('destroy');
            });

            $('.btn-success').on('click', function () {
                $("#kartik").rating('create');
            });

            $inp.on('rating.change', function () {
                alert($('#rating-input').val());
            });


            $('.rb-rating').rating({
                'showCaption': true,
                'stars': '3',
                'min': '0',
                'max': '3',
                'step': '1',
                'size': 'xs',
                'starCaptions': {0: 'status:nix', 1: 'status:wackelt', 2: 'status:geht', 3: 'status:laeuft'}
            });
            $("#input-21c").rating({
                min: 0, max: 8, step: 0.5, size: "xl", stars: "8"
            });
        });
    </script>
</body>
</html>