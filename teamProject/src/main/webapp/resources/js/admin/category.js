$(function(){
	let categoryList = document.getElementById('categoryList');
	var currentRow, preRow;
	
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
		for (let i = 1; i < categoryList.rows.length; i++) {
			$.ajax({
				type: "post"
				, url: "boardHide"
				, data: {CO_TYPE: 'CA'
						 , CODE: categoryList.rows[i].cells[0].innerText
						 , HIDE: categoryList.rows[i].cells[2].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
			$.ajax({
				type: "post"
				, url: "changeSeq"
				, data: {CO_TYPE: 'CA'
						 , SEQ: i
						 , CODE:categoryList.rows[i].cells[0].innerText }
			});
		}
		location.reload();
	});	
	
	// 취소 버튼
	$(document).on("click", "#resetBtn", function () {
		location.reload();
	});

});