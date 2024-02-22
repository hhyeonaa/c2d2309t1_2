// 페이징 처리 부분
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
$(() => {
	paging("#tbody tr", 5, 0);
});


// 삭제 버튼
function getId(){
	let adminList = document.getElementById('adminList');
	for (let i = 1; i < adminList.rows.length; i++) {
		adminList.rows[i].cells[4].onclick = function () {
			let AD_NO= "AD" + adminList.rows[i].cells[0].innerText;
			var result = confirm(AD_NO + '을 정말로 삭제하시겠습니까?');
			if(result){
				$.ajax({
					type: "post"
					, url: "deletePro"
					, data: {AD_NO: AD_NO }
				})
				alert(AD_NO + '가 삭제되었습니다.');
				location.reload();
			} else {
				alert('삭제가 취소되었습니다.');
			}
		}
	}
}


$(function(){
	var columns = [
		{name:"AD_NO", 	 header:"번호"}, 
		{name:"AD_ID", 	 header:"ID"},
		{name:"AD_NAME", 	 header:"이름"},
		{name:"AD_ACTIVE",	 header:"활성 상태"},
		{name:"CI_OC",		 header:"삭제"}
	]
	grid("managerList", 3, columns);
	
	
	// 저장 버튼
	$('#saveBtn').on('click', function(){
		let adminList = document.getElementById('adminList');
		for (let i = 1; i < adminList.rows.length; i++) {
			$.ajax({
				type: "post"
				, url: "updatePro"
				, data: {AD_NO: "AD" + adminList.rows[i].cells[0].innerText,
						 AD_ACTIVE: adminList.rows[i].cells[3].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
		}
		location.reload();
	});
	
		
	// 모달창 관련	
	var modal = $('#addModal');
	
	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close').on('click', function(){
		modal.css('display', 'none');
	});
	
	$('#cancelBtn').on('click', function(){
		modal.css('display', 'none');
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
			, data: {AD_ID: $('#AD_ID').val(),
					 AD_PW: $('#AD_PW').val(),
					 AD_NAME: $('#AD_NAME').val() }
		})
		.done(function(data) {
			alert('새로운 관리자 계정이 생성되었습니다.');
			modal.css('display', 'none');
			location.reload();
		 })
		.fail(function() {
			alert('입력 정보를 다시 확인해 주십시오.');
		});
	});
	
});