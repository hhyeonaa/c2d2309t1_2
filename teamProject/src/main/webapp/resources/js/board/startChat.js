var proNo = $("#proNo").val();
var iDsession = $(".id_session").val()
var memId;
$(()=>{
	$(".startChatBtn").on("click", function(){
		memId = iDsession;	
		
		
		//로그인 여부
		if( iDsession == null || iDsession == undefined || iDsession == "" ){
			alertMsg("AM23", ["로그인 후"])
			return;
		}
		
		// 본인 글인지 확인 (후추)
		if($("#proWr").val() == iDsession){
			alertMsg("AM12", ["본인 게시물", "채팅"])
			return;
		}
		// 룸 확인하기
		roomCheck(proNo, memId, "nomal")
		
	})
	
	$(".divideChatStartBtn").on("click", function(){
		memId = $(".divApp").eq($(this).index()).val(); 
		
		//로그인 여부
		if( iDsession == null || iDsession == undefined || iDsession == "" ){
			alert("로그인 하셈") // (후추)
			return;
		}
		
		// 룸 확인하기
		roomCheck(proNo, memId, "divide")
		
	})
})