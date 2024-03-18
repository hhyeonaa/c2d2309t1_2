/**
 * 나눔 상세 페이지 js 입니다.
 */
 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>')
let additionalImages = [];
$(() => { // 문서가 완전히 로드되면 함수를 실행합니다.
	var proWr = $('#proWr').val();
	var proDate = $('#proDate').val();
	var proNo = $('#proNo').val();
	increaseViewCount(proWr,proDate,proNo);

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
	
	// 나눔 신청자에게 채팅하기
    $(".chat-button").click(function(){
        // 클릭된 버튼의 부모 div에 접근
        var parentDiv = $(this).closest('div');
		var spanText = parentDiv.find('span');	
        // 부모 div를 콘솔에 로그
//         console.log(parentDiv.text());
        console.log(spanText.text());

        // 여기에서 parentDiv를 조작
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
	
	$('#shareApplication').on('click',function(){
		var memId = $('#memId').val();
		if(memId === ''){
			alertMsg("AM23", ["로그인 후"]);
			return;
		}
		var values = [];
		$(".divApp").each(function() {
			values.push($(this).val());
		});
		// 이 배열과 내 세션값의 아이디와 비교하여 막기...
		if (values.includes(memId)) {
			alertMsg("AM3", ["이미"]);
			return;
		}
		
		$('#shareList').css('display', 'block');
	})
	$('#apply').on('click', function(e){
		const divApplicant = $('#divApplicant').val();
		const divPostNo = $('#proNo').val();
		const divReason = $('#appTxt').val();
		alert('divApplicant: ' + divApplicant + 'divPostNo: ' + divPostNo + 'divReason: ' + divReason);
		$.ajax({
			url: 'insertDivide', // 서버 엔드포인트 URL
			type: 'POST',
			data: {
				divApplicant : divApplicant,
				divPostNo	: divPostNo,
				divReason	: divReason
			},
		}).done(function(response) {
			response ? alertMsg("AM3",["신청"]) : alertMsg("AM16",["신청"]);
			// 파일 업로드 성공 시 처리
			console.log('Upload success:', response);
		});
	})
	$('.delBtn').on('click',function(){
		const divPostNo = $('#proNo').val();
		// 클릭된 버튼이 속한 행(<tr>) 찾기
        var row = $(this).closest('tr');
        
        // 행에서 값 가져오기
        var divApplicant = row.find('td:eq(0)').text(); // 신청자 정보
        var divReason = row.find('td:eq(1)').text(); // 신청 이유
        alert("divApplicant : " + divApplicant + " divReason : " + divReason)
        if(alertMsg("AM4",["신청글"],true)){
			$.ajax({
			url: 'deleteDivide', // 서버 엔드포인트 URL
			type: 'POST',
			data: {
				divApplicant : divApplicant,
				divPostNo	: divPostNo,
				divReason	: divReason
			},
			}).done(function(response) {
				response ? alertMsg("AM3",["삭제"]) : alertMsg("AM16",["삭제"]);
				// 파일 업로드 성공 시 처리
				console.log('Upload success:', response);
			});
		} else {
			alertMsg("AM2",["삭제"]);
			return;
		};
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
	
	function increaseViewCount(proWr,proDate,proNo) {
	  var viewedCookie = getCookie('viewed_' + proNo);
	
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
	          setCookie('viewed_' + proNo, 'true', 1);
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