document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

// 페이징 처리
$(() => {
	
	let columns = [
		{
			name: "PRO_NO",
			header:"번호",
		    sortable: true
		},
		{
			name: "PRO_NAME",
			header:"글제목",
			filter:"text",
			sortable: true,
			width: "auto"
		},
		{
			name: "PRO_WR",
			header:"닉네임",
			filter:"text",
		    sortable: true
		},
		{
			name: "PRO_DATE",
			header:"글쓴시간",
			filter:"text",
		    sortable: true
		},  
		{
			name: "PRO_TC",
			header:"글종류",
			filter:"text",
		    sortable: true
		},
		{
			name: "PRO_STATE",
			header:"게시글 숨김",
			filter:"select",
		    sortable: false,
			renderer: {
	            type: ToggleButton
	        }
		}
	]
	
	targetColor($("#board_content"));
	fn_grid("board_contentPro", 5, columns);
	
})