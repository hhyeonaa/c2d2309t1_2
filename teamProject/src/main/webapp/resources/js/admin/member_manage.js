document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

// 페이징 처리
$(() => {
	
//	var columns = [
//		{name:"MEM_NO", header:"번호"},
//		{name:"MEM_ID", header:"아이디"},
//		{name:"MEM_NICK", header:"닉네임"},
//		{name:"MEM_NAME", header:"이름"},
//		{name:"MEM_EMAIL", header:"이메일"},
//		{name:"MEM_DATE", header:"가입일"},
//		{name:"RPT_USER_NO", header:"누적신고"},
//		{name:"MEM_CAT", header:"회원상태"}
//	]
//	grid("", 10, columns);
	
	
	paging("#tbody tr", 10, 0);
	
	for(var i = 0; i < $("#tbody select").length; i++){
		$($("#tbody select")[i]).find("option")
								.eq(stringToInt($($("#tbody input[type=hidden]")[i]).val()))
								.prop("selected", true)	
	}
	
	$(".state").on("change", function(){
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