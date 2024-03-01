/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
 
let getPageUrl = codeName.메뉴항목;


$(() => {
	
	targetColor($("#message_manage"));
	
	$.ajax({
		data: {
			CODE: $("input[type=hidden]").val()
		},
		url: "",
		async: false
	})
	.done(function(data){
		
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
