//document.write('<script type="text/javascript"' + 
//			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
//			   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>'); 

$(function(){
	$('label').click(function(){
		$('label').removeClass('on');
		$(this).addClass('on');
		var idx=$(this).index()+1;
	
		$('.tab_content').css('display','none');
		$('.tab_content'+idx).css('display','block');
		
		paging('.tab_content'+idx+ ' .col', 8, 0);
	});	
})