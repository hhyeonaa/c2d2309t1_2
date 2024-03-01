/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
 
$(() => {
 
 	targetColor($("#message_manage"));
 	
	 
 	paging("#tbody tr", 5, 0);	
 
// 	$(document).on("click", ".insert", function(){
//			
//	}) 	
	
		
	
 
})

function ajaxJson(){
	var ajaxData = {};
}


//function prependFunc(codeNo){
//	$("#tbody").prepend(
//		'<tr>' +
//			'<th scope="row" class="text-center"><input type="checkbox" style="width: 25px; height: 25px;"></th>' +
//			'<td class="text-center">' + codeNo + '</td>' +
//			'<td class="text-center"></td>' +
//			'<td class="text-center" style="width: 75px;">' +
//				'<span style="font-size: 33px; color: green; border: 1px solid green;" class="save material-symbols-outlined">done</span>' +
//			'</td>' +
//			'<td class="text-center" style="width: 75px;">' +
//				'<span style="font-size: 33px; color: red; border: 1px solid red;" class="delete material-symbols-outlined">delete</span>' +
//			'</td>' +
//		'</tr>')
//
//}

function ajaxFunc(_url){
	
	$.ajax({
		url: _url,
		caches: false,
		
	})
	.done(function(data){
		
	})
	.fail(function(){
		
	})
}

