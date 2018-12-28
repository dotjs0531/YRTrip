<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>리얼유얼트립 채팅 서비스 인덱스 페이지</title>
	<%
		//특정한 사람의 아이디 값 받아오기 로그인이 되었다면 세션값으로 처리
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //스트링 형 변환
		}
		if (userID == null) {
			session.setAttribute("messageType", "오류메세지");
			session.setAttribute("mesaageContent", "현재 로그인이 되어 있지 않은 상태입니다.");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
<script type="text/javascript">
	function getUnread(){
		$.ajax({
			type: "POST",
			url: "./ChatUnRead",
			data : {
				userID: encodeURIComponent('<%= userID %>'),
			},
			success: function(result){
				if(result >= 1){
					showUnread(result);
				}else{
					showUnread('');
				}
			}
		});
	}
	function getInfiniteUnread(){		// 반복적으로 서버한테 일정한 주기마다 읽지않은 메세지를 요청
		setInterval(function(){
			getUnread();
		}, 4000);
	}
	function showUnread(result){
		$('#unread').html(result);
	}
	function chatBoxFunction(){
		var userID = '<%= userID %>'
		console.log(userID);
		$.ajax({
			type: "POST",
			url: "./ChatMessageBox",
			data : {
				userID: encodeURIComponent(userID),
			},
			success: function(data){
				
				console.log("data : "+data);
				
				if(data== "")return; //결과 페이지가 비어있다면 걍 리턴해줌.
				
				$('#boxTable').html(''); //초기화
				
				var parsed =JSON.parse(data);
				
				console.log("parsed "+parsed);
				
				var result =parsed.result;
				for(var i=0; i<result.length; i++){		// 메세지를 보내는 방식이 나또는 다른사람 형태로 출력
					if(result[i][0].value == userID){
						result[i][0].value = result[i][1].value;
					}else{
						result[i][1].value = result[i][0].value;
					}
					//화면에 각각의 메세지 목록을 출력해주는 addBox함수
					addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value)
				}
			}
		});
	}
	function addBox(lastID, toID, chatContent, chatTime){
		$('#boxTable').append('<tr onclick="location.href=\'chat.jsp?toID=' + encodeURIComponent(toID) + '\'">' +
				'<td style="width: 150px;"><h5>' + lastID + '</h5></td>' +
				'<td>' +
				'<h5>' + chatContent + '</h5>' +
				'<div class="pull-right">' + chatTime + '</div>' +
				'</td>' +
				'</tr>');
	}
	function getInfiniteBox(){
		setInterval(function(){
			chatBoxFunction();
		}, 3000);
	}

</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">YRT 채팅 서비스</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a>
				<li><a href="find.jsp">친구찾기</a>
				<li class="active"><a href="messageBox.jsp">메세지함<span id="unread" class="label label-info"></span></a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<table class="table" style="margin: 0 auto;">
			<thead>
				<tr>
					<th><h4>메세지 목록</h4></th>
				</tr>
			</thead>
			<div style="overflow-y: auto; width: 100%; max-height: 450px;">
				<table class="table table-bordered table-hover"
					style="text-align: center; border: 1px solid #dddddd; margin: 0 auto;">
					<tbody id="boxTable">
					</tbody>
				</table>
			</div>
		</table>
	</div>
	<%
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) { //메세지 컨텐츠 세션값
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null) { //메세지 타입 세션값
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) { //존재하는경우
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div
				class="modal-content <%if (messageType.equals("오류 메세지"))
					out.println("panel-warning");
				else
					out.println("panel-success");%>">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">
						<%=messageType%>
					</h4>
				</div>
				<div class="modal-body">
					<%=messageContent%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<%
			session.removeAttribute("messageContent");
			session.removeAttribute("messageType");
		}
	%>
	<script>
		$('#messageModal').modal("show"); //실제 세션 모달 팝업창 보여주는 스크립트
	</script>
	<%
		if(userID != null) {
	%>
		<script type="text/javascript">
			$(document).ready(function(){
				getUnread();
				getInfiniteUnread();
				chatBoxFunction();
				getInfiniteBox();
			});
		</script>
	<%
		}
	%>
</body>
</html>