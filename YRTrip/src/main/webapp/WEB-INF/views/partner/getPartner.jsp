<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
<style>
.portlet {
	margin-bottom: 15px;
}

.btn-white {
	border-color: #cccccc;
	color: #333333;
	background-color: #ffffff;
}

.portlet {
	border: 1px solid;
}

.portlet .portlet-heading {
	padding: 0 15px;
}

.portlet .portlet-heading h4 {
	padding: 1px 0;
	font-size: 16px;
}

.portlet .portlet-heading a {
	color: #fff;
}

.portlet .portlet-heading a:hover, .portlet .portlet-heading a:active,
	.portlet .portlet-heading a:focus {
	outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
	color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
	min-width: 0;
}

.portlet .portlet-heading .portlet-title {
	float: left;
}

.portlet .portlet-heading .portlet-title h4 {
	margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
	float: right;
	margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
	display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
	margin: 0 5px;
}

.portlet .portlet-body {
	padding: 15px;
	background: #fff;
}

.portlet .portlet-footer {
	padding: 10px 15px;
	background: #e0e7e8;
}

.portlet .portlet-footer ul {
	margin: 0;
}

.portlet-green, .portlet-green>.portlet-heading {
	border-color: #16a085;
}

.portlet-green>.portlet-heading {
	color: #fff;
	background-color: #16a085;
}

.portlet-orange, .portlet-orange>.portlet-heading {
	border-color: #f39c12;
}

.portlet-orange>.portlet-heading {
	color: #fff;
	background-color: #f39c12;
}

.portlet-blue, .portlet-blue>.portlet-heading {
	border-color: #2980b9;
}

.portlet-blue>.portlet-heading {
	color: #fff;
	background-color: #2980b9;
}

.portlet-red, .portlet-red>.portlet-heading {
	border-color: #e74c3c;
}

.portlet-red>.portlet-heading {
	color: #fff;
	background-color: #e74c3c;
}

.portlet-purple, .portlet-purple>.portlet-heading {
	border-color: #8e44ad;
}

.portlet-purple>.portlet-heading {
	color: #fff;
	background-color: #8e44ad;
}

.portlet-default, .portlet-dark-blue, .portlet-default>.portlet-heading,
	.portlet-dark-blue>.portlet-heading {
	border-color: #34495e;
}

.portlet-default>.portlet-heading, .portlet-dark-blue>.portlet-heading {
	color: #fff;
	background-color: #34495e;
}

.portlet-basic, .portlet-basic>.portlet-heading {
	border-color: #333;
}

.portlet-basic>.portlet-heading {
	border-bottom: 1px solid #333;
	color: #333;
	background-color: #fff;
}

@media ( min-width :768px) {
	.portlet {
		margin-bottom: 30px;
	}
}

.img-chat {
	width: 40px;
	height: 40px;
}

.text-green {
	color: #16a085;
}

.text-orange {
	color: #f39c12;
}

.text-red {
	color: #e74c3c;
}
</style>
<script>
	function del(partnerid) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "./deletePartner?partnerid=" + partnerid;
		} else {
			return;
		}
	};

	//동행 신청 목록 조회
	// 댓글 목록 조회
	function loadCommentsList() {
		var params = {
			boardSeq : '${board.seq}'
		};
		$.getJSON("getCommentsList", params, function(datas) {
			for (i = 0; i < datas.length; i++) {
				var div = makeCommentView(datas[i]);
				$(div).appendTo("#commentsList")
			}
		});
	}

	$(function() {
		loadCommentsList();
		//댓글 삭제 이벤트
		$("#commentsList").on("click", ".btnDel", function() {
			var seq = $(this).parent().attr("id").substr(1);
			if (confirm("삭제할까요?")) {
				var params = "seq=" + seq; // { seq : seq };
				var url = "deleteComments";
				$.getJSON(url, params, function(datas) {
					$('#c' + datas.seq).remove();
				});
			}
		});

		//댓글 등록처리
		$("#btnAdd").click(function() {
			var params = $("#addForm").serialize();
			console.log(params);
			$.getJSON("insertComments", params, function(datas) {
				var div = makeCommentView(datas);
				$(div).prependTo("#commentsList");
			});
		}); //end btnAdd clcic event
	}); //$() end ready event

	function makeCommentView(comment) {
		var div = $("<div>");
		div.attr("id", "c" + comment.seq);
		div.addClass('comment');
		div[0].comment = comment; //{id:1,.... }

		var str = "<strong class='commentName'>작성자 : " + comment.name
				+ "</strong>   " + "<span class='commentContent'>댓글내용 : "
				+ comment.content + "</span>   "
				+ "<button type=\"button\" class=\"btnUpdFrm\">수정</button>"
				+ "<button type=\"button\" class=\"btnDel\">삭제</button>"
		div.html(str);
		return div;
	}
