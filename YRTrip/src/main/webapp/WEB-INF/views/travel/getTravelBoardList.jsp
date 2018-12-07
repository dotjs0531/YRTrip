<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 목록보기</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/vender/css/getTravelBoardList.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

</head>
<body>
<section class="content-section">
<!-- 검색창 -->
<div class="category">
 <div class="search-box">
                        <div class="pricing-title">
                            <h2 style="color:black">카테고리</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="#" style="color:black">전체 여행기</a></li>
                            <li><a href="#" style="color:black">베스트 여행기</a></li>
                            <li><a href="#" style="color:black">베스트 장소</a></li>
                        </ul>
                        
                    </div>
                        <div>
                        	<form name="search_frm">
						<div class="form-group">
							<br>
							<select name="searchCondition" class="form-control select-form">
								<option selected>선택</option>
								<option value="userId">작성자</option>
								<option value="tinfoId">지역명</option>
								<option value="travelTitle">제목</option>
								<option value="travelContent">내용</option>
							</select>
							<label class="sr-only" for="searchForm">여행게시판 내 검색</label>
							<input type="text" class="form-control" name="searchKeyword" placeholder="검색할 내용을 입력하세요">

						</div>
								<div>
								<button type="submit" class="btn btn-warning submit-buton">검색</button>
								</div>
								<input type="hidden" name="sortCol"/>
							</form>
                        </div>
</div>

<!-- 리스트 -->
	<div class="list-box">
						<c:forEach items="${travelBoardList}" var="board">
							<aside>
									<img src="resources/media/getTBL.PNG" class="img-responsive">
									<div class="content-title">
										<div class="text-center">
											<h3>
												<a href="getTravelBoard?travelNo=${board.travelNo}">${board.travelTitle}</a>
											</h3>
										</div>
									</div>
									<div class="content-footer">
										<span style="font-size: 16px; color: #fff;">${board.userId}</span>
										<span class="pull-right"><a href="#"
											data-toggle="tooltip" data-placement="right"
											title="Like"><i class="fa fa-heart"></i> ${board.travelLike}</a>
										</span>
										<div class="user-ditels">
											<div class="user-img">
												<img
													src="resources/media/users.png"
													class="img-responsive">
											</div>
											<span class="user-full-ditels">
												<h3>${board.userId}</h3>
											</span>
											<div class="social-icon">
												<a href="#"><i class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="유저정보"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-usd" data-toggle="tooltip" data-placement="bottom" title="판매상품"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-edit" data-toggle="tooltip" data-placement="bottom" title="리뷰"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-globe" data-toggle="tooltip" data-placement="bottom" title="여행글"></i></a> 
												<a href="#"><i class="glyphicon glyphicon-transfer" data-toggle="tooltip" data-placement="bottom" title="동행글"></i></a>
											</div>

										</div>
									</div>
											</aside>
								</c:forEach>

					</div>
</section>
<!-- js -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});

		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].onclick = function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			}
		}
	</script>
</body>
</html>