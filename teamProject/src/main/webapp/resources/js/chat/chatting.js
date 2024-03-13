
$(() => {
	// 신고하기 버튼 클릭 시
	$("#reportBtn").on("click", function(){
		$.ajax({
			url: "insertReport",
			type: "POST",
			data: {
				rptUserIdx: $(".memNo").val(),
				rptCode: $('input[name="rd01"]:checked').val()
			}
		})
		.done(function(data){
			alert('신고가완료되었습니다.')
			$('#exampleModalReport').modal('hide')
		})
		.fail(function(){
			alert('신고 내용을 선택해주세요.')
		})
	});
});