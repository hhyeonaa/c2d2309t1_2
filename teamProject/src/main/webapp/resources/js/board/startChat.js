var proNo = $("#proNo").val();
var memId = $(".id_session").val();	
$(()=>{
	$(".startChatBtn").on("click", function(){
		var iDsession = $(".id_session").val()
		
		//로그인 여부
		if( iDsession == null || iDsession == undefined || iDsession == "" ){
			alert("로그인 하셈") // (후추)
			return;
		}
		
		// 본인 글인지 확인 (후추)
		if($("#proWr").val() == iDsession){
			alert("니 글임 체팅 ㄴㄴ") // (후추)
			return;
		}
		// 룸 확인하기
		roomCheck(proNo, memId)
		
	})
})