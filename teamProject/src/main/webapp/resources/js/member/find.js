document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');

$(function(){
	// -----------------아이디 찾기 결과 모달------------------
	var authModal = document.getElementById("authModal");
	
	let inputs = document.searchForm;
	// 다음 버튼 클릭 시 모달 열기
	$('#authBtn').on('click', function(){
//		session.removeAttribute("AuthNumber");
//		session.removeAttribute("authCheck");
		
		if(!inputs.authCode.value) {
			alertMsg("AM6", ["인증번호"]);
		} else if(AuthNumber != inputs.authCode.value){
			alertMsg("AM7", ["인증번호"]);	
//			alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
		} else {
			IdResultModal.style.display = "block";
		}
	});
	
	$('#authOk').on('click', function(){
		var findId = '<%=(String)session.getAttribute("findId")%>';
		IdResultModal.style.display = "none";
		location.href="login";
	});
	
	
	// x버튼 클릭 시 모달 종료
	$('.closeIdResult').on('click', function(){
		IdResultModal.style.display = "none";	
	});
	
	// -----------------비밀번호 찾기 결과------------------
	// 다음 버튼 클릭 시 모달 열기
	$('#pwNext').on('click', function(){
		if(!inputs.authCode.value) {
			alert("인증번호를 입력해 주세요.");
		} else if(AuthNumber != inputs.authCode.value){
			alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
		} else {
			pwResultModal.style.display = "block";
		}
	});
	
	$('#pwUpdate').on('click', function(){
		$.ajax({
			url: 'pwUpdate',
			type: 'post',
			data: {
				MEM_EMAIL: $('#email').val(),
				MEM_PW: $('#pw').val()
				}
		})
		.done(function(data){
			if(data == 1) {
				location.href="login";
			}
		})
		
	});
	
//	// 비밀번호 유효성 + 일치 확인
//	function check_pw(){
//    var pw = document.getElementById('pw').value;
//    var pw2 = document.getElementById('pw2').value;
//    var check = document.getElementById('check');
//    var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{6,14}$/;
//
//	if (pwRegex.test(pw)) {
//		if (pw == pw2 && pw != '') {
//			check.innerHTML = '비밀번호가 일치합니다.';
//			check.style.color = 'green';
//			$("#authOk").attr("disabled", false); 
//		}else{
//			check.innerHTML = '비밀번호가 일치하지 않습니다.';
//			check.style.color = 'red';
//		}
//	}else{
//		check.innerHTML = '비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.';
//		check.style.color = 'red';
//	}
//}
// ~~~~~~~~~~~~~~~~~~~비밀번호 유효성 검사~~~~~~~~~~~~~~~~~~~
		$('#pw').blur(function(){
			// 비밀번호 확인 비어있는 경우 제어
			if($('#pw').val() == ' ' || $('#pw').val() == ''){
				$('#newPw').html("비밀번호 입력 필수").css('color', 'gray');
				return;
			}
			
			var pw = document.getElementById('pw').value;
			var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{6,14}$/;
			if (pwRegex.test(pw)) {
				$('#newPw').html("적합한 비밀번호 입니다.").css('color', 'green')
			} else{
				$('#newPw').html("비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.").css('color', 'red')
			}
		});
		
		// ~~~~~~~~~~~~~~~~~~~비밀번호 일치 확인~~~~~~~~~~~~~~~~~~~
		$('#pw2').blur(function(){
			// 비밀번호 확인 비어있는 경우 제어
			if($('#pw2').val() == ' ' || $('#pw2').val() == ''){
				$('#newPw2').html("비밀번호 재입력 필수").css('color', 'gray');
				return;
			}
		   if($('#pw').val() != $('#pw2').val()){
		   		$('#newPw2').html("비밀번호가 일치하지 않습니다.").css('color', 'red')
		   		return
//		    	    $('#confirmPw').val('');	// 공백만들기
//		      		$('#confirmPw').focus();	// 커서 이동
		   } 
			
			$('#newPw2').html("비밀번호가 일치합니다.").css('color', 'green')
			
		});
	
	// x버튼 클릭 시 모달 종료
	$('.closePwResult').on('click', function(){
		pwResultModal.style.display = "none";	
	});
	
});



