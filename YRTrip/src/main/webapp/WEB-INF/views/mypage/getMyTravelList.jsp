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
<script>
	function go_page(page) {
		document.frm.page.value = page;
		document.frm.submit();
	}
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
                            	   style="color:black"><strong>여행정보</strong></a></li>
                            <li><a href="./getMyLikedList?userId=${sessionScope.login.userId}"
                            	   style="color:black">좋아요</a></li>
                            <li><a href="./getMyProductList?userId=${sessionScope.login.userId}"
                            	   style="color:black">상품</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive">
                	
                		<!-- 검색 창 & 페이징 처리 -->
                		<form name="frm">
							<input type="hidden" name="userId" value="${sessionScope.login.userId}"/>
							<input type="hidden" name="page" />
						</form>
						
                		<div class="form-group"><br/>
                			<table style="width:100%">
                				<tr>
                					<td style="text-align:center;text-decoration: underline;"><h3>
                						<a href="./getMyTravelList?userId=${sessionScope.login.userId}"
                						   style="color:black;"><strong>나의 여행</strong></a></h3></td>
                					<td style="text-align:center"><h3>
                						<a href="./getMyPartnerList?userId=${sessionScope.login.userId}"
                						   style="color:black;">나의 동행</a></h3></td>
                				</tr>
                			</table>
            			</div>
            			<p style="clear:both"/><br/>
					</div>
                	<div>
						<div class="container card">
							<!-- Normal Demo-->
							<c:forEach items="${MyTravelList}" var="travel">
								<div class="column">
									<div class="demo-title">No. ${travel.travelNo}</div>
									<!-- Post-->
									<div class="post-module">
										<!-- Thumbnail-->
										<div class="thumbnail">
											<img src="./images/notice/1.jpg" />
										</div>
										<!-- Post Content-->
										<div class="post-content">
											<div class="category">Photos</div>
											<h1 class="title">${travel.travelTitle}</h1>
											<h2 class="sub_title">${travel.travelDate}</h2>
											<p class="description">${travel.travelContent}</p>
											<div class="post-meta">
												<span class="timestamp"><i class="fa fa-gratipay"></i>&nbsp;${travel.travelLike}</span>
												<span class="comments"><i class="fa fa-eye"></i>&nbsp;${travel.travelHit}</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						
                    <!-- 페이지 번호 -->
                    <div style="padding-top:50px;">
						<my:paging paging="${paging}" jsFunc="go_page" />
                    </div>
                    
					</div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="resources/js/mypage.js"></script>
</body>
</html>