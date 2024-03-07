document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

// 페이징 처리
$(() => {
	paging("#tbody tr", 10, 0);
	
	for(var i = 0; i < $("#tbody select").length; i++){
		debugger;
		$($("#tbody select")[i]).find("option")
								.eq(stringToInt($($("#tbody input[type=hidden]")[i]).val()))
								.prop("selected", true)	
	}
	
	$(".state").on("change", function(){
		debugger;
		$.ajax({
			type:"post",
			url: 'memberStop',
			data:{
				memNo: $(this).closest("div").find("input[type=hidden]").attr("class"),
				oldState: $(this).closest("div").find("input[type=hidden]").val(),
				newState: $(this).val()
			},
			async: false
		})
		.done(function(data){
			data.isSuccess ? alert("성공") : alert("실패"); 
		})
	})
	
})	

function stringToInt(str){
	return parseInt(str.replaceAll("[^0-9]", "")) 
}