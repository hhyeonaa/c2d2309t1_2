document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');			   
			   
$(() => {
	targetColor($("#catelist_manage"));

	let columns = [
		{
			name: columnTitle.타입 || columnTitle.번호,
			header:"코드 타입"
		},
		{
			name: columnTitle.내용,
			header:"카테고리명",
		    sortable: true,
		    width: "auto"
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
	
	excel('download');

	$(document).on("click", "#selectCodeBtn button", function(){
		// grid 안 값 넣기
		$("#selectCodeBtn button").attr("class", "btn btn-outline-primary");
		$(this).attr("class", "btn btn-primary");

		let keys = Object.keys(codeName);
		var str = $(this).text();
		let param = keys.includes(str) ? codeName[str] : alertMsg("AM12", ["해당 항목", "현재 사용"]);
		
//		$('#excel').remove();
		$('#grid').empty();
		fn_grid('categoryPro', 0, columns, true, param);
//		excel('download');
	})

	$("#selectCodeBtn :first").trigger("click");
	
	// 저장 버튼
//	$('#saveBtn').on('click', function () {
//		alert('test');
//	});
	
});