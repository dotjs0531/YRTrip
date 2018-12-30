<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
</script>
<style>
input[type=submit] {
    width: 100%;
    background-color: #f9bf3b;
    color: white;
    padding: 10px 40px;
    margin: 8px auto;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
</style>
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
                            <li><a href="getNoticeList" style="color:black"><strong>공지사항</strong></a></li>
                            <li><a href="getQnaList" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                        	<c:if test="${sessionScope.login.userGrant ne 'admin'}">
                     			<a href="${pageContext.request.contextPath}/insertQna">문의글 등록</a>
                     		</c:if>
                        	<c:if test="${sessionScope.login.userGrant eq 'admin'}">
                     			<a href="${pageContext.request.contextPath}/insertNotice">공지 등록</a>
                     		</c:if>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                <form action="./insertNotice" method="post" enctype="multipart/form-data">
                	<div style="min-height:380px;">
			 		<table class="table table-bordered table-striped" style="text-align:center;">
			 			<thead>
							<tr>
								<th colspan="1" style="background-color:#eeeeee; text-align: center;">공지 등록하기</th>
							</tr>		 		
			 			</thead>
			 			<tbody>
			 				<tr>
			 					<td><input type="text" class="form-control" placeholder="글제목" name="noticeTitle" maxlength="100"></td>
			 				</tr>
			 				<tr>	
			 					<td><textarea class="form-control" placeholder="글 내용" name="noticeContent" maxlength="1024" style="height:200px"></textarea> </td>
			 				</tr>
			 				<tr>
			 					<td>
			 						<input type="file" name="noticeImgFile"
			 							id="fileInput" data-class-button="btn btn-default"
										data-class-input="form-control" data-icon-name="fa fa-upload"
										class="form-control" tabindex="-1" style="position: absolute;
										clip: rect(0px, 0px, 0px, 0px);">
									<div class="bootstrap-filestyle input-group">
										<input type="text" id="userfile" class="form-control"
											name="userfile" disabled="">
										<span class="group-span-filestyle input-group-btn" tabindex="0">
											<label for="fileInput" class="btn btn-default ">
												<span class="glyphicon fa fa-upload"></span>
											</label>
										</span>
									</div>
								</td>
			 				</tr>
			 			</tbody>
			 		</table>
			 		</div>
                    <section >
                        <div style="float:right">
                            <input type="submit" value="등록">
                        </div>
                    </section>
                    </form>
                    </div>
                </div>
            </div>

			

	</section>
    <!--   end of about us area-->
</body>
</html>