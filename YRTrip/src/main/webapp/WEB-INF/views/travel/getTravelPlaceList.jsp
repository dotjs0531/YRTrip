<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소게시판 목록보기</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/vender/css/Travel.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean" rel="stylesheet">

<style>
.modal-backdrop {
	z-index: -1;
}
.nav>li>a:focus,
.nav>li>a:hover{
   background-color:white;
}
/* 장소 리스트 */
.wrap
{
  width:100%;
  display:inline;
  align-items:space-around;
  max-width:1200px;
  text-align:center;
}
.tile
{
  width:200px;
  height:200px;
  margin:10px;
  background-color:#fff;
  display:inline-block;
  background-size:cover;
  position:relative;
  cursor:pointer;
  transition: all 0.4s ease-out;
  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.44);
  overflow:hidden;
  color:white;
  font-family:'Roboto';
  
}
.tile img
{
  height:100%;
  width:100%;
  position:absolute;
  top:0;
  left:0;
  z-index:0;
  transition: all 0.4s ease-out;
}
.tile .text
{
  font-color:#fff;
  padding:40px 30px 30px 30px;
  font-family: 'East Sea Dokdo';
  color:#34495E;
}
.tile h2
{
  font-weight:300;
  margin:0;
  text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
}
.tile h3
{
  font-weight:100;
  margin:20px 0 0 0;
  transform: translateX(400px);
}
.tile p
{
  font-weight:300;
  margin:20px 0 0 0;
  line-height: 25px;
  transform: translateX(-200px);
  transition-delay: 0.2s;
}
.animate-text
{
  opacity:0;
  transition: all 0.6s ease-in-out;
}
.tile:hover
{
  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.64);
  transform:scale(1.05);
  cursor : default;
}
.tile:hover img
{
  opacity: 0.2;
}
.tile:hover .animate-text
{
  transform:translateX(0);
  opacity:1;
}

.tile:hover span
{
  opacity:1;
  transform:translateY(0px);
}

@media (max-width: 1000px) {
  .wrap {
   flex-direction: column;
    width:400px;
  }
}

</style>
<script>
$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';
});
jQuery( document ).ready(function( $ ) {
 	/* 여행등록 modal & 로그인 안했을시 예외처리 */
	if("${sessionScope.login.userId}" == ''){
		$(".insertPlace").click(function(e){
			e.preventDefault();
			alert("로그인이 필요한 서비스입니다");
		});
		$(".goToUserPage").click(function(e){
			e.preventDefault();
			alert("로그인이 필요한 서비스입니다");
		});
	};
});
</script>
</head>
<body>
<section class="about_us_area" id="about">
	<div class="container">
		<div class="row">

			<!-- 왼쪽 사이드바 -->
			<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
				<div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">여행정보</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getTravelBoardList" style="color:black">전체 여행기</a></li>
                            <li><a href="./getBestTravelList" style="color:black">베스트 여행기</a></li>
                            <li><a href="./getTravelPlaceList" style="color:black"><strong>세계의 여행지</strong></a></li>
                        </ul>
	                    <div class="order-buton" style="padding-bottom:30px;">
	                        <a href="./insertTravelPlaceform" class="insertPlace" style="text-decoration:none; color:#fff;"><strong>세계의 여행지 등록</strong></a>
	                    </div>                   
				</div>
			</div>

			<!-- 검색 창 -->
			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">
                	<div class="form-group single-pricing-table" style="width:670px; color:black;">
                	<form name="frm" class="form-inline">
                     <div class="form-group"
                        style="padding-bottom: 10px; float: center">
                        <select name="searchCondition" class="form-control">
                           <option value="placeName">장소명
                           <option value="userName">글쓴이
                        </select> <input type="text" name="searchKeyword" class="form-control">
                        <button class="btn btn-warning signupbtn">검색</button>
                     </div>
						<input type="hidden" name="page" />
                  </form>
                  </div>		
<!-- 여행기 리스트 -->

   			<c:forEach items="${travelPlaceList}" var="board">
			
					<div class="wrap">
					<div class="tile"> 
					  <c:if test="${board.placePic != null}">
								<img src="./images/travel/${board.placePic}" />
							</c:if>
							<c:if test="${board.placePic == null}">
							<img src="./images/travel/placenoimage.jpg" class="img-responsive">
							</c:if>
					  <div class="text">
					  <h2 class="animate-text"><a href="getTravelPlace?PlaceNo=${board.placeNo}" style="text-decoration: none; color:#34495E;">
					   <c:choose>
						           <c:when test="${fn:length(board.placeTitle) > 9}">
						           		<c:out value="${fn:substring(board.placeTitle,0,8)}"/>..
									</c:when>
						           <c:otherwise>
						            <c:out value="${board.travelTitle}"/>
						           </c:otherwise> 
						          </c:choose>
					 </a></h2>
					  <p class="animate-text">${board.placeName}</p>
					  <c:if test="${sessionScope.login.userId eq board.userId}"><h3 class="animate-text" style="text-decoration: none; color:#34495E;">${board.userName}</h3></c:if>
				      <c:if test="${sessionScope.login.userId ne board.userId}">
			   	      <h3 class="animate-text"><a href="getYourTravelList?userId=${board.userId}" class="goToUserPage" style="text-decoration: none; color:#34495E;">${board.userName}</a></h3>
					  </c:if>
					  
					  </div>
					 </div>
					 </div>
				</c:forEach>
				

				<!-- 페이징처리 -->
				<nav aria-label="Page navigation example" style="padding:50px 5% 0 0;">
					<my:paging paging="${paging}" jsFunc="go_page"/>
				</nav>
			</div>	<!-- end of table-responsive -->
				</div></div></div></div></section>
<!-- js -->
	<script>		
		/* 페이징 */	
		function go_page(page) {
				document.frm.page.value=page;
				document.frm.submit();	//검색폼 submit
		}
		

	</script>
</body>
</html>