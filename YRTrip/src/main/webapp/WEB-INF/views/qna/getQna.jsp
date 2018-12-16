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
					$(div).prependTo("#qnaCommentList");
				}
			});
		}	//end loadCommentList event
		
		//댓글 등록 처리
		$("#btnAdd").click(function(){
			var params = $("#addForm").serialize();
			console.log(params);
			$.getJSON("insertQnaComment", params, function(datas){
				var div = makeCommentView(datas)
				$(div).prependTo("#qnaCommentList");
			});
		});	// end btnAdd click event

		//댓글 수정 이벤트
		$("#btnUpd").click(function(){
			var params = $("[name=updateForm]").serialize();
			$.getJSON("updateQnaComment", params, function(datas){
				var newDiv = makeCommentView(datas);
				var oldDiv = $("#c"+datas.commentId);
				$("#btnCancel").click();
				$(newDiv).replaceAll(oldDiv);  // 수정된 DIV를 교체
			});
		});
		
		//수정폼 이벤트(수정할 댓글밑에 수정폼 보이게 함)
		$("#qnaComment").on("click", ".btnUpdFrm", function(){
			var commentId = $(this).parent().attr("id").substring(1);
			//수정할 데이터 입력필드에 셋팅
			$("#updateForm [name=commentId]").val(commentId);    
			$("#updateForm [name=userId]").val($("#c"+commentId+">.userId").text());
			$("#updateForm [name=commentContent]").val($("#c"+commentId+">.commentContent").text());
			//수정할 댓글밑으로 이동하고 보이게
			$("#c"+commentId).prepend($('#commentUpdate'));  
			$('#commentUpdate').show();   
		});
		
		//댓글 삭제 이벤트
		$("#qnaComment").on("click", ".btnDel", function(){
			var commentId_str = $(this).parent().attr("id").substr(1);
			var commentId = Number(commentId_str);
			if(confirm("삭제할까요?")) {
				var params = "commentId="+ commentId;  // { seq : seq };
				var url = "deleteQnaComment";
				$.getJSON(url, params, function(datas){
					$('#c'+datas.commentId).remove();
				});
			}
		});	// end btnDel click event

		function makeCommentView(qnaComment){
			var div = $("<div class='form-group'>"); 
			div.attr("id", "c"+qnaComment.commentId);
			div.addClass('qnaCommentList');
			div[0].qnaCommentList = qnaComment;  //{id:1,.... }
			
			var str ="<p/><label class='col-sm-2 control-label'>" + qnaComment.userId + "</label>" 
			        +"<span class='col-lg-8 qnaContent'>" + qnaComment.commentContent +"</span>"
					+"<button type=\"button\" class=\"btn btn-default btnUpdFrm\">수정</button>"
					+"<button type=\"button\" class=\"btn btn-default btnDel\">삭제</button>"
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
                        <p style="clear:both;">
                    </div>
                    
                    <div class="about_car" id="qnaComment" style="min-height:100px;">
                        <hr/>
							<!-- 댓글등록시작 -->
							<div id="commentAdd">
								<form name="addForm" id="addForm">
								<div class="input-group">
									<input type="hidden" name="commentQnaid" value="${qna.qnaId}">
									<input type="hidden" name="userId" value="${sessionScope.login.userId}">
									<input type="text" class="form-control" id="commentContent" name="commentContent" placeholder="내용을 입력하세요">
									<span class="input-group-btn">
									<button type="button" class="btn btn-default" id="btnAdd">등록</button>
									</span>
								</div>
								</form>
							</div><br/>
							<!-- 댓글등록끝 -->
							
							<!-- 댓글 목록 -->
							<div id="qnaCommentList"></div>
							<!-- 댓글 목록끝 -->
							
							<!-- 댓글수정폼시작 -->
							<div id="commentUpdate" style="display: none">
								<form action="" name="updateForm" id="updateForm">
								<div class="form-group">
									<input type="hidden" name="commentQnaid" value="${qna.qnaId}">
									<input type="hidden" name="commentId" value="${qnaComment.commentId}" />
									<label class='col-sm-2 control-label'>
									<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										${sessionScope.login.userId}</label>
									<span class='col-lg-8 qnaContent'>
									<input type="text" class="form-control" name="commentContent" value="${qnaComment.commentContent}">
									</span>
									<button type="button" class="btn btn-default" id="btnUpd">등록</button>
									<button type="button" class="btn btn-default" id="btnCancel">취소</button>
								</div>
								</form>
							</div>
							<!-- 댓글수정폼끝 -->
						</div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>