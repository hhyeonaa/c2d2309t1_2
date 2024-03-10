document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');

var notMyPostChatRoom = (chatRoom) => {
	return '<div class="chatRoom notMyPost" id="'+chatRoom.PRO_NO+'">' +
					'<div style="font-size: 10px;">'+chatRoom.MEM_IMAGE+'</div>' +
					'<div class="chatRoomContents">' +
						'<div class="userNick">['+chatRoom.MEM_NICK+']</div>' +
						'<div class="postTit">'+chatRoom.PRO_NAME+'</div>' +
					'</div>' +
				'</div>'
}

$(()=>{
	var id = $(".id_session").val();
	var nick = $(".nick_session").val();
	
	$("#chatBtn").on("click", function(){
		openModal(id);
	})
	
	$("#exit").on("click", function(){
		closeModal();
	})
	
})

// 모달 열기
var modalToggle = 0;
var openModal = function(id){
	
	// 토글 on
	if(!modalToggle){
		modalToggle ++;	

		// 채팅방 불러오기
		$.ajax({
			url: '/' + window.location.pathname.split("/")[1] + '/chat/chatRoomData',
			type: "get",
			data: {
				memId: id
			}
		}).done(function(chatList){
			// 상대 이미지, 상대 닉네임, 게시물 제목, 마지막 채팅 여부
			console.log(chatList);
			for(chatRoom of chatList){
				var chat = notMyPostChatRoom(chatRoom);
				$("#chatList").append(chat);
			}
			
			$("#chatModal").css("display", "block");
			
			$(".chatRoom").on("click", function(){
				var proNo = $(this).attr("id");
				var nickName = $(this).find(".userNick").text();
				var title = $(this).find(".postTit").text();
				enterChat(proNo, nickName, title);
			})
			
			// 토글 off
			modalToggle--;
		})
	} else {
		console.log("막 누르지마라 ㅡㅡ")
	}
}

// 모달 끄가
var closeModal = function(){
	$("#chatModal").css("display", "none");
	$("#chatList").empty();
	$("#chatHead").empty();
	if(!$("#chatChoicePlease").length){
		$("#chatBody").append('<span id="chatChoicePlease">채팅을 선택해주세요</span>');
	}
}
// 채팅방 찾기
var roomCheck = function(proNo, memId){
	$.ajax({
		url: '/' + window.location.pathname.split("/")[1] + '/chat/roomCheck',
		type: "get",
		data: {
			proNo: proNo,
			memId: memId
		}
	})
	.done(function(result){
		console.log("채팅방이 있는지? : " + result);
		if(parseInt(result)){ // 채팅이 있을 경우
			console.log("채팅 있음")
			openModal(memId);				
		}
		else { // 채팅이 없을 경우
			//if(alertMsg("AM1", ["채팅을 시작하시겠습니까?"], true)){
				createChat(proNo, memId);
			//}
		}
	})
}

// 채팅방 생성
var createChat = function(proNo, memId){
	$.ajax({
		url: '/' + window.location.pathname.split("/")[1] + '/chat/createRoom',
		type: "get",
		data: {
			proNo: proNo,
			memId: memId
		}
	})
	.done(function(result){
		
		console.log("proNo : " + proNo + " / memId : " + memId);
		
		console.log("채팅방 생성 했는지? : " + result);
		if(parseInt(result)){ // 생성한 경우
			openModal(memId);
			// enterChat();				
		}
		else { // 생성못 한 경우
			console.log("채팅방 생성 실패")
		}
	})
	
};

// 채팅방 입장
var enterChat = function(proNo, nickName, title){
	// chatHead
	var chatRoomContents = '<div>이미지</div>'+
							'<div class="chatRoomContents">'+
								'<div class="userNick">'+nickName+'</div>'+
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
	$("#chatHead").empty();						
	$("#chatHead").append(chatRoomContents);
	$("#chatHead").append(systemContainer);
	
	// --------------------------------------------
	// chatBody
	$("#chatBody").empty();
} 
/*
 해야할 거 
  소켓 함수 만들기
  - 방 연결할 때 
 
  채팅방 선택하면 소켓 연결
  
  채팅한 거 디비 담기
 */
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