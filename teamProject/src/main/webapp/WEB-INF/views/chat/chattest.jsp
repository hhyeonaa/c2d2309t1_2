<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<title>여기 다 모여 있다, '다모임'</title>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
	
	
		<div style="border: 1px solid black; width: 100%; height: 100%;">
				<input type="text" id="targerId" placeholder="보낼 id">
				<input type="text" id="message" placeholder="메시지" />
				<input type="button" id="sendBtn" value="submit"/>
				<div id="messageArea"></div>
		</div>
		
	</div>
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
<script type="text/javascript">
// 	var ws;
var id = "${sessionScope.MEM_ID}";
	
// 	function connect(){
// 		// 웹소켓 객체 생성
// 		// 핸들러 등록(연결 생성, 메세지 수신, 연결 종료)
		
// 		// url 연결할 서버의 경로
// 		ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat");
		
// 		ws.open = function(){
// 			console.log("연결 생성");
// 			register();
// 		}
		
// 		ws.onmessage = function(e){
// 			console.log("메세지 전송");
			
// 			var data = e.data;
// 			addMsg(data);
// 		}
		
// 		ws.onclose = function(e){
// 			console.log("연결 끊김");
// 		}
		
// 	}
	
// 	function addMsg(msg){ // 원래 채팅 메세지에 방금 받은 메세지 더해서 설정하기
// 		var chat = $("#message").val();
// 		chat = chat + "\n상대방 : " + msg;
// 		$("#messageArea").val(chat)
// 	}
	
// 	function register (){ // 메시지 수신을 위한 서버에 id 등록하기
// 		var msg = {
// 			type: "register", //메시지를 구분하는 구분자 - 상대방 아이디와 메시지를 포함해서 보냄
// 			userid: id
// 		};
	
// 		ws.send(JSON.stringify(msg));
// 	}
	
// 	function sendMsg(){
// 		var msg = {
// 				type: "chat", //메시지를 구분하는 구분자 - 상대방 아이디와 메시지를 포함해서 보냄
// 				target: $("#targerId").val(),
// 				message: $("#message").val()
// 		};
// 		ws.send(JSON.stringify(msg));
// 	}
	
// 	// 페이지가 로딩되면 connect 실행
// 	$(()=>{
// 		connect();
// 		$("#sendBtn").on("click", function(){
// 			var chat = $("#messageArea").val();
// 			chat = chat + "\n나 : " + $("#message").val();
// 			$("#messageArea").val(chat);
// 			sendMsg();
// 			$("message").val("")
// 		})
// 	})
	
	// ==================================================
	$("#sendBtn").click(function() {
		var chat = $("#messageArea").val();
		chat = chat + "\n나 : " + $("#message").val();
		$("#messageArea").append(chat);
		
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8080/myapp/chat");
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	function onOpen(){
		console.log("연결 생성");
		register();
	}
	
	// 메시지 전송
	function sendMessage() {
		var msg = {
			type: "chat", //메시지를 구분하는 구분자 - 상대방 아이디와 메시지를 포함해서 보냄
			target: $("#targerId").val(),
			message: $("#message").val()
		};
		
		sock.send(JSON.stringify(msg));
		// sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		console.log(msg.data);	
		var data = msg.data;
		addMsg(data);
		// $("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
	
	function register (){ // 메시지 수신을 위한 서버에 id 등록하기
		var msg = {
			type: "register", //메시지를 구분하는 구분자 - 상대방 아이디와 메시지를 포함해서 보냄
			userid: id
		};

		sock.send(JSON.stringify(msg));
	}
	
	function addMsg(msg){ // 원래 채팅 메세지에 방금 받은 메세지 더해서 설정하기
		var chat = $("#message").val();
		chat = chat + "\n상대방 : " + msg;
		$("#messageArea").append(chat)
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/chat/chattest.js"></script>
</html>