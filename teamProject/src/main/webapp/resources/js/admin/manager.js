// 페이징 처리 부분
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
$(() => {
	paging("#tbody tr", 5, 0);
});

$(function(){
	// 활성 상태 관련
//	$.ajax({
//		type: "get"
//		, url: "insertPro"
//		, data: {AD_ID: $("#AD_ID").val(),
//				 AD_PW: $("#AD_PW").val(),
//				 AD_NAME: $("#AD_NAME").val()	}
//		, success: function(data) {
// 			alert("새로운 관리자 계정이 생성되었습니다.");
// 			location.replace('manager');
// 		}
// 		, error : function(){
// 			alert("입력 정보를 다시 확인해 주십시오.");
//        }
//	});
	
	// 저장 버튼
	$('#saveBtn').on('click', function(){
		$.ajax({
			type: "post"
			, url: "updateAdmin"
			, data: {AD_ID: $("#AD_ID").val(),
					 AD_ACTIVE: $("#AD_ACTIVE").val() }
		});
	});
	
	// 삭제 버튼
	$('#deleteBtn').on('click', function(){
		var result = confirm('정말로 삭제하시겠습니까?');
	    if(result){
			$.ajax({
				type: "post"
				, url: "deleteAdmin"
				, data: {AD_ID: $("#AD_ID").val(),
						 AD_PW: $("#AD_PW").val() }
	        });
        } else {
	       		alert("삭제가 취소되었습니다.");
	       		modal.style.display = "none";
	   	}
	});
	
		
	// 모달창 관련	
	var modal = document.getElementById("addModal");
	var btn = document.getElementById("btnAdd");
	var span = document.getElementsByClassName("close")[0];
	var cancelBtn = document.getElementById("cancelBtn");
	
	$('#btnAdd').on('click', function(){
		modal.style.display = "block";	
	});
	
	$('#close').on('click', function(){
		modal.style.display = "none";
	});
	
	$('#cancelBtn').on('click', function(){
		modal.style.display = "none";
	});
	
	$('#deleteBtn').on('click', function(){
	});
	
	
	// 엔터키 & 버튼 연결	
	$('#AD_ID, #AD_PW, #AD_NAME').on('keydown', function(key){
        if (key.keyCode == 13) {
            $('#insertBtn').click();
        }
	});	
	
	
	// 생성버튼 이벤트 
	$('#insertBtn').on('click', function() {
		if($('#AD_ID').val() == ""){
			alert("아이디를 입력하세요.");
			$('#AD_ID').focus();
			return;
		}
		if($('#AD_PW').val() == ""){
			alert("비밀번호를 입력하세요.");
			$('#AD_PW').focus();
			return;
		}
		if($('#AD_NAME').val() == ""){
			alert("이름을 입력하세요.");
			$('#AD_NAME').focus();
			return;
		}
		$.ajax({
			type: "post"
			, url: "insertPro"
			, data: {AD_ID: $("#AD_ID").val(),
					 AD_PW: $("#AD_PW").val(),
					 AD_NAME: $("#AD_NAME").val()	}
		})
		.done(function(data) {
			alert("새로운 관리자 계정이 생성되었습니다.");
			location.replace('manager');
		 })
		.fail(function() {
			alert("입력 정보를 다시 확인해 주십시오.");});
	});
	
});