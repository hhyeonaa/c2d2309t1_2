document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

$(function(){
	// 저장 버튼
	$('#saveBtn').on('click', function(){
		let boardList = document.getElementById('boardList');
		for (let i = 1; i < boardList.rows.length; i++) {
			$.ajax({
				type: "post"
				, url: "updateBoard"
				, data: {CO_TYPE: MM,
						 CO_NO: boardList.rows[i].cells[0].innerText,
						 HIDE: boardList.rows[i].cells[3].querySelector('input[type="checkbox"]').checked ? 1 : 0}
			});
		}
		location.reload();
	});
	

	// 모달창	
	var modal = $('#inputModal');
	
	$('#insertForm').on('click', function(){
		modal.css('display', 'block');
	})
	
	$('#close').on('click', function(){
		modal.css('display', 'none');
	})
	
	$('#cancelBtn').on('click', function(){
		modal.css('display', 'none');
	})
	
	
});

$(() => {
	paging("#tbody tr", 5, 0);

})