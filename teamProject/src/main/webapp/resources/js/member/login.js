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
						
						var kakaoId = res.id;
						var kakaoGender = (res.kakao_account.gender == "male") ?  "M" : "F";
						var kakaoName = res.kakao_account.name;
                        var kakaoNick = res.kakao_account.profile.nickname;
                        var kakaoBirth = res.kakao_account.birthyear + res.kakao_account.birthday;
                        var kakaoTel = res.kakao_account.phone_number.replace("+82 ", "0").replaceAll("-","").trim();
                        var kakaoEmail = res.kakao_account.email;
                        
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
                        	url : "socialLoginPro",
                        	dataType : "text",
                        	success:function(data){
								console.log(data)
								if(data){
	                         		window.location = "../";		
								}
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
			   , url : "socialLoginPro"
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
		
		// ~~~~~~~~~~~~~~~~~~~아이디 중복체크~~~~~~~~~~~~~~~~~~~		
		$('#id').focus();	
		$('#dup').on("click",function(){
// 			alert("클릭");
//          아이디 비어있는 경우 제어
			if($('#id').val() == "" || $('#id').val() == null){
				$('#idCheckDiv').html("아이디 미입력").css('color', 'gray');
				$('#id').focus();
				return false;
			}
			$.ajax({
				url:'idCheck',
				data:{'MEM_ID':$('#id').val()},
				success:function(result){
// 					alert(result)
					if(result == 0){
						result = "ID 사용가능";
						$('#idCheckDiv').css('color', 'green');
						$('#idCheckDiv').html(result);
						return true;
					}else{
						result = "ID 중복";
						$('#idCheckDiv').css('color', 'red');
						$('#idCheckDiv').html(result);
						$('#id').focus();
						return false;
					}
					
				}
			});
		});
		
		// ~~~~~~~~~~~~~~~~~~~비밀번호 유효성 검사~~~~~~~~~~~~~~~~~~~
		$('#pw').blur(function(){
			// 비밀번호 확인 비어있는 경우 제어
			if($('#pw').val() == ' ' || $('#pw').val() == ''){
				$('#pwResult').html("비밀번호 입력 필수").css('color', 'gray');
				return false;
			}
			
			var pw = document.getElementById('pw').value;
			var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{6,14}$/;
			if (pwRegex.test(pw)) {
				$('#pwResult').html("적합한 비밀번호 입니다.").css('color', 'green')
			} else{
				$('#pwResult').html("비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.").css('color', 'red')
			}
		});
		
		// ~~~~~~~~~~~~~~~~~~~비밀번호 일치 확인~~~~~~~~~~~~~~~~~~~
		$('#confirmPw').blur(function(){
			// 비밀번호 확인 비어있는 경우 제어
			if($('#pw').val() == ' ' || $('#pw').val() == ''){
				$('#pwCheck').html("비밀번호 재입력 필수").css('color', 'gray');
				return false;
			}
		   if($('#pw').val() != $('#confirmPw').val()){
		   		$('#pwCheck').html("비밀번호가 일치하지 않습니다.").css('color', 'red')
//		    	    $('#confirmPw').val('');	// 공백만들기
//		      		$('#confirmPw').focus();	// 커서 이동
		    } else {
				$('#pwCheck').html("비밀번호가 일치합니다.").css('color', 'green')
			}
		});
		
		// ~~~~~~~~~~~~~~~~~~~닉네임 중복 체크~~~~~~~~~~~~~~~~~~~	
		$('#nickname').blur(function(){
			//  닉네임 비어있는 경우 제어
			if($('#nickname').val() == ' ' || $('#nickname').val() == ''){
				$('#nickCheck').html("닉네임 필수 입력").css('color', 'gray');
				return false;
			}
			var MEM_NICK = $('#nickname').val();

			$.ajax({
				url:'nickCheck',
				data:{'MEM_NICK':$('#nickname').val()},
				success:function(data){
	// 					alert(result)
					if(data == 0){
						$("#nickCheck").text("사용가능한 닉네임 입니다.").css('color', 'green');
						return true;
					}else{
						$("#nickCheck").text("이미 사용중인 닉네임 입니다.").css('color', 'red');
						return false;
					}
					
				}
			});
		});	
		
		// ~~~~~~~~~~~~~~~~~~~이메일 중복 체크~~~~~~~~~~~~~~~~~~~	
		//  이메일 비어있는 경우 제어
		$('#email').blur(function(){
			var MEM_EMAIL = $('#email').val();
			if(MEM_EMAIL == ' ' || MEM_EMAIL == ''){
				$('#emailCheck').html("이메일 필수 입력").css('color', 'gray');
				return false;
			}
			var email = document.getElementById('email').value;
			var emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;;
			

			$.ajax({
				url:'emailCheck',
				data:{'MEM_EMAIL': MEM_EMAIL},
				success:function(data){
	// 					alert(result)
					if(data == 0){
						if (emailRegex.test(email)) {
							$("#emailCheck").text("사용가능한 이메일 입니다.").css('color', 'green');
							return true;
						} else{
							$("#emailCheck").text("올바른 이메일 형식이 아닙니다.").css('color', 'red');
//							$('#pwResult').html("비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.").css('color', 'red')
							return true;
						}
//						$("#emailCheck").text("사용가능한 이메일 입니다.").css('color', 'green');
						
					}else{
						$("#emailCheck").text("이미 사용중인 이메일 입니다.").css('color', 'red');
						return false;
					}
					
				}
			});
		});	
		
		}) // 모달 끝
	
	
                
                
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
		
		signupModal.style.display = "none";
		location.replace('login');
	})
	// x버튼 클릭 시 모달 종료
	$('.close').on('click', function(){
		signupModal.style.display = "none";
		location.reload(true);
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



