// 페이징 관련
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

$(() => {
	targetColor($('#board_manage'));
//	paging('#tbody tr', 5, 0);

	var columns = [
		{
			name:"SEQ",
			header:"번호",
			filter:"number",
		    sortable: true
		}, 
		{
			name:"CODE",
			header:"게시판명",
			filter:"text",
		    sortable: true
		}, 
		{
			name:"CO_DETAIL",
			header:"게시판 유형",
			filter:"text",
		    sortable: true
		}, 
		{
			name:"",
			header:"게시판 입력폼"
		}, 
		{
			name:"ACTIVE",
			header:"활성 상태",
			filter:"select",
		    sortable: true,
			sortingType: 'asc',
			renderer: {
                type: ToggleButton
            }
		}
	]

	fn_grid("boardPro", 0, columns, true);
	excel('download');
})
$(function(){
	let boardList = document.getElementById('boardList');
	let inputList = document.getElementById('inputList');
	var currentRow, preRow;
	var modal = $('#inputModal');

	// 순서 변경 버튼
	$(document).on('click', '#btnTop', function(){
	    currentRow = $(this).closest('tr');
	    preRow = currentRow.prev('tr');
	    if (preRow.length !== 0) {
	        currentRow.insertBefore(preRow);
	    }
	    return false;
	});


	
	
	// 저장 버튼
	$('#saveBtn').on('click', function () {
		var arr = [];
		for (let i = 1; i < boardList.rows.length; i++) {
			arr.push(
				{CO_TYPE: 'MM'
				 , SEQ: i
				 , CODE: boardList.rows[i].cells[1].innerText
				 , ACTIVE: boardList.rows[i].cells[5].querySelector('input[type="checkbox"]').checked ? 1 : 0 
				}
			)
		};
		$.ajax({
			type: "post"
			, contentType: 'application/json'
			, url: "displayUpdate"
			, data: JSON.stringify(arr)
		})
		location.reload();
	});

	// 취소 버튼
	$('#resetBtn').on('click', function (){
		location.reload();
	});

	// 모달창	
	$('#insertForm').on('click', function(){
	    modal.css('display', 'block');
	});
	
	// 모달 안 저장 버튼
	$('#formSaveBtn').on('click', function () {
		var formArr = [];
		for (let i = 1; i < inputList.rows.length; i++) {
			formArr.push(
				{CO_TYPE: 'FO'
				 , SEQ: i
				 , CODE: inputList.rows[i].cells[0].innerText
				 , ACTIVE: inputList.rows[i].cells[3].querySelector('input[type="checkbox"]').checked ? 1 : 0
				}
			)
			debugger;
		};
		$.ajax({
			type: "post"
			, contentType: 'application/json'
			, url: "displayUpdate"
			, data: JSON.stringify(formArr)
		})
		location.reload();
	});

	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});
	
});