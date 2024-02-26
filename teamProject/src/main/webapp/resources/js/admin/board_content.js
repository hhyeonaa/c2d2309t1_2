document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

$(() => {
	paging("#tbody tr", 5, 0);
	
	$("#boardCategory").on("change", function(){
		$.ajax({
			url: 'board_category',
			data:{
				category: $(this).val()
			}
		})
		.done(function(data){
			$("#tbody").empty();
			
		})
	})
	
})