document.write('<script type="text/javascript"' + 
		    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
		   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>'); 			   
			   
$(function(){
	let columns = [
		{
			name: columnTitle.타입 || columnTitle.번호,
			header:"코드 타입"
		},
		{
			name: columnTitle.내용,
			header:"카테고리명",
		    sortable: true
		},
		{
			name:columnTitle.활성여부_사용자,
			header:"사용 여부",
			filter:"select",
		    sortable: false,
			sortingType: 'asc',
			renderer: {
                type: ToggleButton
            }
		}
	]
	
	
//	var columns = [
//		{
//			name:"SEQ",
//			header:"번호",
//			filter:"number",
//		    sortable: true
//		},
//		{
//			name:"CODE",
//			header:"카테고리명",
//			filter:"text",
//		    sortable: true
//		}, 
//		{
//			name:"ACTIVE",
//			header:"활성 상태",
//			filter:"select",
//		    sortable: true,
//			sortingType: 'asc',
//			renderer: {
//                type: ToggleButton
//            }
//		}
//	]
	
	grid("categoryPro", 5, columns, true);
	excel("download");
	targetColor($("#catelist_manage"));
		
	let categoryList = document.getElementById('categoryList');
	var currentRow, preRow;

	$(document).on("click", "#selectCodeBtn button", function(){
		// grid 안 값 넣기
		$("#selectCodeBtn button").attr("class", "btn btn-outline-primary");
		$(this).attr("class", "btn btn-primary");

		let keys = Object.keys(codeName);
		var str = $(this).text();
		let param = keys.includes(str) ? codeName[str] : alertMsg("AM12", ["해당 항목", "현재 사용"]);
		
		debugger;
		$("#excel").remove();
		 $("#grid").empty();
		grid("categoryPro", 5, columns, true, param);
		excel('updownload', 'CODE'); 
	})

	$("#selectCodeBtn :first").trigger("click");
	
	
	
	
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
				{CO_TYPE: 'CM'
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