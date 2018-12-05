<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

</head>
<body>
    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">고객센터</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="notice.tiles" style="color:black">공지사항</a></li>
                            <li><a href="qna_admin.tiles" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-offset-1 col-sm-6">
			 		<table class="table table-bordered table-striped" style="text-align:center;">
			 			<thead>
							<tr>
								<th colspan="1" style="background-color:#eeeeee; text-align: center;">공지 등록하기</th>
							</tr>		 		
			 			</thead>
			 			<tbody>
			 				<tr>
			 					<td><input type="text" class="form-control" placeholder="글제목" name="ntitle" maxlength="50"></td>
			 				</tr>
			 				<tr>	
			 					<td><textarea class="form-control" placeholder="글 내용" name="ncontent" maxlength="2048" style="height:200px"></textarea> </td>
			 				</tr>
			 			</tbody>
			 		</table>
                    <section >
                        <div class="order-buton" style="padding-top:300px; float:right">
                            <a href="#">등록</a>
                        </div>
                    </section>
                    </div>
                </div>
            </div>
    </section>
    <!--   end of about us area-->
</body>
</html>