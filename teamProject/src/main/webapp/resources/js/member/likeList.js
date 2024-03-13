$(()=>{
	// 1. 처음 페이지 로드 시, ajax -> data: 'MM1' => mapper: <select id='likeList'> 판매 게시판 찜글 조회하여 가져오기
	// 2. 탭 변경 시, ajax -> 'MM' + 탭의 인덱스 값을 통해 해당 게시판의 찜글 조회하여 가져오기
	// 3. PRO_TC 값에 따라 조회하는 Mapper 
	
	
	
//	$.ajax({
//		type: 'get'
//		, uri: 'likeListSelect' 
//		, data: { PRO_TC : 'MM1'}
//	}).done(function(data) {
//		console.log(data);
//		debugger;
//		$('.tab_content').css('display','none');
//		$('.tab_content' + idx).css('display','block');
//		$('#likeMain').load(location.href+' #likeMain');
//	});
	
	// 게시판 목록 제어
	$('label').on('click', function(){
		$('label').removeClass('on');
		$(this).addClass('on');
		var idx = $(this).index() + 1;
		
		debugger;
	
//		$('.tab_content').css('display','none');
//		$('.tab_content'+idx).css('display','block');
		
		// +) tab_content -> 에서 해당 데이터 ajax로 전송 후  MM'1/2/3/4'에 해당되는 글 필터링하여 보여주기
		// <div class="tab_content tab_content1"> => 해당되는 숫자의 데이터만 보여주기
		// idx PRO_NUM
		

		
		$.ajax({
			type: 'get'
			, uri: 'likeListSelect' 
			, data: { PRO_TC : 'MM' + idx}
		}).done(function(data) {
			debugger;
			
			$('.tab_content').css('display','none');
			$('.tab_content' + idx).css('display','block');
			$('#likeMain').load(location.href+' #likeMain');
		});
	});
	
	
	// 찜 취소 기능
	$('#yesLike').on('click', function(){
		if(confirm('찜을 취소하시겠습니까?')) {
			$.ajax({
				type: 'post'
				, url: 'deleteLike'
				, data: {LIK_NO: $('#LIK_NO').val()}
			})
			.done(function(data){
				if(data == '1'){
					$('#yesLike').remove();
					$('#likeBtn').prepend('<ion-icon id="noLike" name="heart-outline"></ion-icon>');
					$('#likeDiv').load(location.href+' #likeDiv');
				}
			});
		}
		else return;
	});

});		

