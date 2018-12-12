<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="javascript">
   function del(qid){
      if(confirm("삭제하시겠습니까?")){
         location.href = "./deleteQna?qnaId=" + qid;
      } else { return; }
   };
</script>
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
                            <li><a href="getQnaList" style="color:black"><strong>1:1 문의</strong></a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                    <div class="about_car">
                    	<br/>
						<h3 style="color:black">${qna.qnaTitle}</h3>
						<br/>
						<strong>작성자</strong>&nbsp;&nbsp;${qna.userName} ｜ <strong>작성일</strong>&nbsp;&nbsp;${qna.qnaDate} ｜ <strong>답변여부</strong>&nbsp;&nbsp;${qna.qnaAnswer}
						<hr />
						<div style="min-height:200px;">
						${qna.qnaContent}
						</div>
						<div class="order-buton" style="float:right">
                            <a href="./updateQnaForm?qnaId=${qna.qnaId}">수정</a>&nbsp;&nbsp;
                            <a onclick="del('${qna.qnaId}')">삭제</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>