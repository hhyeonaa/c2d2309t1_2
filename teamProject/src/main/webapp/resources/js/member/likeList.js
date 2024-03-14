document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');		
			   
$(()=>{
	var idx = 1;
	$('#listDiv').addClass('MM' + idx);
	$('.MM' + idx).css('display','block');
	
	// 게시판 목록 변경 기능
	$('label').on('click', function(){
		$('#listDiv').removeClass('MM' + idx);
		idx = $(this).index() + 1;
		$('#listDiv').addClass('MM' + idx);
		
		$('label').removeClass('on');
		$(this).addClass('on');

		$.ajax({
			type: 'get'
			, url: 'likeListSelect' 
			, data: { TC_DATA : 'MM' + idx
					  , TSC_DATA : $('#selectMenu').val()}
		}).done(function(data) {
            $('#listData').empty();
            
            if(data == '') {
				$('#listData').append('<div class="row row-cols-1 row-cols-md-1 g-1" id="emptySell">찜한 상품이 없습니다.</div>');
				return;	
			}

			$.each(data, function(index, item) {
				var likeNum = index + 1;
			    $('#listData').append('<div class="col">'
			        + '<div class="card h-100">'
			        + '<a href="' + item.PATH + '/board/boardDetail?proWr=' + item.PRO_WR + '&proDate=' + item.PRO_DATE + '">'
			        + '<img src="' + item.PATH + '/resources/img/uploads/' + item.IMG_NAME + '" class="card-img-top" alt="' + item.IMG_NAME + '" onerror="this.src=\'' + item.PATH + '/resources/img/common/따봉도치.jpg\'">'
			        + '</a>'
			        + '<div class="card-body">'
			        + '<span class="state1">' + item.TC_NAME + '</span>'
			        + '<span class="state2" id="PRO_STATE_' + item.PRO_TSC + '">' + item.TSC_NAME + '</span>'
			        + '<span style="float: right; font-size: 23px;">'
			        + '<a id="likeBtn_' + likeNum + '" class="profile_btn">'
			        + '<input type="text" id="LIK_NO_' + likeNum + '" value="' + item.LIK_NO + '" hidden="">'
			        + '<ion-icon id="yesLike_' + likeNum + '" name="heart-sharp" style="color:#E21818;"></ion-icon> '
			        + '</a>'
			        + '</span>'
			        + '<p class="subject">' + item.PRO_NAME + '</p>'
			        + '<h5><b>' + item.PRO_PRICE + '원</b></h5>'
			        + '</div>'
			        + '</div>'
			        + '</div>');
			});
		});
	});

	// select 박스 변경 기능
	$('#selectMenu').change(function() {
		$('label').removeClass('on');
		
		$.ajax({
			type: 'get'
			, url: 'likeListSelect' 
			, data: { TC_DATA : 'MM' + idx 
					  , TSC_DATA : $(this).val()}
		}).done(function(data) {
            $('#listData').empty();
            
            if(data == '') {
				$('#listData').append('<div class="row row-cols-1 row-cols-md-1 g-1" id="emptySell">등록한 상품이 없습니다.</div>');
				return;	
			}

			$.each(data, function(index, item) {
				var likeNum = index + 1;
			    $('#listData').append('<div class="col">'
			        + '<div class="card h-100">'
			        + '<a href="' + item.PATH + '/board/boardDetail?proWr=' + item.PRO_WR + '&proDate=' + item.PRO_DATE + '">'
			        + '<img src="' + item.PATH + '/resources/img/uploads/' + item.IMG_NAME + '" class="card-img-top" alt="' + item.IMG_NAME + '" onerror="this.src=\'' + item.PATH + '/resources/img/common/따봉도치.jpg\'">'
			        + '</a>'
			        + '<div class="card-body">'
			        + '<span class="state1">' + item.TC_NAME + '</span>'
			        + '<span class="state2" id="PRO_STATE_' + item.PRO_TSC + '">' + item.TSC_NAME + '</span>'
			        + '<span style="float: right; font-size: 23px;">'
			        + '<a id="likeBtn_' + likeNum + '" class="profile_btn">'
			        + '<input type="text" id="LIK_NO_' + likeNum + '" value="' + item.LIK_NO + '" hidden="">'
			        + '<ion-icon id="yesLike_' + likeNum + '" name="heart-sharp" style="color:#E21818;"></ion-icon> '
			        + '</a>'
			        + '</span>'
			        + '<p class="subject">' + item.PRO_NAME + '</p>'
			        + '<h5><b>' + item.PRO_PRICE + '원</b></h5>'
			        + '</div>'
			        + '</div>'
			        + '</div>');
			});
		});
	});

	
	
	
	$(document).on('click', '.profile_btn', function () {
		var LIK_NUM = parseInt(this.id.split("_")[1]);
		// 찜 삭제 기능
		if ($('#noLike_' + LIK_NUM).is(':hidden')) {
			debugger;
			if(alertMsg('AM4', ["찜"], true)) {
				$.ajax({
					type: 'post'
					, url: 'deleteLike'
					, data: {LIK_NO: $('#LIK_NO_' + LIK_NUM).val()}
				})
				.done(function(data){
					if(data == '1'){
						$('#noLike_' + LIK_NUM).removeAttr('hidden');
						$('#yesLike_' + LIK_NUM).attr('hidden', 'hidden');
					}
				});
			};
			
		// 찜 추가 기능
		} else {
			if(alertMsg('AM8', ["찜"], true)) {
				$.ajax({
					type: 'post'
					, url: 'insertLike'
					, data: {PRO_NO: $('#PRO_NO_' + LIK_NUM).val()}
				})
				.done(function(data){
					if(data == '1'){
						$('#yesLike_' + LIK_NUM).removeAttr('hidden');
						$('#noLike_' + LIK_NUM).attr('hidden', 'hidden');
					}
				});
			};
		};	
	});

});		

