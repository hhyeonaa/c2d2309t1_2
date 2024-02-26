/**
 * 게시물 상세 페이지 입니다.
 */

$(() => { // 문서가 완전히 로드되면 함수를 실행합니다.
	$(".carousel-item img").click(function(){
	    let img = new Image();
	    img.src = $(this).attr("src")
	    $('.modalBox').html(img);
	    $(".modal").show();
	});
	// 모달 클릭할때 이미지 닫음
	$(".modal").click(function (e) {
		$(".modal").toggle();
	});
})