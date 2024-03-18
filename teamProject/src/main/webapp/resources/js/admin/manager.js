// 페이징 처리 부분
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
// alert
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');
			   
			   
$(() => {
	targetColor($("#role_manage"));
	paging("#tbody tr", 5, 0);
	
	
	var columns = [
		{
			name:"AD_ID",
			header:"ID",
			filter:"text",
		    sortable: true,
			sortingType: 'asc',
		    editor: "text"
		},
		{
			// 셀렉트 박스 설명!!!!!!!!!!!!!!!!!!!!!  (숫자 순서대로 볼 것)
			name:"ROL_NO", // 5. (중요!!) 이 부분 name 원래 JOIN 해서 들고온 데이터에 맞춰서 ROL_NAME 컬럼이었는데 
						   //    , 3번 설명처럼 text 속성에 join으로 들고 올 데이터("총괄", "운영", ..) 하드 코딩했으므로 걍 fk인 ROL_NO 컬럼 사용 
						   //    (adminMapper.xml id=getAdminList 주석 봐바)
			header:"권한",
			filter:"text",
		    sortable: true,
			sortingType: 'asc',
			formatter: "listItemText", // 4. 이거 없이 하면 셀렉트 박스로 값 변경할 때, 그리드에 text 속성들이 표시되는게 아니라 value 속성들이 표시됨.
		    editor: { // 1. 셀렉트 박스 쓰려면 editor 속성을 아래와 같은 형식으로.
				type: "select", // 2. type: "select" 이것도 고정.
				options: {
					listItems: [ // 3. 이 배열 안에 하드코딩으로 적으면 됨. (text: 그리드에 보여줄 부분, value: 실제 admin 테이블에서 변경될 값) 
						{text: "총괄", value: "RO1"},
						{text: "운영", value: "RO2"},
						{text: "운영 및 사이트", value: "RO3"}
					]
				}
			}
			// 셀렉트 박스 설명!!!!!!!!!!!!!!!!!!!!!
		},
		{
			name:"AD_ACTIVE",
			header:"활성 상태",
			filter:"select",
		    sortable: true,
			sortingType: 'asc',
			renderer: { type: ToggleButton }
		},
		{
			name:"DELETE",
			header:"삭제",
			renderer: { type: DeleteButton }
		}
	]
	
	fn_grid("managerPro", 5, columns, false);
	excel('both', 'ADMIN'); // 업다운 선택, 테이블 이름 
	

	// 모달창 관련	
	var modal = $('#addModal');
	
	$('#appendBtn').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});
	

	// 엔터키 & 버튼 연결	
	$('#AD_ID, #AD_PW, #AD_NAME').on('keydown', function(key){
        if (key.keyCode == 13) {
            $('#checkBtn').click();
        }
	});	
	
	
	// 생성버튼 이벤트 
	$(document).on("click", "#checkBtn", function () {
		var check = 1;
		if($('#AD_ID').val() == ""){
			alertMsg("AM6", ["아이디"]);
			$('#AD_ID').focus();
			check = 0;
			return check;
		}
		if($('#AD_PW').val() == ""){
			alertMsg("AM6", ["비밀번호"]);
			$('#AD_PW').focus();
			check = 0;
			return check;
		}
		if($('#AD_NAME').val() == ""){
			alertMsg("AM6", ["이름"]);
			$('#AD_NAME').focus();
			check = 0;
			return check;
		}
		if(check) {
			$('#insertBtn').click();
		}
		$.ajax({
			type: "post"
			, url: "insertPro"
			, data: {AD_ID: $('#AD_ID').val(),
					 AD_PW: $('#AD_PW').val(),
					 AD_NAME: $('#AD_NAME').val() }
			, async: false
		})
		.done(function(data) {
			if(data == "") {
				alertMsg('AM5', ["입력 정보"]);
				return false;
			}
			alertMsg('AM3', ["새로운 관리자 계정 생성"]);
			modal.css('display', 'none');
			$('#grid').empty();
			grid("managerPro", 10, columns, false);
			$('#excel').remove();
			excel('both', 'ADMIN');
		 })
	});
	
});