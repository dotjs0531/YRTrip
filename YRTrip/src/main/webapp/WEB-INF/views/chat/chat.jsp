<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>리얼유얼트립 채팅 서비스 채팅 페이지</title>
<style>
.portlet {
	margin-bottom: 15px;
}

.btn-white {
	border-color: #cccccc;
	color: #333333;
	background-color: #ffffff;
}

.portlet {
	border: 1px solid;
}

.portlet .portlet-heading {
	padding: 0 15px;
}

.portlet .portlet-heading h4 {
	padding: 1px 0;
	font-size: 16px;
}

.portlet .portlet-heading a {
	color: #fff;
}

.portlet .portlet-heading a:hover, .portlet .portlet-heading a:active,
	.portlet .portlet-heading a:focus {
	outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
	color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
	min-width: 0;
}

.portlet .portlet-heading .portlet-title {
	float: left;
}

.portlet .portlet-heading .portlet-title h4 {
	margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
	float: right;
	margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
	display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
	margin: 0 5px;
}

.portlet .portlet-body {
	padding: 15px;
	background: #fff;
}

.portlet .portlet-footer {
	padding: 10px 15px;
	background: #e0e7e8;
}

.portlet .portlet-footer ul {
	margin: 0;
}

.portlet-green, .portlet-green>.portlet-heading {
	border-color: #16a085;
}

.portlet-green>.portlet-heading {
	color: #fff;
	background-color: #16a085;
}

.portlet-orange, .portlet-orange>.portlet-heading {
	border-color: #f39c12;
}

.portlet-orange>.portlet-heading {
	color: #fff;
	background-color: #f39c12;
}

.portlet-blue, .portlet-blue>.portlet-heading {
	border-color: #2980b9;
}

.portlet-blue>.portlet-heading {
	color: #fff;
	background-color: #2980b9;
}

.portlet-red, .portlet-red>.portlet-heading {
	border-color: #e74c3c;
}

.portlet-red>.portlet-heading {
	color: #fff;
	background-color: #e74c3c;
}

.portlet-purple, .portlet-purple>.portlet-heading {
	border-color: #8e44ad;
}

.portlet-purple>.portlet-heading {
	color: #fff;
	background-color: #8e44ad;
}

.portlet-default, .portlet-dark-blue, .portlet-default>.portlet-heading,
	.portlet-dark-blue>.portlet-heading {
	border-color: #34495e;
}

.portlet-default>.portlet-heading, .portlet-dark-blue>.portlet-heading {
	color: #fff;
	background-color: #34495e;
}

.portlet-basic, .portlet-basic>.portlet-heading {
	border-color: #333;
}

.portlet-basic>.portlet-heading {
	border-bottom: 1px solid #333;
	color: #333;
	background-color: #fff;
}

@media ( min-width :768px) {
	.portlet {
		margin-bottom: 30px;
	}
}

.img-chat {
	width: 40px;
	height: 40px;
}

.text-green {
	color: #16a085;
}

.text-orange {
	color: #f39c12;
}

.text-red {
	color: #e74c3c;
}
</style>
<%
	//특정한 사람의 아이디 값 받아오기 로그인이 되었다면 세션값으로 처리
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); //스트링 형 변환
	}
	String toID = null;
	if (request.getParameter("toID") != null) {
		toID = (String) request.getParameter("toID");
	}
	//현재 유저가 접속상태가 아니라면 로그인이되어 있지 않다고 출력 인덱스페이지로 이동 처리
	if (userID == null) {
		session.setAttribute("messageType", "오류메세지");
		session.setAttribute("mesaageContent", "현재 로그인이 되어 있지 않은 상태입니다.");
		response.sendRedirect("index.jsp");
		return;
	}
	if (toID == null) {
		session.setAttribute("messageType", "오류메세지");
		session.setAttribute("mesaageContent", "대화 상대가 없습니다.");
		response.sendRedirect("index.jsp");
		return;
	}
	if (userID.equals(URLDecoder.decode(toID,"UTF-8"))){
		session.setAttribute("messageType", "오류메세지");
		session.setAttribute("mesaageContent", "본인에게는 메세지를 보낼수 없습니다.");
		response.sendRedirect("index.jsp");
		return;
	}
