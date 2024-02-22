// 페이징 관련
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
			   
$(() => {
	paging("#tbody tr", 5, 0);
})



$(function(){
	let boardList = document.getElementById('boardList');
//	let ajaxRequests = [];
	var currentRow, preRow;
	
	// 순서 변경 버튼
	$(document).on("click", "#btnTop", function(){
//		var rowIndex = $(this).closest('tr').index();
//	    console.log('버튼을 누른 행의 인덱스:', rowIndex);
	    currentRow = $(this).closest('tr');
	    preRow = currentRow.prev('tr');
	    if (preRow.length !== 0) {
	        currentRow.insertBefore(preRow);
//	        currentRow.cells[0].innerText // 위치 바뀐 후 seq 값 변경해주기i
	    }
	    return false;
	});
	
	
	// 저장 버튼
	$(document).on("click", "#saveBtn", function () {
		debugger;
		for (let i = 1; i < boardList.rows.length; i++) {
//			let ajaxRequest = 
			$.ajax({
				type: "post"
				, url: "boardHide"
				, data: {CO_TYPE: 'MM'
						 , CO_NO: 'CO' + boardList.rows[i].cells[0].innerText
						 , HIDE: boardList.rows[i].cells[5].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
			
			$.ajax({
				type: "post"
				, url: "changeSeq"
				, data: {CO_TYPE: 'MM'
						 , SEQ: boardList.rows[i].cells[0].innerText
						 , CODE:boardList.rows[i].cells[1].innerText }
			});
			
		}
//		$('#boardDiv').load(location.href+' #boardDiv');
//		location.reload();
	});	
	

	// 모달창	
	var modal = $('#inputModal');
	
	$('#insertForm').on('click', function(){
		modal.css('display', 'block');
	})
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	})
	
});
