// ---------------------------------카카오 로그인---------------------------------
Kakao.init('e44dce7d469ddd0572f9316a1a71d609'); // 사용하려는 앱의 JavaScript 키 입력
Kakao.isInitialized();
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            Kakao.Auth.setAccessToken(authObj.access_token);
            getInfo();
        }
    });
}

 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');
	
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
	clientId: "BPAgVjaOdpfSIk0NTLbZ"
	, callbackUrl: "http://c2d2309t1.itwillbs.com/Damoim/member/login"
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
	
//	$("#loginBtn").click(function() {
//        $("#loginForm").submit();
//      alertMsg("AM7", ["아이디, 비밀번호"]);
//    });
	
	// ------------------이메일로 가입하기------------------
	// 이메일로 가입하기 버튼 클릭 시 모달 열기
	$('#signupButton').on('click', function(){
		
		
		signModal.style.display = "block";
		
		// ~~~~~~~~~~~~~~~~~~~아이디 중복체크~~~~~~~~~~~~~~~~~~~		
		$('#id').focus();	
		$('#dup').on("click",function(){
			var id = document.getElementById('id').value;
			var idRegex =  /^(?![\s])[a-zA-Z0-9]{6,12}$/;
//          아이디 비어있는 경우 제어
			if($('#id').val() == "" || $('#id').val() == null){
				$('#idCheckDiv').html("아이디 미입력").css('color', 'gray');
				$('#id').focus();
				return;
			}
			$.ajax({
				url:'idCheck',
				data:{'MEM_ID':$('#id').val()},
				success:function(result){
// 					alert(result)
					if(result == 0){
						if (idRegex.test(id)) {
							$("#idCheckDiv").text("ID 사용가능").css('color', 'green');
						} else{
							$("#idCheckDiv").text("ID 사용불가").css('color', 'red');
							return;
						}
					}else{
						result = "ID 중복";
						$('#idCheckDiv').css('color', 'red');
						$('#idCheckDiv').html(result);
						$('#id').focus();
						return;
					}
					
				}
			});
		});
		
		// ~~~~~~~~~~~~~~~~~~~비밀번호 유효성 검사~~~~~~~~~~~~~~~~~~~
		$('#pw').change(function(){
			// 비밀번호 확인 비어있는 경우 제어
			if($('#pw').val() == ' ' || $('#pw').val() == ''){
				$('#pwResult').html("비밀번호 입력 필수").css('color', 'gray');
				return;
			}
			
			var pw = document.getElementById('pw').value;
			var pwRegex = /^(?=\S*[a-zA-Z])(?=\S*[0-9])(?=\S*[!@#$%^&*?_])\S{6,14}$/;
			if (pwRegex.test(pw)) {
				$('#pwResult').html("적합한 비밀번호 입니다.").css('color', 'green')
			} else{
				$('#pwResult').html("비밀번호는 (영문, 숫자, 특수 문자 포함) 6~14자여야 합니다.").css('color', 'red')
			}
		});
		
		// ~~~~~~~~~~~~~~~~~~~비밀번호 일치 확인~~~~~~~~~~~~~~~~~~~
		$('#confirmPw').change(function(){
			// 비밀번호 확인 비어있는 경우 제어
			if($('#confirmPw').val() == ' ' || $('#confirmPw').val() == ''){
				$('#pwCheck').html("비밀번호 재입력 필수").css('color', 'gray');
				return;
			}
		   if($('#pw').val() != $('#confirmPw').val()){
		   		$('#pwCheck').html("비밀번호가 일치하지 않습니다.").css('color', 'red')
		   		return
//		    	    $('#confirmPw').val('');	// 공백만들기
//		      		$('#confirmPw').focus();	// 커서 이동
		   } 
			
			$('#pwCheck').html("비밀번호가 일치합니다.").css('color', 'green')
			
		});
		
		
		// ~~~~~~~~~~~~~~~~~~~닉네임 중복 체크~~~~~~~~~~~~~~~~~~~	
		$('#nickname').change(function(){
			//  닉네임 비어있는 경우 제어
			if($('#nickname').val() == ' ' || $('#nickname').val() == ''){
				$('#nickCheck').html("닉네임 필수 입력").css('color', 'gray');
				return;
			}
			var MEM_NICK = $('#nickname').val();
			
			var nickname = document.getElementById('nickname').value;
			var nickRegex = /^(?!\d)(?!.*\s)[a-zA-Z가-힣\d]{2,10}$/;
			$.ajax({
			    url: 'nickCheck',
			    data: { 'MEM_NICK': MEM_NICK },
			    success: function (data) {
			        if (data == 0) {
			            if (nickRegex.test(nickname)) {
			                $("#nickCheck").text("사용가능한 닉네임 입니다.").css('color', 'green');
			            } else {
			                $("#nickCheck").text("올바른 닉네임 형식이 아닙니다.").css('color', 'red');
			            }
			        } else {
			            $("#nickCheck").text("이미 사용중인 닉네임 입니다.").css('color', 'red');
			        }
			    }
			})
		});	
		
		// ~~~~~~~~~~~~~~~~~~~이메일 중복 체크~~~~~~~~~~~~~~~~~~~	
		$('#email').change(function() {
		    var email = $('#email').val().trim();
		    // 이메일 비어있는 경우 처리
		    if (email === '') {
		        $('#emailCheck').html("이메일을 입력해주세요.").css('color', 'gray');
		        return;
		    }
		    // 이메일 유효성 검사
		    var emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		    if (!emailRegex.test(email)) {
		        $("#emailCheck").text("올바른 이메일 형식이 아닙니다.").css('color', 'red');
		        return;
		    }
		    // 중복 체크
		    $.ajax({
		        url: 'emailCheck',
		        data: { 'MEM_EMAIL': email },
		        success: function(data) {
		            if (data == 0) {
		                $("#emailCheck").text("사용가능한 이메일 입니다.").css('color', 'green');
		            } else {
		                $("#emailCheck").text("이미 사용중인 이메일 입니다.").css('color', 'red');
		            }
		        }
		    });
		});
		
		// ~~~~~~~~~~~~~~~~~~~전화번호 중복 체크~~~~~~~~~~~~~~~~~~~	

		$('#phone').change(function() {
		    var phone = $('#phone').val().trim();
		    
		    // 전화번호 비어있는 경우 처리
		    if (phone === '') {
		        $('#phoneCheck').html("전화번호를 입력해주세요.").css('color', 'gray');
		        return;
		    }
		    
			var phone = document.getElementById('phone').value;
			var phoneRegex = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
			
			$.ajax({
				url:'phoneCheck',
				data:{'MEM_TEL':$('#phone').val()},
				success:function(data){
					if(data == 0){
						if (phoneRegex.test(phone)) {
							$("#phoneCheck").text("사용가능한 전화번호 입니다.").css('color', 'green');
							return;
						} else{
							$("#phoneCheck").text("올바른 전화번호 형식이 아닙니다.").css('color', 'red');
							return;
						}
						
					}
					
					$("#phoneCheck").text("이미 사용중인 전화번호 입니다.").css('color', 'red');
				}
			});
		});	
		
		    // 전화번호 유효성 검사
		    var phoneRegex = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
		    if (!phoneRegex.test(phone)) {
		        $("#phoneCheck").text("올바른 전화번호 형식이 아닙니다.").css('color', 'red');
		        return;
		    }
		
		    // 중복 체크
		    $.ajax({
		        url: 'phoneCheck',
		        data: { 'MEM_TEL': phone },
		        success: function(data) {
		            if (data == 0) {
		                $("#phoneCheck").text("사용가능한 전화번호 입니다.").css('color', 'green');
		            } else {
		                $("#phoneCheck").text("이미 사용중인 전화번호 입니다.").css('color', 'red');
		            }
		        }
		    });
		});
		
	}) // 모달 끝
	
	
	
	
                
                
	// 버튼 클릭 시 insert
	$('#insertBtn').on('click', function(){
		
		if ($('#id').val() === "") {
		    alertMsg("AM6", ["아이디"]);
		    $('#id').focus();
		    return false;
		}
		
		if ($('#pw').val() === "") {
		    alertMsg("AM6", ["비밀번호"]);
		    $('#pw').focus();
		    return false;
		}
		
		if ($('#confirmPw').val() === "") {
		    alertMsg("AM6", ["비밀번호 확인"]);
		    $('#confirmPw').focus();
		    return false;
		}
		
		if ($('#gender').val() === "") {
		    alertMsg("AM9", ["성별"]);
		    $('#gender').focus();
		    return false;
		}
		
		if ($('#username').val() === "") {
		    alertMsg("AM6", ["이름"]);
		    $('#username').focus();
		    return false;
		}
		
		if ($('#nickname').val() === "") {
		    alertMsg("AM6", ["닉네임"]);
		    $('#nickname').focus();
		    return false;
		}
		
		if ($('#birth').val() === "") {
		    alertMsg("AM6", ["생년월일"]);
		    $('#birth').focus();
		    return false;
		}
		
		var birth = $('#birth').val();
		var birthRegex = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
		if (!birthRegex.test(birth)) {
		    alertMsg("AM5", ["생년월일 형식"]);
		    $('#birth').focus();
		    return false;
		}
		
		if ($('#email').val() === "") {
		    alertMsg("AM6", ["이메일"]);
		    $('#email').focus();
		    return false;
		}
				
		
		if ($('#phone').val() === "") {
		    alertMsg("AM6", ["전화번호"]);
		    $('#phone').focus();
		    return false;
		}
		
		var phone = document.getElementById('phone').value;
		var phoneRegex = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
		if (!phoneRegex.test(phone)) {
			alertMsg("AM5", ["전화번호 형식"]);
			$('#phone').focus();
			return false;
		}
		
		var id = document.getElementById('id').value;
		var idRegex = /^(?![\s])[a-zA-Z0-9]{6,12}$/;
		if (!idRegex.test(id)) {
			alertMsg("AM5", ["아이디 형식"]);
			$('#id').focus();
			return false;
		}
		
		if($('#pw').val() != $('#confirmPw').val()){
		   	alertMsg("AM7", ["비밀번호"]);
			$('#pw').focus();	
			return false;	
		}
		
		var pw = document.getElementById('pw').value;
		var pwRegex = /^(?=\S*[a-zA-Z])(?=\S*[0-9])(?=\S*[!@#$%^&*?_])\S{6,14}$/
		if (!pwRegex.test(pw)) {
			alertMsg("AM5", ["비밀번호 형식"]);
			$('#pw').focus();
			return false;
		}
		
		var name = document.getElementById('username').value;
		var nameRegex = /^[가-힣]{2,15}$/;
		if (!nameRegex.test(name)) {
			alertMsg("AM5", ["이름"]);
			$('#username').focus();
			return false;
		}
	
		/* 숫자 및 영문, 자음 사용 금지 구문 */
		for (var i=0; i<$("#username").val().length; i++)  {
		     var chk = $("#username").val().substring(i,i+1);
		     if(chk.match(/[0-9]|[a-z]|[A-Z]/)) {
		     	alertMsg("AM6", ["정확한 이름"]);
				$('#username').focus();
				return false;
		    }
		    if(chk.match(/([^가-힣\x20])/i)){
		    	alertMsg("AM6", ["정확한 이름"]);
				$('#username').focus();
				return false;
		    }
		    if($("#username").val() == " "){
		    	alertMsg("AM6", ["정확한 이름"]);
				$('#username').focus();
				nickCheck();
				return false;
		    }} 
		
		
     $.ajax({
        url:'idCheck',
        data:{'MEM_ID':$('#id').val()},
        success:function(result){
            if(result != 0){
                alertMsg("AM5", ["중복된 아이디 입니다. 아이디"]);
                $('#id').focus();
            } else {
                // 닉네임 중복 체크 실행
                checkNickname();
            }
        }
     }); 
    
     function checkNickname() {
        $.ajax({
            url:'nickCheck',
            data:{'MEM_NICK':$('#nickname').val()},
        })
        .done(function(data){
            if(data != 0){
                alertMsg("AM5", ["중복된 닉네임 입니다. 닉네임"]);
                $('#nickname').focus();
            } else {
				// 이메일 중복 체크 실행
                checkEmail();
            }
        });
    }
    
    function checkEmail() {
        $.ajax({
            url:'emailCheck',
            data:{'MEM_EMAIL':$('#email').val()},
            success:function(result){
                if(result != 0){
                    alertMsg("AM5", ["중복된 이메일 입니다. 이메일"]);
                    $('#email').focus();
                } else {
                    // 전화번호 중복 체크 실행
                    checkPhone();
                }
            }
        });
    }
    
    function checkPhone() {
        $.ajax({
            url:'phoneCheck',
            data:{'MEM_TEL':$('#phone').val()},
            success:function(result){
                if(result != 0){
                    alertMsg("AM5", ["중복된 전화번호 입니다. 전화번호"]);
                    $('#phone').focus();
                } else {
                    // 아이디 중복 체크 실행
                    insertMember();
                }
            }
        });
    }
    
    function insertMember() {
        $.ajax({
            type: "post",
            url: "insertPro",
            data: { 
                MEM_ID: $('#id').val(),
                MEM_PW: $('#pw').val(),
                MEM_GENDER: $('#gender').val(),
                MEM_NAME: $('#username').val(),
                MEM_NICK: $('#nickname').val(),
                MEM_BIRTH: $('#birth').val(),
                MEM_TEL: $('#phone').val(),
                MEM_EMAIL: $('#email').val() 
            },
            success: function (data) {
                alertMsg("AM3", ["회원가입"]);
                signupModal.style.display = "none";
                location.replace('login');
            }
        });
    }
		
	});
	// x버튼 클릭 시 모달 종료
	$('.close').on('click', function(){
		signupModal.style.display = "none";
		location.reload(true);
	});
	
	
	// -----------------아이디 찾기 결과------------------
	// 다음 버튼 클릭 시 모달 열기
	$('#idNext').on('click', function(){
		idModal.style.display = "none";
//		session.removeAttribute("AuthNumber");
//		session.removeAttribute("authCheck");
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