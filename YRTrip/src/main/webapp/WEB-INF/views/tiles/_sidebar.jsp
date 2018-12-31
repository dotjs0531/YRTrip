<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
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
</style>
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
                  	<i class="fa fa-user"></i>
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
              <button class="btn btn-success btn-block">전체 알림 전송
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
</body>