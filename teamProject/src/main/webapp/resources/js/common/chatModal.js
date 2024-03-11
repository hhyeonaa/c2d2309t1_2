document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');

/*
 해야할 거 
  소켓 함수 만들기
  - 방 연결할 때 
 
  채팅방 선택하면 소켓 연결
  
  채팅한 거 디비 담기
 */

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

// ****************** 변수 ****************** 
var notMyPostChatRoom = (chatRoom) => {
	return '<div class="chatRoom notMyPost" id="'+chatRoom.PRO_NO+'">' +
					'<input type="hidden" class="roomNo" id='+chatRoom.CR_NO+'>' +
					'<input type="hidden" class="target" id='+chatRoom.MEM_ID+'>' +
					'<div style="font-size: 10px;">'+chatRoom.MEM_IMAGE+'</div>' +
					'<div class="chatRoomContents">' +
						'<div class="userNick">['+chatRoom.MEM_NICK+']</div>' +
						'<div class="postTit">'+chatRoom.PRO_NAME+'</div>' +
					'</div>' +
				'</div>'
}

var myChat = (sendMsg, time) => {
	return '<div class="my Chat">' +
				'<div class="flexBox">' +
					'<div class="chatTime">'+time+'</div>' +
					'<div class="chatContent">'+sendMsg+'</div>' +
				'</div>' +
			'</div>'
}

var yourChat = (chat) => {
	return '<div class="your Chat">' +
				'<div>['+chat.nickName+']</div>' +
				'<div class="flexBox">' +
					'<div class="chatContent">'+chat.message+'</div>' +
					'<div class="chatTime">'+chat.time+'</div>' +
				'</div>' +
			'</div>'
}
// *****************************************


// ****************** 함수 ****************** 
// =========== 소켓 함수 ===========
// 소켓 연결
let sock = new SockJS("http://localhost:8080/myapp/chat");
sock.onopen = onOpen;
sock.onmessage = onMessage;
sock.onclose = onClose;

function onOpen(){
	console.log("연결 생성");
}

// 메시지 전송
function sendMessage(roomNo, nickName, target, sendMsg, time) {
	var msg = {
		type: "chat", //메시지를 구분하는 구분자 - 상대방 아이디와 메시지를 포함해서 보냄
		roomNo: roomNo,
		target: target,
		nickName: nickName,
		message: sendMsg,
		time: time
		
	};
	
	sock.send(JSON.stringify(msg));
}
// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
	addMsg(JSON.parse(msg.data));
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
	$("#chatBody").append("연결 끊김");

}

function register (roomNo){ // 메시지 수신을 위한 서버에 id 등록하기
	var msg = {
		type: "register", //메시지를 구분하는 구분자 - 상대방 아이디와 메시지를 포함해서 보냄
		memId: $(".id_session").val(), 
		roomNo: roomNo
	};
	console.log(msg);
	sock.send(JSON.stringify(msg));
}

function addMsg(chat){ // 원래 채팅 메세지에 방금 받은 메세지 더해서 설정하기
	$("#chatBody").append(yourChat(chat))
}
// =========== 소켓 함수 끝 ===========


// 모달 열기
var modalToggle = 0;
var openModal = function(id){
	
	// 토글 on
	if(!modalToggle){
		modalToggle ++;	

		// 채팅방 불러오기
		getChat(id, "yourPost");
		
		$("#chatModal").css("display", "block");
		
		// 내가 건 채팅 불러오기
		$("#yourPostChat").on("click", function(){
			$("#myPostChat").removeClass("on");
			$("#yourPostChat").addClass("on");
			
			getChat(id, "yourPost");
		})
		
		// 내 게시물 채팅 불러오기
		$("#myPostChat").on("click", function(){
			$("#yourPostChat").removeClass("on");
			$("#myPostChat").addClass("on");
			
			getChat(id, "myPost");
		})
		
		// 토글 off
		modalToggle--;
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
		$("#chatBody").empty();
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
var enterChat = function(roomNo, target, nickName, title){
	
	// 소켓 연결
	let sock = new SockJS("http://localhost:8080/myapp/chat");
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 소켓 방 생성
	register(roomNo);
	
	// chatHead
	var chatRoomContents = '<div>이미지</div>'+
							'<div class="chatRoomContents">'+
								'<input type="hidden" class="target" id='+target+'>' +
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
	
	$("#chatBody").append('<div id="chatBar">' +
								'<input id="sendText" class="form-control" type="text" placeholder="메시지를 입력해주세요.">' +
								'<button id="sendBtn" class="btn">전송</button>' +
							'</div>')
	
	$("#sendBtn").on("click", function() {
		sendMsgBtn(roomNo, target);
	});
	
	$("#sendText").on("keypress", function(e) {
		if(e.code == 'Enter'){
			sendMsgBtn(roomNo, target);	
		}
	});
	
}

// 채팅 가져오기
var getChat = function(id, post){
	$("#chatList").empty();
	
	$.ajax({
		url: '/' + window.location.pathname.split("/")[1] + '/chat/chatRoomData',
		type: "get",
		data: {
			memId: id,
			post : post
		}
	})
	.done(function(chatList){
		showChatList(chatList);
	})
}

// 가져온 게시물 데이터 그려주기
var showChatList = function(chatList){
	// 상대 이미지, 상대 닉네임, 게시물 제목, 마지막 채팅 여부
	console.log(chatList);
	for(chatRoom of chatList){
		$("#chatList").append(notMyPostChatRoom(chatRoom));
	}
	
	$(".chatRoom").on("click", function(){
		var target = $(this).find(".target").attr("id");
		var nickName = $(this).find(".userNick").text();
		var title = $(this).find(".postTit").text();
		var roomNo = $(this).find(".roomNo").attr("id");
		enterChat(roomNo, target, nickName, title);
	})
}

var sendMsgBtn = function(roomNo, target){
	var sendMsg = $("#sendText").val();
		let time = new Date().toLocaleTimeString();
		// 내용 없으면 안보내기
		if(sendMsg.trim() == ""){
			return;
		}
		
		// 화면 그리기
		$("#chatBody").append(myChat(sendMsg, time));
		
		// 메세지 전송
		sendMessage(roomNo, $(".nick_session").val(), target, sendMsg, time);

		// db 담기
		
		$("#sendText").val("");
}

// *****************************************


