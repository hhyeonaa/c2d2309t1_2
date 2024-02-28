$(function(){
//	// -----------------아이디 찾기------------------
//	// 아이디 찾기 버튼 클릭 시 모달 열기
//	$('#find_id').on('click', function(){
//		idModal.style.display = "block";
//		$('#idNumber').on('click', function(){
//			$.ajax({
//				type: 'POST',
//				url:'findId',
//				data:{'MEM_EMAIL':$('#email_id').val()}
//			})
//			.done({
//				
//			})
//		});
//	})
//	
//	// x버튼 클릭 시 모달 종료
//	$('.closeId').on('click', function closeId(){
//		idModal.style.display = "none";	
//	});
	
	// -----------------아이디 찾기 결과------------------
	var authModal = document.getElementById("authModal");
	
	let inputs = document.searchForm;
	// 다음 버튼 클릭 시 모달 열기
	$('#authBtn').on('click', function(){
//		session.removeAttribute("AuthNumber");
//		session.removeAttribute("authCheck");
		
		if(!inputs.authCode.value) {
			alert("인증번호를 입력해 주세요.");
		} else if(AuthNumber != inputs.authCode.value){
			alert("인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
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
	
	// -----------------비밀번호 찾기------------------
	// 비밀번호 찾기 버튼 클릭 시 모달 열기
	$('#find_pw').on('click', function(){
		pwModal.style.display = "block";
	})
	
	// x버튼 클릭 시 모달 종료
	$('.closePw').on('click', function closePw(){
		pwModal.style.display = "none";	
	});
	
	// -----------------비밀번호 찾기 결과------------------
	// 다음 버튼 클릭 시 모달 열기
	$('#pwNext').on('click', function(){
		pwModal.style.display = "none";
		pwResultModal.style.display = "block";
	})

	// x버튼 클릭 시 모달 종료
	$('.closePwResult').on('click', function(){
		pwResultModal.style.display = "none";	
	});
});



