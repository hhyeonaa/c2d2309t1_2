// 페이징 처리 부분
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
$(() => {
	targetColor($("#role_manage"));
	paging("#tbody tr", 5, 0);
});


// alert
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');

$(function(){
	var columns = [
		{
			name:"AD_NO",
			header:"번호",
			filter:"number",
		    sortable: true
		}, 
		{
			name:"AD_ID",
			header:"ID",
			filter:"text",
		    sortable: true,
			sortingType: 'asc'
		},
		{
			name:"AD_ROLE",
			header:"권한",
			filter:"text",
		    sortable: true,
			sortingType: 'asc'
		},
		{
			name:"AD_ACTIVE",
			header:"활성 상태",
			filter:"select",
		    sortable: true,
			sortingType: 'asc',
			renderer: {
                type: ToggleButton
            }
		},
		{
			name:"",
			header:"삭제",
			renderer: {
                type: DeleteButton
            }
		}
	]
	grid("managerList", 5, columns, false);
	excel();
	
	
	
	let adminList = document.getElementById('adminList');
	
	// 삭제 버튼
	$(document).on("click", "#deleteBtn", function () {
		var rowIndex = $(this).closest('tr').index();
		let AD_NO= "AD" + adminList.rows[rowIndex+1].cells[0].innerText;
		let AD_ID = adminList.rows[rowIndex+1].cells[1].innerText;
		var result =
			alertMsg("AM4", [AD_ID], true);
		if(result){
			$.ajax({
				type: "post"
				, url: "deletePro"
				, data: {AD_NO: AD_NO }
			})
 			alertMsg("AM1", [AD_ID]);
			$('#adminDiv').load(location.href+' #adminDiv');
//			location.reload();
		} else {
 			alertMsg("AM2", ["삭제"]);
		}
	});

	// 저장 버튼
	$(document).on("click", "#saveBtn", function () {
		for (let i = 1; i < adminList.rows.length; i++) {
//			console.log(adminList.rows[i].cells[2].options[selectedIndex].value);
			debugger;
			$.ajax({
				type: "post"
				, url: "updatePro"
				, data: {AD_NO: "AD" + adminList.rows[i].cells[0].innerText,
						 AD_ROLE: adminList.rows[i].cells[2].querySelector('#role option:checked').value,
						 AD_ACTIVE: adminList.rows[i].cells[3].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
		}
		$('#adminDiv').load(location.href+' #adminDiv');
//		location.reload();
	});
	
		
	// 모달창 관련	
	var modal = $('#addModal');
	
	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});
	

	// 엔터키 & 버튼 연결	
	$('#AD_ID, #AD_PW, #AD_NAME').on('keydown', function(key){
        if (key.keyCode == 13) {
            $('#insertBtn').click();
        }
	});	
	
	
	// 생성버튼 이벤트 
	$(document).on("click", "#insertBtn", function () {
		if($('#AD_ID').val() == ""){
			alertMsg("AM6", ["아이디"]);
			$('#AD_ID').focus();
			return;
		}
		if($('#AD_PW').val() == ""){
			alertMsg("AM6", ["비밀번호"]);
			$('#AD_PW').focus();
			return;
		}
		if($('#AD_NAME').val() == ""){
			alertMsg("AM6", ["이름"]);
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
			if(data == "") {
				alertMsg('AM5', ["입력 정보"]);
				return false;
			}
			alertMsg('AM3', ["새로운 관리자 계정 생성"]);
			modal.css('display', 'none');
			$('#adminDiv').load(location.href+' #adminDiv');
//			location.reload();
		 })
	});
	
});