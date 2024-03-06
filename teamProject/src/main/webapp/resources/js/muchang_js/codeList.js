/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>'); 
 
$(() => {
	
	targetColor($("#code_manage"));

	let columns = [
		{
			name: columnTitle.번호,
			header:"번호",
			filter:"number",
		    sortable: true
		},
		{
			name: columnTitle.내용,
			header:"코드내용",
			filter:"text",
		    sortable: true
		},  
		{
			name: columnTitle.활성여부_관리자,
			header:"숨김 여부",
			filter:"select",
		    sortable: true,
			renderer: {
                type: ToggleButton
            }
		},
		{
			name:"",
			header:"삭제",
			renderer: {
                type: DeleteButton
            }
		}
	]

	$(document).on("click", "#selectCodeBtn button", function(){
		debugger;
		$("#selectCodeBtn button").attr("class", "btn btn-outline-primary");
		$(this).attr("class", "btn btn-primary");
		
		let keys = Object.keys(codeName);
		var str = $(this).text();
		let param = keys.includes(str) ? codeName[str] : alertMsg("AM12", ["해당 항목", "현재 사용"]);
		
		$("#excel").remove();
		$("#grid").empty();
		grid("codePro", 5, columns, false, param);
		excel('updownload', 'CODE'); 
	})

	$("#selectCodeBtn :first").trigger("click");
	 
})
