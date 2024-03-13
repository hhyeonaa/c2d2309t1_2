document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

$(() => {
	targetColor($('#board_manage'));

	var columns = [ 
		{
			name:"CODE",
			header:"게시판명",
			filter:"text",
		    sortable: true
		}, 
		{
			name:"CO_DETAIL",
			header:"게시판 유형",
			filter:"text",
		    sortable: true
		}, 
		{
			name:"ACTIVE",
			header:"사용 여부",
			filter:"select",
		    sortable: false,
			sortingType: 'asc',
			renderer: {
                type: ToggleButton
            }
		}
	]

	fn_grid("boardPro", 0, columns, true);
	excel('download');

	$('#active').on('change', function(){
		debugger;
		alert('test');
	});
	
});