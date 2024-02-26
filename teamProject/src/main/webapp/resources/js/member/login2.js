// -------------------카카오 로그인-------------------
Kakao.init('d494fc385e77a1fec1a8a162bd120af8'); // 사용하려는 앱의 JavaScript 키 입력
Kakao.isInitialized();
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            Kakao.Auth.setAccessToken(authObj.access_token);
            getInfo();
        }
    });
}
	
function getInfo() {
Kakao.API.request({
    url: '/v2/user/me', 
    success: function (res) {
		console.log(res)
         $.ajax({
	         type : "POST"
	         , url : "loginPro"
	         , data : {
				  MEM_ID: res.id
	          	, MEM_GENDER: (res.kakao_account.gender == "male") ?  "M" : "F"
	          	, MEM_NAME: res.kakao_account.name
	          	, MEM_NICK: res.kakao_account.profile.nickname
	          	, MEM_BIRTH: res.kakao_account.birthyear + res.kakao_account.birthday
	          	, MEM_TEL: res.kakao_account.phone_number.replace("+82 ", "0").replaceAll("-","").trim()
	          	, MEM_EMAIL: res.kakao_account.email
	          	
	         }
         })
         .done(
			function(data){
				Kakao.Auth.logout();
				location.href="mypage";					
		}); 
    }
    , fail: function (error) {
        alert('카카오 로그인에 실패했습니다.' + JSON.stringify(error));
    }
});
}

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
		 
		alert("회원가입 되었습니다.");
		signupModal.style.display = "none";
		location.replace('login');
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



