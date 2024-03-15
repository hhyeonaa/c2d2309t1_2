$(function(){
//	function editImage() {
//		let CUS_IMAGE = document.getElementById("CUS_IMAGE");
//		CUS_IMAGE.click();
//	}
//	
//	function setThumbnail(event){
//		var reader = new FileReader();
//		reader.onload = function(event){
//			document.getElementById("newImage").src = event.target.result;
//		};
//		reader.readAsDataURL(event.target.files[0]);
//	}
	
	
	$('#defaultBtn').on('click', function(){
		if(confirm("현재 프로필이미지를 삭제하고 기본으로 변경하시겠습니까?")) document.location = 'resetImage';
	})
	
	$('#image').change(function(event) {
        var reader = new FileReader();
        reader.onload = function(event) {
            $('#img').attr('src', event.target.result);
        };
        reader.readAsDataURL(event.target.files[0]);
    });
	
	$('#inputBtn').on('click', function(){
		$('#image').click();
	})
	
	
	$('#updateBtn').on('click', function(){
		var data = {  
					  MEM_ID: $('#MEM_ID').val()
					 ,MEM_EMAIL: $('#MEM_EMAIL').val()
					 ,MEM_NAME: $('#MEM_NAME').val()
					 ,MEM_NICK: $('#MEM_NICK').val()
					 ,MEM_PW: $('#MEM_PW').val()
					 ,MEM_TEL: $('#MEM_TEL').val()
					 ,MEM_BIRTH: $('#MEM_BIRTH').val() }
		console.log(data);
		const formdata = new FormData();
		formdata.append("map", JSON.stringify(data));
		formdata.append("image", $('#image')[0].files[0]);
		
		$.ajax({
			type: "post"
			, url: '/' + window.location.pathname.split("/")[1] + "/member/memberEditPro"
			, data: formdata
			, contentType: false
        	, processData: false    
			, enctype: "multipart/form-data"
		})
		.done(function(data){
			console.log(data);
//			console.log($('#image').val().split('\\').pop());
			location.href='mypage';
		})
	})
	
	
	
	
	
	
	// ~~~~~~~~~~~~~~~~~~~비밀번호 유효성 검사~~~~~~~~~~~~~~~~~~~
	$('#MEM_PW').change(function(){
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
	$('#MEM_NICK').change(function(){
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
//	// 버튼 클릭 시 update
//	$('#updateBtn').on('click', function(){
//
//		var data = {  
//					  MEM_ID: $('#MEM_ID').val()
//					 ,MEM_EMAIL: $('#MEM_EMAIL').val()
//					 ,MEM_NAME: $('#MEM_NAME').val()
//					 ,MEM_NICK: $('#MEM_NICK').val()
//					 ,MEM_PW: $('#MEM_PW').val()
//					 ,MEM_TEL: $('#MEM_TEL').val()
//					 ,MEM_BIRTH: $('#MEM_BIRTH').val() }
//		console.log(data);
//		const formdata = new FormData();
//		formdata.append("map", JSON.stringify(data));
//		formdata.append("image", $('#image')[0].files[0]);
//		
//		$.ajax({
//			type: "post"
//			, url: "memberEditPro"
//			, data: formdata
//			, contentType: false
//        	, processData: false    
//			, enctype: "multipart/form-data"
//		})
//		.done(function(data){
////			console.log($('#image').val().split('\\').pop());
//			location.href='mypage';
//		})
//	})
		
		
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
	