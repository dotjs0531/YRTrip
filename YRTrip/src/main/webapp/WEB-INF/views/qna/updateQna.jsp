<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                            <li><a href="getNoticeList" style="color:black">공지사항</a></li>
                            <li><a href="getQnaList" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                <form action="./updateQna" method="post">
                	<input type="hidden" name="qnaId" value="${qna.qnaId}">
			 		<table class="table table-bordered table-striped" style="text-align:center;">
			 			<thead>
							<tr>
								<th colspan="2" style="background-color:#eeeeee; text-align: center;">문의 수정하기</th>
							</tr>		 		
			 			</thead>
			 			<tbody>
			 				<tr>
			 					<td><input type="text" class="form-control" placeholder="글제목" name="qnaTitle" value="${qna.qnaTitle}" maxlength="100" size="100"></td>
			 					<td><input type="text" class="form-control" readonly="readonly" name="userId" value="${qna.userId}"></td>
			 				</tr>
			 				<tr>	
			 					<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="qnaContent" maxlength="1024" style="height:200px">${qna.qnaContent}</textarea> </td>
			 				</tr>
			 			</tbody>
			 		</table>
                    <section >
                        <div style="padding-top:320px; float:right">
                            <input type="submit" value="수정">
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