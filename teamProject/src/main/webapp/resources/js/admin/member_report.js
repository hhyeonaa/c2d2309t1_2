document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

// 페이징 처리
$(() => {
	paging("#tbody tr", 10, 0);
})