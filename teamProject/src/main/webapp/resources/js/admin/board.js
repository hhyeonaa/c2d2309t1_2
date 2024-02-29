// 페이징 관련
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
			   
$(() => {
	targetColor($('#board_manage'));
	paging('#tbody tr', 5, 0);
	
	var columns = [
		{name:"SEQ", 	 header:"번호"}, 
		{name:"CODE", 	 header:"게시판명"},
		{name:"CI_CA",	 header:"게시판 유형"},
		{name:"CI_IN",	 header:"글쓰기 입력폼"},
		{name:"CI_TAB",	 header:"순서"},
		{name:"HIDE", 	 header:"숨김 여부"}
	]
	
	grid("boardList", 3, columns);
	excel("", "download");
})



$(function(){
	let boardList = document.getElementById('boardList');
	var currentRow, preRow;
	var modal = $('#inputModal');
	
	// 순서 변경 버튼
	$('#btnTop').on('click', function(){
	    currentRow = $(this).closest('tr');
	    preRow = currentRow.prev('tr');
	    if (preRow.length !== 0) {
	        currentRow.insertBefore(preRow);
	    }
	    return false;
	});
	
	
//	// 저장 버튼
	$('#saveBtn').on('click', function () {
		for (let i = 1; i < boardList.rows.length; i++) {
			$.ajax({
				type: 'post'
				, url: 'displayUpdate'
				, data: {CO_TYPE: 'MM'
						 , SEQ: i
						 , CODE: boardList.rows[i].cells[1].innerText
						 , HIDE: boardList.rows[i].cells[5].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
		}
//		$('#boardDiv').load(location.href+' #boardDiv');
		location.reload();
	});	
	
	// 취소 버튼
	$('#resetBtn').on('click', function (){
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
