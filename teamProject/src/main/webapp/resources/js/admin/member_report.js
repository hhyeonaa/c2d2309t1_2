document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

// 페이징 처리
$(() => {

	let columns = [
		{
			name: "RPT_NO",
			header:"번호",
		    sortable: true
		},
		{
			name: "USER_NO",
			header:"신고자",
			filter:"text",
			sortable: true
		},
		{
			name: "RPT_USER_NO",
			header:"신고 대상",
			filter:"text",
		    sortable: true
		},
		{
			name: "CODE",
			header:"신고 종류",
			filter:"text",
		    sortable: true,
			width: "auto"
		},
		{
			name: "RPT_TIME",
			header:"신고 날짜",
			filter:"text",
		    sortable: true
		}
	]

	targetColor($("#member_report"));
	fn_grid("member_reportPro", 5, columns);
	excel('download', 'REPORT');
	
})