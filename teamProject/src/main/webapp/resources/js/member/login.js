
$(function(){
	var signModal = document.getElementById("signupModal");
	var idModal = document.getElementById("idModal");
	var idResultModal = document.getElementById("IdResultModal");
	var pwModal = document.getElementById("pwModal");
	var pwResultModal = document.getElementById("pwResultModal");
	
	// ------------------이메일로 가입하기------------------
	// 이메일로 가입하기 버튼 클릭 시 모달 열기
	$('#signupButton').on('click', function(){
		signModal.style.display = "block";
	})
	
	// 버튼 클릭 시 insert
	$('#insertBtn').on('click', function(){
		$.ajax({
			type: "post"
			, url: "insertPro"
			, data: { MEM_ID: $('#id').val()
					 ,MEM_PW: $('#pw').val()
					 ,MEM_GENDER: $('#gender').val()
					 ,MEM_NAME: $('#username').val()
					 ,MEM_NICK: $('#nickname').val()
					 ,MEM_BIRTH: $('#birth').val()
					 ,MEM_TEL: $('#phone').val()
					 ,MEM_EMAIL: $('#email').val() }
		})
		.done(function(data){
			alert('회원가입이 완료되었습니다.');
			signupModal.style.display = "none";	
		})
	})
	
	// x버튼 클릭 시 모달 종료
	$('.close').on('click', function(){
		signupModal.style.display = "none";	
	});
	
	// -----------------아이디 찾기------------------
	// 아이디 찾기 버튼 클릭 시 모달 열기
	$('#find_id').on('click', function(){
		idModal.style.display = "block";
	})
	
	// x버튼 클릭 시 모달 종료
	$('.closeId').on('click', function closeId(){
		idModal.style.display = "none";	
	});
	
	// -----------------아이디 찾기 결과------------------
	// 다음 버튼 클릭 시 모달 열기
	$('#idNext').on('click', function(){
		idModal.style.display = "none";
		idResultModal.style.display = "block";
	})
	
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



