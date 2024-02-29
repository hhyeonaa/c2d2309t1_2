$(function(){
	debugger
	// ~~~~~~~~~~~~~~~~~~~비밀번호 유효성 검사~~~~~~~~~~~~~~~~~~~
	$('#MEM_PW').blur(function(){
		// 비밀번호 확인 비어있는 경우 제어
		if($('#MEM_PW').val() == ' ' || $('#MEM_PW').val() == ''){
			$('#pwCheck').html("비밀번호 입력 필수").css('color', 'gray');
			return;
		}
		
		var pw = document.getElementById('MEM_PW').value;
		var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{6,14}$/;
		if (pwRegex.test(pw)) {
			$('#pwCheck').html("적합한 비밀번호 입니다.").css('color', 'green')
		} else{
			$('#pwCheck').html("비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.").css('color', 'red')
			return
		}
	});
		
	// ~~~~~~~~~~~~~~~~~~~닉네임 중복 체크~~~~~~~~~~~~~~~~~~~	
	$('#MEM_NICK').blur(function(){
		//  닉네임 비어있는 경우 제어
		if($('#MEM_NICK').val() == ' ' || $('#MEM_NICK').val() == ''){
			$('#nickCheck').html("닉네임 필수 입력").css('color', 'gray');
			return;
		}
		var MEM_NICK = $('#MEM_NICK').val();
	
		$.ajax({
			url:'nickCheck',
			data:{'MEM_NICK':$('#MEM_NICK').val()},
			success:function(data){
				if(data == 0){
					$("#nickCheck").text("사용가능한 닉네임 입니다.").css('color', 'green');
					
				}else{
					$("#nickCheck").text("이미 사용중인 닉네임 입니다.").css('color', 'red');
					return;
				}
				
			}
		});
	});	
});	
	// 버튼 클릭 시 update
	$('#updateBtn').on('click', function(){
		
		if($('#MEM_PW').val() == "" || $('#MEM_PW').val() == null){
			alert("변경할 비밀번호를 입력해 주세요.");
			$('#MEM_PW').focus();	
			return false;
		}
		
		if($('#MEM_NAME').val() == "" || $('#MEM_NAME').val() == null){
			alert("변경할 이름을 입력해 주세요.");
			$('#MEM_NAME').focus();	
			return false;
		}
		
		if($('#MEM_NICK').val() == "" || $('#MEM_NICK').val() == null){
			alert("변경할 닉네임을 입력해 주세요.");
			$('#MEM_NICK').focus();	
			return false;
		}
		
		if($('#MEM_BIRTH').val() == "" || $('#MEM_BIRTH').val() == null){
			alert("변경할 생년월일을 입력해 주세요.");
			$('#MEM_BIRTH').focus();	
			return false;
		}
//		
//		$.ajax({
//			type: "post"
//			, url: "memberEditPro"
//			, data: { MEM_NICK: $('#MEM_NICK').val()
//					 ,MEM_PW: $('#MEM_PW').val()
//					 ,MEM_TEL: $('#MEM_TEL').val()
//					 ,MEM_EMAIL: $('#MEM_EMAIL').val()
//					 ,MEM_BIRTH: $('#MEM_BIRTH').val()
//					 ,MEM_IMAGE: $('#MEM_IMAGE').val() }
//		});
//		
	})