</script>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		String toID= null;
	%>
	<section class="about_us_area" id="about">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">여행목적</h2>
						</div>
						<ul class=price-list>
							<li><a href="getPartnerList" style="color: black">전체보기</a></li>
							<li><a href="*" style="color: black">여행</a></li>
							<li><a href="*" style="color: black">문화</a></li>
							<li><a href="*" style="color: black">맛집</a></li>
							<li><a href="*" style="color: black">교통</a></li>
							<li><a href="*" style="color: black">숙소</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-offset-1 col-sm-6">
					<table class="table table-bordered table-striped"
						style="text-align: center;">
						<thead>
							<tr>
								<th colspan="10"
									style="background-color: #eeeeee; text-align: center;">동행
									게시판 글쓰기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align: left;" colspan="11">카테고리 >
									${partner.partnerclass}</td>
							</tr>
							<tr>
								<td colspan="1">No.${partner.partnerid}</td>
								<td colspan="3">${partner.partnertitle}</td>
								<td colspan="3">${partner.userid}</td>
								<td colspan="3">${partner.partnerdate}</td>
							</tr>
							<tr>
								<td colspan="2">여행지 : 일단보류</td>
								<td colspan="4">비용 : ${partner.partnerpay}</td>
								<td colspan="4">인원 : ${partner.partnerpers}</td>
							</tr>
							<tr>
								<td colspan="2">출발일 : ${partner.partnerstart}</td>
								<td colspan="8">도착일 : ${partner.partnerend}</td>
							</tr>
							<tr>
								<td colspan="10">${partner.partnercontent}</td>
							</tr>
						</tbody>
					</table>
					<br>
					<h3>동행 신청 목록</h3>
					<div id="joinerList"></div>

					<!-- 임시 채팅창 1-->
					<div class="container bootstrap snippet">
						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								<div class="portlet portlet-default">
									<div class="portlet-heading">
										<div class="portlet-title">
											<h4>
												<i class="fa fa-circle text-green"></i> Jane Smith
											</h4>
										</div>
										<div class="portlet-widgets">
											<div class="btn-group">
												<button type="button"
													class="btn btn-white dropdown-toggle btn-xs"
													data-toggle="dropdown">
													<i class="fa fa-circle text-green"></i> Status <span
														class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#"><i class="fa fa-circle text-green"></i>
															Online</a></li>
													<li><a href="#"><i
															class="fa fa-circle text-orange"></i> Away</a></li>
													<li><a href="#"><i class="fa fa-circle text-red"></i>
															Offline</a></li>
												</ul>
											</div>
											<span class="divider"></span> <a data-toggle="collapse"
												data-parent="#accordion" href="#chat"><i
												class="fa fa-chevron-down"></i></a>
										</div>
										<div class="clearfix"></div>
									</div>
									<div id="chat" class="panel-collapse collapse in">
										<div>
											<div class="portlet-body chat-widget"
												style="overflow-y: auto; width: auto; height: 300px;">
												<div class="row">
													<div class="col-lg-12">
														<p class="text-center text-muted small">January 1,
															2014 at 12:23 PM</p>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-12">
														<div class="media">
															<a class="pull-left" href="#"> <img
																class="media-object img-circle img-chat"
																src="http://bootdey.com/img/Content/avatar/avatar1.png"
																alt="">
															</a>
															<div class="media-body">
																<h4 class="media-heading">
																	Jane Smith <span class="small pull-right">12:23
																		PM</span>
																</h4>
																<p>Hi, I wanted to make sure you got the latest
																	product report. Did Roddy get it to you?</p>
															</div>
														</div>
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-lg-12">
														<div class="media">
															<a class="pull-left" href="#"> <img
																class="media-object img-circle img-chat"
																src="http://bootdey.com/img/Content/avatar/avatar6.png"
																alt="">
															</a>
															<div class="media-body">
																<h4 class="media-heading">
																	John Smith <span class="small pull-right">12:28
																		PM</span>
																</h4>
																<p>Yeah I did. Everything looks good.</p>
																<p>Did you have an update on purchase order #302?</p>
															</div>
														</div>
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-lg-12">
														<div class="media">
															<a class="pull-left" href="#"> <img
																class="media-object img-circle img-chat"
																src="http://bootdey.com/img/Content/avatar/avatar6.png"
																alt="">
															</a>
															<div class="media-body">
																<h4 class="media-heading">
																	Jane Smith <span class="small pull-right">12:39
																		PM</span>
																</h4>
																<p>No not yet, the transaction hasn't cleared yet. I
																	will let you know as soon as everything goes through.
																	Any idea where you want to get lunch today?</p>
															</div>
														</div>
													</div>
												</div>
												<hr>
											</div>
										</div>
										<div class="portlet-footer">
											<form role="form">
												<div class="form-group">
													<textarea class="form-control"
														placeholder="Enter message..."></textarea>
												</div>
												<div class="form-group">
													<button type="button" class="btn btn-default pull-right">Send</button>
													<div class="clearfix"></div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
					<!-- /.col-md-4 -->
						</div>
					</div>
					<div class="alert alert-success" id="successMessage"
						style="display: none;">
						<strong>메세지 전송에 성공했습니다.</strong>
					</div>
					<div class="alert alert-success" id="dangerMessage"
						style="display: none;">
						<strong>이름과 내용을 모두 입력하세요.</strong>
					</div>
					<div class="alert alert-success" id="warningMessage"
						style="display: none;">
						<strong>DB오류</strong>
					</div>
					<br>
					<section>
						<div class="order-buton" style="padding-top: 500px; float: right">
							<a href="./updatePartnerForm?partnerid=${partner.partnerid}">수정</a>&nbsp;&nbsp;
							<button class="submit-btn" onclick="del('${partner.partnerid}')">삭제</button>
							<a href="${pageContext.request.contextPath}/getPartnerList">뒤로가기</a>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>
</body>
</html>