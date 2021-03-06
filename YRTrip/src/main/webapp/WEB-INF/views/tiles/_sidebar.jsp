<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style>
.fa fa-user:before {
    content: "\F6A0";
}
.fa fa-user:before {
    display: inline-block;
    font: normal normal normal 24px/1 "Material Design Icons";
    font-size: inherit;
    text-rendering: auto;
    line-height: inherit;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.modal {
        text-align: center;
}
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
	   	$("#mailSend").click(function(){
	       	$('div#mailSendForm').modal(true);
	   	});
	});
</script>
</head>
<body>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-profile">
            <div class="nav-link">
              <div class="user-wrapper">
                <div class="profile-image">
                  <!-- <img src="resources/admin/images/faces/face1.jpg" alt="profile image"> -->
                  <button type="button" class="btn btn-icons btn-rounded btn-light" onclick="location.href='./admin'">
                  	<i class="far fa-user"></i>
                  </button>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name"><a href="./admin" style="color:black; text-decoration:none">${sessionScope.login.userName}</a></p>
                  <div>
                    <small class="designation text-muted">관리자</small>
                    <span class="status-indicator online"></span>
                  </div>
                </div>
              </div>
              <button class="btn btn-success btn-block" id="mailSend">전체 메일 전송
                <i class="mdi mdi-plus"></i>
              </button>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./admin">
              <i class="menu-icon mdi mdi-television"></i>
              <span class="menu-title">HOME</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./manageUser">
              <i class="menu-icon mdi mdi-backup-restore"></i>
              <span class="menu-title">회원관리</span>
            </a>
          </li>
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-content-copy"></i>
              <span class="menu-title">거래관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item">
                  <a class="nav-link" href="./manageProduct">상품관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./manageOrder">주문내역관리</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./managePartner">
              <i class="menu-icon mdi mdi-sticker"></i>
              <span class="menu-title">동행관리</span>
            </a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="./manageTravel">
              <i class="menu-icon mdi mdi-table"></i>
              <span class="menu-title">여행관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./chart">
              <i class="menu-icon mdi mdi-chart-line"></i>
              <span class="menu-title">통계정보</span>
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="menu-icon mdi mdi-restart"></i>
              <span class="menu-title">고객센터관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item">
                  <a class="nav-link" href="./manageNotice">공지사항 관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./manageQna">1:1문의글 관리</a>
                </li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      
      
    <!-- 전체 메일 보내기 -->
	<div class="modal fade" id="mailSendForm">
		<div class="modal-dialog" style="width:100%;">
			<div class="modal-content" style="margin:0 auto; background-color:#fdfdfd !important">
				<!-- remote ajax call이 되는영역 -->
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- body -->
				<div class="modal-body">
					<div class="container" style="width:100%">
						<div id="login-row" class="row justify-content-center align-items-center">
							<div id="login-column" style="margin: 20px; width:100%">
								<div id="login-box">
								
									<form id="mailForm" class="form" action="mailSendAll" method="post" style="margin:0">
										<h3 class="text-center text-info" style="color:#666666 !important; margin-bottom: 20px">전체 메일 전송</h3>
										<div style="margin-bottom:20px">
										
											<div class="box" style="margin-bottom:0">
											  <div class="form-group container-1">
											      <input type="text" id="mailTitle" name="subject" placeholder="메일 제목을 입력해 주세요" value="[Your Real Trip] " class="form-control" style="font-size: medium"/>
											  </div>
											
											  <div class="form-group container-1">
											  	<textarea id="mailContent" name="content" placeholder="메일 내용을 입력해 주세요" class="form-control" rows="10" style="font-size: medium"></textarea>
											  </div>
											</div>
											<p style="clear:both">
											
										</div>	
										
										<div class="form-group">
											<button type="submit" class="btn btn-info form-input"  style="width:100%; height:40px" onclick="location.href='#'"><i class="fas fa-envelope"></i>메일 보내기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>