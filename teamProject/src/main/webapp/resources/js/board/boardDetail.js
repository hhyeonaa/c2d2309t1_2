/**
 * 게시물 상세 페이지 js 입니다.
 */
 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');
let additionalImages = [];
$(() => { // 문서가 완전히 로드되면 함수를 실행합니다.
	
	var proWr = $('#proWr').val();
	var proDate = $('#proDate').val();
	increaseViewCount(proWr,proDate);
	

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
		location.href="/" + window.location.pathname.split("/")[1] +"/board/writeBoard?proWr="+proWr+"&proDate="+proDate;
		return;
	})
	
	
	// 신고 내용 모달 불러오기
	$("#pageReport").on("click", function(){
		$(".radioBox").empty();
		$("#reportBtn").remove();
		$.ajax({
		  type: "get",
		  url: '/' + window.location.pathname.split("/")[1] + "/chat/selectRepert",
		  async: false
		})
		.done(function(datas){
			var radio = (CO_NO, CODE, CO_TYPE) =>{
				return '<input type="radio" class="reportRadio" name="rd" id="'+CO_TYPE+CO_NO
						+ '" value="'+CO_TYPE+CO_NO+'"><label for="'+CO_TYPE+CO_NO+'">'
						+ CODE+'</label> <br>'
			}
			for(data of datas){
				$(".radioBox").append(radio(data.CO_NO, data.CODE, data.CO_TYPE));
			}
			$(".modal-body").after('<button type="button" class="btn btn-primary" id="reportBtn">신고하기</button>')
		})
		;
	})
	
	// 신고하기 버튼 클릭 시
	$(document).on("click", "#reportBtn", function(){
		let isCheck = $('input[name="rd"]:checked').val();
		let reportTarget = $("#proWr").val();
		
		if(isCheck === undefined){
			alertMsg('AM9', ["신고 내용"]);
			return;
		}
		$.ajax({
			url: '/' + window.location.pathname.split("/")[1] + "/chat/insertReport",
			type: "POST",
			data: {
				reportTarget: reportTarget,
				rptCode: isCheck
			}
		})
		.done(function(data){
			if(Boolean(data)){
				alertMsg('AM3', ["신고"]);
				$('#exampleModalReport').modal('hide');
			}
		})
	});
	
	
	
	// 찜 관련 클릭
	$(document).on('click', '#likeBtn', function () {
		// 찜 삭제 기능
		if ($('#noLike').is(':hidden')) {
			if(alertMsg('AM4', ["찜"], true)) {
				$.ajax({
					type: 'post'
					, url: 'deleteLike'
					, data: {LIK_NO: $('#likNo').text()}
				})
				.done(function(data){
					if(data == '1'){
						$('#noLike').removeAttr('hidden');
						$('#yesLike').attr('hidden', 'hidden');
					}
				});
			};
			
		// 찜 추가 기능
		} else {
			if(alertMsg('AM8', ["찜"], true)) {
				$.ajax({
					type: 'post'
					, url: 'insertLike'
					, data: {PRO_NO: $('#proNo').val()}
				})
				.done(function(data){
					if(data == '1'){
//						$('#yesLike').removeAttr('hidden');
//						$('#noLike').attr('hidden', 'hidden');
						location.reload();
					}
				});
			};
		};	
	});
	
	$('#noUserBtn').on('click', function() {
		alertMsg('AM23', ["로그인 후"]); 
	});
	
	function increaseViewCount(proWr,proDate) {
	  var viewedCookie = getCookie('viewed_' + proWr);
	
	  if (viewedCookie === '') {
	    // 쿠키가 없으면 조회수 증가 요청을 서버로 전송
	    $.ajax({
	      url: 'increaseViewCount',
	      type: 'POST',
	      data: { proWr: proWr, 
	      		  proDate: proDate
	      },
	      dataType: 'json',
	      success: function(response) {
	        if (response) {
	          // 조회수 증가 요청이 성공했을 때 쿠키 설정
	          setCookie('viewed_' + proWr, 'true', 1);
	        } else {
	          console.error('조회수 증가 요청 실패');
	        }
	      },
	      error: function() {
	        console.error('조회수 증가 요청 실패');
	      }
	    });
	  }
	}
	
	// 쿠키 가져오기 함수
	function getCookie(name) {
	  var cookie = document.cookie;
	  var startIndex = cookie.indexOf(name + '=');
	
	  if (startIndex !== -1) {
	    startIndex += name.length + 1;
	    var endIndex = cookie.indexOf(';', startIndex);
	    if (endIndex === -1) {
	      endIndex = cookie.length;
	    }
	    return decodeURIComponent(cookie.substring(startIndex, endIndex));
	  }
	
	  return '';
	}
	
	// 쿠키 설정 함수
	function setCookie(name, value, hours) {
	  var expires = '';
	
	  if (hours) {
	    var date = new Date();
	    date.setTime(date.getTime() + (hours * 60 * 60 * 1000));
	    expires = '; expires=' + date.toUTCString();
	  }
	
	  document.cookie = name + '=' + encodeURIComponent(value) + expires + '; path=/';
	}
	
})
