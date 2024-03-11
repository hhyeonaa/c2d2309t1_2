var proNo = $("#proNo").val();
var memId = $(".id_session").val();	
$(()=>{
	$(".startChatBtn").on("click", function(){
		// 로그인 했는지 (후추)
		
		// 본인 글인지 확인 (후추)
		
		// 룸 확인하기
		roomCheck(proNo, memId)
		
//		$("#chatModal").css("display", "block");
//		
//		
//		var chatRoom = '<div class="chatRoom notMyPost" id="'+$("#proNo")+'">'+
//							'<div>이미지</div>'+
//							'<div class="chatRoomContents">'+
//								'<div class="userNick">[닉네임]</div>'+
//								'<div class="postTit">다른 게시물 제목</div>'+
//								'<div class="lastChat">마지막 채팅 내용</div>'+
//							'</div>'
//						'</div>'
//		
//		$("#chatList").append(chatRoom);	
		
	})
})