%>
<script type="text/javascript">
   
   //비동기적 통신
   
   function autoClosingAlert(selector, delay){ //채팅 전송후 딜레이주고 메세지 사라지게 하기
      var alert = $(selector).alert();
      alert.show();
      window.setTimeout(function() { alert.hide()},delay);    //사라지게하는 부분
   }
   
   function submitFunction(){
      var fromID = '<%=userID%>'; //보내는사람 현재접속유저
      var toID = '<%=toID%>';   //받는사람 toID
      var chatContent = $('#chatContent').val(); //대화 내용
      
      //아작스 처리 부분
      $.ajax({
            type: "POST",
            url : "./ChatSubmitServlet",
            data:{
               fromID : encodeURIComponent(fromID),
               toID : encodeURIComponent(toID),
               chatContent : encodeURIComponent(chatContent),
            },
            // 전송후 알림창 띄워주는 함수부분 
            success: function(result){
               if(result == 1){
                  autoClosingAlert('#successMessage', 2000)   
               }else if (result == 0){
                  autoClosingAlert('#dangerMessage', 2000)   
               }else{
                  autoClosingAlert('#warningMessage', 2000)   
               }
            }
         });
         $('#chatContent').val('');
      }
      var lastID = 0;
      function chatListFunction(type){
         var fromID   = '<%=userID%>';
         var toID   = '<%=toID%>';   
         $.ajax({
            type: "POST",      //보내는방식
            url: "./ChatListServlet",   //서블릿 보내는 주소
            data:{
               fromID: encodeURIComponent(fromID),
               toID: encodeURIComponent(toID),
               listType: type
            },
            success: function(data){  
            //	console.log(data);
             //  if(data == "") return;
                
             	  $('#chatList').empty();
             	  
            	console.log(data);
            //	data = '{"result":[{"fromID": "이상훈","toID": "123","content": "123","chatTime": "2018-12-16  오후 10:56"},{"fromID": "이상훈11","toID": "123","content": "123","chatTime": "2018-12-16  오후 10:56"}]}';

               var parsed = JSON.parse(data); 
               
               var result = parsed.result;  

               console.log(result);
               
               
               console.log("========");  
               console.log(result[0].fromID);  
               console.log(result[0].toID);
               console.log(result[0].content);
               console.log(result[0].chatTime);
            
               for(var i = 0; i < result.length; i++){
            	   if(result[i].fromID == fromID){		//현재 접속중인 나의 메세지 아이디
            		   result[i].fromID = '나';
            	   }
            	   
            	   
    	  console.log("aaa");
    
                  addChat(result[i].fromID, result[i].content, result[i].chatTime);
    	  console.log("bbb");
               }
              // lastID = result.last;
        
               
            }
         });
      }
      function addChat (chatName, chatContent, chatTime){      //누가 어떤메세지를 언제 보냈는지 담겨져있는 함수 <div>태그형태로 리스트 출력
    	  
    	 
      
         $('#chatList').append('<div class="row">' +
               '<div class="col-lg-12">' +
               '<div class="media">' +
               '<a class="pull-left" href="#">' +
               '<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/icon.png" alt="">' +
               '</a>' +
               '<div class="media-body">' +
               '<h4 class="media-heading">' +
               chatName +
               '<span class="samll pull-right">' +
               chatTime +
               '</span>' +
               '</h4>' +
               '<p>' +
               chatContent +
               '</p>' +
               '</div>' +
               '</div>' +
               '</div>' +
               '</div>' +
               '<hr>');
         $('#chatList').scrollTop($('#chatList')[0].scrollHeight);
      }
      function getInfiniteChat(){
         setInterval(function(){
            chatListFunction(lastID);
         }, 3000);   
      }
  	function getUnread(){
  		$.ajax({
  			type: "POST",
  			url: "./ChatUnRead",
  			data : {
  				userID: encodeURIComponent('<%=userID%>'),
			},
			success : function(result) {
				if (result >= 1) {
					showUnread(result);
				} else {
					showUnread('');
				}
			}
		});
	}
	function getInfiniteUnread() { // 반복적으로 서버한테 일정한 주기마다 읽지않은 메세지를 요청
		setInterval(function() {
			getUnread();
		}, 4000);
	}
	function showUnread(result) {
		$('#unread').html(result);
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
				<li><a href="messageBox.jsp">메세지함<span id="unread"
						class="label label-info"></span></a>
			</ul>
			<%
				if (userID != null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4>
							<i class="fa fa-circle text-green">실시간 채팅창</i>
						</h4>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="chatList" class="porlet-body chat-widget"
						style="height: 600px;"></div>
					<div class="portlet-footer">
						<div class="row" style="height: 90px;">
							<div class="form-group col-xs-10">
								<textarea style="height: 80px;" id="chatContent"
									class="form-control" placeholder="메세지를 입력하세요" maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right"
									onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage"
		style="display: none;">
		<strong>메세지전송에 성공했습니다</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage"
		style="display: none;">
		<strong>모든 내용을 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage"
		style="display: none;">
		<strong>DB 오류 발생</strong>
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
				class="modal-content
         <%if (messageType.equals("오류 메세지"))
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
	<script>
		$('#messageModal').modal("show"); //실제 세션 모달 팝업창 보여주는 스크립트
	</script>
	<%
			session.removeAttribute("messageContent");
			session.removeAttribute("messageType");
		}
	%>
		<script type="text/javascript">
			$(document).ready(function() {
				getUnread();
				chatListFunction('0');
				getInfiniteChat();
				getInfiniteUnread();
			});
		</script>
</body>
</html>