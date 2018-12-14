<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript">
   function del(qid){
      if(confirm("삭제하시겠습니까?")){
         location.href = "./deleteQna?qnaId=" + qid;
      } else { return; }
   };
    
	$(function(){
		//댓글 목록 조회
		function loadCommentList() {
			var params = { commentQnaid : '${qna.qnaId}' };
			$.getJSON("getQnaCommentList", params, function(datas){
				for(i=0; i<datas.length; i++) {
					var div = makeCommentView(datas[i]);
					$(div).prependTo("#qnaComment");
				}
			});
		}	//end loadCommentList event
		
		//댓글 등록 처리
		$("#btnAdd").click(function(){
			var params = $("#addForm").serialize();
			console.log(params);
			$.getJSON("insertQnaComment", params, function(datas){
				var div = makeCommentView(datas)
				$(div).prependTo("#qnaComment");
			});
		});	// end btnAdd click event
		
		//댓글 삭제 이벤트
		$("#qnaComment").on("click", ".btnDel", function(){
			var qnaId = $(this).parent().attr("id").substr(1);
			if(confirm("삭제할까요?")) {
				var params = "qnaId="+ qnaId;  // { seq : seq };
				var url = "deleteQnaComment";
				$.getJSON(url, params, function(datas){
					$('#c'+datas.qnaId).remove();
				});
			}
		});	// end btnDel click event

		function makeCommentView(qnaComment){
			var div = $("<div>"); 
			div.attr("id", "c"+qnaComment.qnaId);
			div.addClass('qnaComment');
			div[0].qnaComment=qnaComment;  //{id:1,.... }
			
			var str ="<strong class='userId'>" + qnaComment.userId + "</strong>" 
			        +"<span class='qnaContent'>" + qnaComment.commentContent +"</span>"
					+"<button type=\"button\" class=\"btnUpdFrm\">수정</button>"
					+"<button type=\"button\" class=\"btnDel\">삭제</button>"
			div.html(str);
			return div;
		}

		loadCommentList();

	});	//$() end ready event 
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
                    	<c:if test="${sessionScope.login.userId eq qna.userId}">
						<div class="order-buton" style="float:right">
                            <a href="./updateQnaForm?qnaId=${qna.qnaId}">수정</a>&nbsp;&nbsp;
                            <a onclick="del('${qna.qnaId}')">삭제</a>
                        </div>
                        </c:if>
                    </div>
                    <div class="about_car" id="qnaComment">
						<div style="min-height:100px;"><hr>
							<!-- 댓글등록시작 -->
							<div id="commentAdd">
								<form name="addForm" id="addForm">
									<input type="hidden" name="commentQnaid" value="${qna.qnaId}">
									이름: <input type="text" name="userId" size="10"><br />
									내용: <textarea name="commentContent" cols="20" rows="2"></textarea><br />
									<input type="button" value="등록" id="btnAdd" />
								</form>
							</div>
							<!-- 댓글등록끝 -->
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>