document.write('<script type="text/javascript"' + 
		    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
		   '</script>');
			   
			   
$(function(){
	var columns = [
		{
			name:"SEQ",
			header:"번호",
			filter:"number",
		    sortable: true
		},
		{
			name:"CODE",
			header:"카테고리명",
			filter:"text",
		    sortable: true
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
	
	grid("categoryList", 3, columns, true);
	excel("", "download");
	targetColor($("#catelist_manage"));
		
	let categoryList = document.getElementById('categoryList');
	var currentRow, preRow;
	
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
		for (let i = 1; i < categoryList.rows.length; i++) {
			arr.push(
				{CO_TYPE: 'CA'
				 , SEQ: i
				 , CODE: categoryList.rows[i].cells[0].innerText
				 , ACTIVE: categoryList.rows[i].cells[2].querySelector('input[type="checkbox"]').checked ? 1 : 0 
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

});