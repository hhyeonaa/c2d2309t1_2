$(()=>{
	$("#chatBtn").on("click", function(){
		$("#chatModal").css("display", "block");
	})
	
	$("#exit").on("click", function(){
		$("#chatModal").css("display", "none");
	})
	
	$(".chatRoom").on("click", function(){
		
	})
	
})

var startChat = function(proNo, nickName, title){
	var chatRoomContents = '<div>이미지</div>'+
							'<div class="chatRoomContents">'+
								'<div class="userNick">['+nickName+']</div>'+
								'<div class="postTit">'+title+'</div>'+
							'</div>';
	
	var systemContainer = '<div id="systemContainer">' +
								'<div class="reportBtn">' +
									'<span class="material-symbols-outlined reportIcon">notifications_active</span>' +
								'</div>' +
								'<div>' +
									'<select class="form-select">' +
										'<option>거래가능</option>' +
										'<option>거래중</option>' +
										'<option>거래완료</option>' +
									'</select>' +
								'</div>' +
								'<span style="margin-bottom: 5px; font-size: 12px;">게시판 작성자만 사용 가능합니다</span>' +
							'</div>';
	
	
									
} 

var id = "${sessionScope.MEM_ID}";
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