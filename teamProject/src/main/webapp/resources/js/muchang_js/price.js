/**
 * 
 */
 
 document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
 
 $(() => {
 	
 	targetColor($("#price_manage"));
 	paging("#tbody tr", 5, 0);	
 
 })