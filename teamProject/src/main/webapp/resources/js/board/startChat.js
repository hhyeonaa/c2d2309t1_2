document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>'); 

$(()=>{
	$(".startChatBtn").on("click", function(){
		//if(alertMsg("AM1", ["채팅을 시작하시겠습니까?"], true)){
			$("#chatModal").css("display", "block");
			
			
			var chatRoom = '<div class="chatRoom notMyPost" id="'+$("#proNo")+'">'+
								'<div>이미지</div>'+
								'<div class="chatRoomContents">'+
									'<div class="userNick">[닉네임]</div>'+
									'<div class="postTit">다른 게시물 제목</div>'+
									'<div class="lastChat">마지막 채팅 내용</div>'+
								'</div>'
							'</div>'
			
			$("#chatList").append(chatRoom);	
		//}
		
	})
})