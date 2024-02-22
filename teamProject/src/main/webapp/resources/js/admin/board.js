// 페이징 관련
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
			   
$(() => {
	paging("#tbody tr", 5, 0);
})



$(function(){
	let boardList = document.getElementById('boardList');
	var currentRow, preRow;
	var modal = $('#inputModal');
	
	// 순서 변경 버튼
	$(document).on("click", "#btnTop", function(){
	    currentRow = $(this).closest('tr');
	    preRow = currentRow.prev('tr');
	    if (preRow.length !== 0) {
	        currentRow.insertBefore(preRow);
	    }
	    return false;
	});
	
	
	// 저장 버튼
	$(document).on("click", "#saveBtn", function () {
		for (let i = 1; i < boardList.rows.length; i++) {
			$.ajax({
				type: "post"
				, url: "boardHide"
				, data: {CO_TYPE: 'MM'
						 , CODE: boardList.rows[i].cells[1].innerText
						 , HIDE: boardList.rows[i].cells[5].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
			$.ajax({
				type: "post"
				, url: "changeSeq"
				, data: {CO_TYPE: 'MM'
						 , SEQ: i
						 , CODE:boardList.rows[i].cells[1].innerText }
			});
		}
//		$('#boardDiv').load(location.href+' #boardDiv');
		location.reload();
	});	
	
	// 취소 버튼
	$(document).on("click", "#resetBtn", function () {
		location.reload();
	});

	// 모달창	
	$('#insertForm').on('click', function(){
		modal.css('display', 'block');
	})
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	})
	
});
