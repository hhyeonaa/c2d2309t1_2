/**
 * 경매 상세 게시판 JS 파일
 */
 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>')
let additionalImages = [];
let timerInterval;
 $(() => {
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
        $(".modal").show();
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
	$(".modal").click(function (e) {
		e.preventDefault();
    	$('.modalBox').html('');
    	additionalImages = [];
		$(".modal").toggle();
	});
	
	
	function startTimer() {
	  // 기존 타이머 클리어
	  clearInterval(timerInterval);
	
	  // 새로운 타이머 시작
	  timerInterval = setInterval(updateTimer, 1000);
	}

	function updateTimer() {
	  const aucDateStr = $('#aucDate').val(); // 20240223173445
	
	  if (aucDateStr) {
		const year = parseInt(aucDateStr.slice(0, 4));
		const month = parseInt(aucDateStr.slice(4, 6)) - 1; // 월은 0부터 시작
		const day = parseInt(aucDateStr.slice(6, 8));
		const hour = parseInt(aucDateStr.slice(8, 10));
		const minute = parseInt(aucDateStr.slice(10, 12));
		const second = parseInt(aucDateStr.slice(12, 14));
		
		const targetDate = new Date(year, month, day, hour, minute, second);
		targetDate.setDate(targetDate.getDate() + 1);
		
		const now = new Date();
		const timer = targetDate - now; // 남은 밀리초
		
		    if (timer > 0) {
		      // 밀리초를 "일 시 분 초"로 변환
		      const days = Math.floor(timer / (1000 * 60 * 60 * 24));
		      const hours = Math.floor((timer % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		      const minutes = Math.floor((timer % (1000 * 60 * 60)) / (1000 * 60));
		      const seconds = Math.floor((timer % (1000 * 60)) / 1000);
		
		      // 화면에 표시
		      $("#timer").text(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초 (종료 " + targetDate.toLocaleString() + ")");
		    } else {
		      // 시간이 만료되었을 경우
		      clearInterval(timerInterval);
		      $("#timer").text("시간이 만료되었습니다!");
		    }
		  } else {
		    // aucDate 값이 없을 경우 처리
		    clearInterval(timerInterval);
		    $("#timer").text("유효한 날짜가 아닙니다.");
		  }
	}
	
	// 타이머 시작
	startTimer();
	
	$('#deleteAuction').on('click',function(){
		const aucNo = $('#aucNo').val();
		const aucTc = $('#aucTc').val();
		if(alertMsg("AM4",["글"],true)){
			alertMsg("AM1", ["글"]);
			location.href="/" + window.location.pathname.split("/")[1] +"/board/deleteAuction?aucNo="+ aucNo + "&aucTc=" + aucTc;
			return;
		}
		alertMsg("AM2",["삭제"]);
	})
	
	$('#updateAuction').on('click',function(){
		// 데이터를 다 들고 가야 하니까
		const aucSeller = $('#aucSeller').val();
		const aucDate = $('#aucDate').val();
		alert(aucSeller + ' ' + aucDate);
		location.href="/" + window.location.pathname.split("/")[1] +"/board/writeBoard?aucSeller="+aucSeller+"&aucDate="+aucDate;
		return;
	})
	 
 })