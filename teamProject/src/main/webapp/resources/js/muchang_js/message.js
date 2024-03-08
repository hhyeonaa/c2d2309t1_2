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
 
 	targetColor($("#message_manage"));
 
	let columns = [
		{
			name: columnTitle.번호,
			header:"번호",
//			filter:"number",
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
		    sortable: false,
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

	$("#excel").remove();
	$("#grid").empty();
	grid("message_managePro", 5, columns, false);
	excel('updownload', 'MESSAGE'); 
 
 	var modal = $('#addModal');
 
 	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});	 
 	
})

