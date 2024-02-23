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
 	
 	targetColor($("#trade_manage"));
 	paging("#tbody tr", 5, 0);
	alertMsg(["안녕", 1, 321], "AM1");
	
	 
 })
 
 