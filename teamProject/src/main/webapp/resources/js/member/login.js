// ---------------------------------카카오 로그인---------------------------------
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
	
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (res) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (res) {
//                         alert(JSON.stringify(response))
                        console.log(res)
//                        var kakaoid = response.id;
						var kakaoId = res.id;
						var kakaoGender = (res.kakao_account.gender == "male") ?  "M" : "F";
						var kakaoName = res.kakao_account.name;
                        var kakaoNick = res.kakao_account.profile.nickname;
                        var kakaoBirth = res.kakao_account.birthyear + res.kakao_account.birthday;
                        var kakaoTel = res.kakao_account.phone_number.replace("+82 ", "0").replaceAll("-","").trim();
                        var kakaoEmail = res.kakao_account.email;
//                         var address = resonse.kakao_account.shipping_address;
						$("#id").val(kakaoId)
						$("#gender").val(kakaoGender)
						$("#username").val(kakaoName)
						$("#nickname").val(kakaoNick)
						$("#birth").val(kakaoBirth)
						$("#phone").val(kakaoTel)
						$("#email").val(kakaoEmail)
						
                        $.ajax({
                        	type : "post",
                        	data : {
	                 			  MEM_ID: kakaoId
					          	, MEM_GENDER: kakaoGender
					          	, MEM_NAME: kakaoName
					          	, MEM_NICK: kakaoNick
					          	, MEM_BIRTH: kakaoBirth
					          	, MEM_TEL: kakaoTel
					          	, MEM_EMAIL: kakaoEmail
	                			},
                        	url : "insertPro",
                        	dataType : "text",
                        	success:function(data){
								debugger;
								console.log(data)
								if(data){
	                         		window.location = "../";		
	                         		//session??
								}
								debugger
								$("#signupModal").modal("show");
                        	},
                        	error:function(){
                        		
                        	}
                        });//ajax
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
    }
    
    function kakaoLogout() {
		Kakao.Auth.logout(function(response) {
			alert(response + 'logout');
		}); 
    }

// ---------------------------------네이버 로그인---------------------------------
var naverLogin = new naver.LoginWithNaverId({
	clientId: "UfjkJoYj4eIJvlgpyxp_"
	, callbackUrl: "http://localhost:8080/myapp/member/login"
	, isPopup: false
	, callbackHandle: true
});
naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		console.log(status)
		if (status) {
			$.ajax({
				 type : "POST"
			   , datatype : "json"
			   , data: {
				   	 MEM_ID : naverLogin.user.id
				   , MEM_GENDER: naverLogin.user.gender
				   , MEM_NAME :naverLogin.user.name
				   , MEM_NICK :naverLogin.user.nickname
				   , MEM_BIRTH: naverLogin.user.birthyear + naverLogin.user.birthday.replace("-", "")
				   , MEM_TEL: naverLogin.user.mobile.replaceAll("-","").trim()
				   , MEM_EMAIL: naverLogin.user.email
			   }
			   , url : "insertPro"
			})
			.done(
				function(data){
					naverLogin.logout();
					location.href="../";					
			});
		}
	});
});

// ---------------------------------일반 로그인---------------------------------
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



