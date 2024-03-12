/**
 * 게시물 상세 페이지 js 입니다.
 */
 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');
let additionalImages = [];
$(() => { // 문서가 완전히 로드되면 함수를 실행합니다.
//	$(".carousel-item img").click(function(){
//	    let img = new Image();
//	    img.src = $(this).attr("src")
//	    $('.modalBox').html(img);
//	    $(".modal").show();
//	});
//	// 모달 클릭할때 이미지 닫음
//	$(".modal").click(function (e) {
//		$(".modal").toggle();
//	});
	$('.carousel').carousel('pause');
// 제일 좋은 방법은 이미지들에게 그냥 클래스를 주는 것이 좋다.
    $(".carousel-item img").click(function() {
//     	$('.modalBox').html('');
//     	additionalImages = [];
    	
        // 클릭한 이미지를 첫 번째 이미지로 설정
        let clickedImgSrc = $(this).attr("src");
		console.log(clickedImgSrc);
        // 현재 페이지의 모든 캐러셀 이미지의 src 속성 값 수집
        
        $('.carousel-item img').each(function(a, b, c) {
        	//debugger;
            var imgSrc = $(this).attr('src');
            // 클릭한 이미지는 제외하고 배열에 추가
            if (imgSrc !== clickedImgSrc) {
                additionalImages.push(imgSrc);
            }
        });
        console.log('이미지 배열: ' + additionalImages);

        // 캐러셀 구조 및 컨트롤러 추가
        let modalContent = `<div id="modalCarousel" class="carousel slide" >
                                <div class="carousel-inner">
                                	<div class="carousel-item active">
		                                <img id="selectImg" src="" class="d-block w-100" alt="Slide 1">
		                            </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#modalCarousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#modalCarousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>`;
        // 모달 내용 업데이트 및 표시
        $('.modalBox').html(modalContent);
        $(".imgModal").show();
		$('#selectImg').attr('src', clickedImgSrc);
		// 모달 컨텐츠 추가 후 이벤트 핸들러 재설정
		$('#modalCarousel .carousel-control-prev').off('click').on('click', function(event) {
		    event.preventDefault();
		    event.stopPropagation();
		    $('#modalCarousel').carousel('prev');
		});

		$('#modalCarousel .carousel-control-next').off('click').on('click', function(event) {
		    event.preventDefault();
		    event.stopPropagation();
		    $('#modalCarousel').carousel('next');
		});
		for(const e of additionalImages){
			console.log('e: '+ e);
			let item = `<div class="carousel-item">
							<img src="" class="d-block w-100" alt="...">
						</div>`;
			$('#modalCarousel .carousel-inner').append(item);// 캐러셀 아이템 추가
			$('#modalCarousel .carousel-inner .carousel-item:last img').attr('src', e); // src에 안들어갔지		
			//console.log('item: '+item);
		}
    });

	// 모달 클릭할때 이미지 닫음
	$(".imgModal").click(function (e) {
		e.preventDefault();
    	$('.modalBox').html('');
    	additionalImages = [];
		$(".imgModal").toggle();
	});
	
	// 글 삭제 버튼
	$('#deleteBoard').on('click',function(){
		const proNo = $('#proNo').val();
		const proTc = $('#proTc').val();
		if(alertMsg("AM4",["글"],true)){
			alertMsg("AM1", ["글"]);
			location.href="/" + window.location.pathname.split("/")[1] +"/board/deleteBoard?proNo="+proNo+"&proTc="+proTc;
			return;
		}
		alertMsg("AM2",["삭제"]);
	})
	
	// 글 수정 버튼
	$('#updateBtn').on('click',function(){
		// 데이터를 다 들고 가야 하니까
		const proWr = $('#proWr').val();
		const proDate = $('#proDate').val();
		alert(proWr + ' ' + proDate);
		location.href="/" + window.location.pathname.split("/")[1] +"/board/writeBoard?proWr="+proWr+"&proDate="+proDate;
		return;
	})
	
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
    			console.log(data);
    			alert('신고가완료되었습니다.')
    		})
    		.fail(function(){
    			alert('신고 내용을 선택해주세요.')
    		})
    	});
	
})