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
	
	let getPageUrl = codeName.메뉴항목;
	
	targetColor($("#message_manage"));
	
	$.ajax({
		data: {
			CODE: $("#selectListItem").val()
		},
		url: "codePro",
		async: false
	})
	.done(function(data){
		console.log(data);
	})
	.fail(function(error){
		
	})
	
	
})

function tableHtml(){
	return "";
}

function titleHtml(){
	return "";
}

function ajaxData(){
}
