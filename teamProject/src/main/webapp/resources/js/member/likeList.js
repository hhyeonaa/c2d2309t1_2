$(()=>{
	var idx = 1;
	$('#listDiv').addClass('MM' + idx);
	$('.MM' + idx).css('display','block');
	
	// 1. 처음 페이지 로드 시, ajax -> data: 'MM1' => mapper: <select id='likeList'> 판매 게시판 찜글 조회하여 가져오기
	// 2. 탭 변경 시, ajax -> 'MM' + 탭의 인덱스 값을 통해 해당 게시판의 찜글 조회하여 가져오기
	// 3. PRO_TC 값에 따라 조회하는 Mapper 
		
	// +) tab_content -> 에서 해당 데이터 ajax로 전송 후  MM'1/2/3/4'에 해당되는 글 필터링하여 보여주기
	// <div class="tab_content tab_content1"> => 해당되는 숫자의 데이터만 보여주기
	// idx PRO_NUM
	
	// 게시판 목록 제어
	$('label').on('click', function(){
		$('#listDiv').removeClass('MM' + idx);
		idx = $(this).index() + 1;
		$('#listDiv').addClass('MM' + idx);
		
		// 1. 라벨을 클릭하면 클릭한 label 색상이 짙어짐. idx값은 ajax로 넘어감
		$('label').removeClass('on');
		$(this).addClass('on');
		
//		$('.MM' + idx).css('display','none');
//		$('.MM' + idx).css('display','block');

		
		$.ajax({
			type: 'get'
			, url: 'likeListSelect' 
			, data: { PRO_TC : 'MM' + idx}
		}).done(function(data) {
			
//			$('#likeMain').load(location.href+' #likeMain');

            // Ajax 요청이 성공했을 때 실행되는 부분
            $('#listData').empty(); // 기존의 내용을 지우고
            
            if(data == null) {
				debugger;
				$('#listData').append('<div class="row row-cols-1 row-cols-md-1 g-1" id="emptySell">등록된 상품이 없습니다.</div>');
				return;	
			}
            // 받은 데이터를 이용하여 tab_content 안에 새로운 내용 추가
            $.each(data, function(index, item) {
				debugger;
                $('#listData').append('<div class="col">' +
									'<div class="card h-100">' +
									'<a href="' + '${pageContext.request.contextPath}/board/boardDetail?proWr=' + list.PRO_WR + '&proDate=' + item.PRO_DATE + '">' + '<img src="' + '${pageContext.request.contextPath}/resources/img/uploads/' + item.IMG_NAME + '" class="card-img-top" alt="' + item.IMG_NAME + '" onerror="this.src=\'' + '${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg\'">' + '</a>' +
									'<div class="card-body">' +
									'<span class="state1">' + item.TC_NAME + '</span>' +
									 '<span class="state2" id="PRO_STATE_' + item.PRO_TSC + '">' + item.TSC_NAME + '</span>' +
									'<span style="float: right; font-size: 23px;">' +
									'<a id=likeBtn class="profile_btn">' +
									'<input type="text" id="LIK_NO" value="' + item.LIK_NO + '" hidden="">' +
									 '<ion-icon id="yesLike" name="heart-sharp" style="color:#E21818;"></ion-icon> ' +
									'</a>' +
									'</span>' +
									'<p>' + item.PRO_NAME + '</p>' +
									'<h5><b>' + item.PRO_PRICE + '원</b></h5>' +
									'</div>' +
									'</div>' +
									'</div>');

//              $('#listData').append('<div class="col">');
//              $('#listData').append('<div class="card h-100">');
//			  $('#listData').append('<a href="' + '${pageContext.request.contextPath}/board/boardDetail?proWr=' + list.PRO_WR + '&proDate=' + item.PRO_DATE + '">' + '<img src="' + '${pageContext.request.contextPath}/resources/img/uploads/' + item.IMG_NAME + '" class="card-img-top" alt="' + item.IMG_NAME + '" onerror="this.src=\${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg\'"></a>');
//			  debugger;
//			  $('#listData').append('<div class="card-body">' +
//									'<span class="state1">' + item.TC_NAME + '</span>' +
//									 '<span class="state2" id="PRO_STATE_' + item.PRO_TSC + '">' + item.TSC_NAME + '</span>' +
//									'<span style="float: right; font-size: 23px;">' +
//									'<a id=likeBtn class="profile_btn">' +
//									'<input type="text" id="LIK_NO" value="' + item.LIK_NO + '" hidden="">' +
//									 '<ion-icon id="yesLike" name="heart-sharp" style="color:#E21818;"></ion-icon> ' +
//									'</a>' +
//									'</span>' +
//									'<p>' + item.PRO_NAME + '</p>' +
//									'<h5><b>' + item.PRO_PRICE + '원</b></h5>' +
//									'</div>' +
//									'</div>' +
//									'</div>');
				debugger;
            });

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

