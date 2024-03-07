//$(function() {
//	$("#modal").modal("show");
//});

//// 2-1 배송지 저장하기
//function payAddSubmit(){
//	
//}

// 4. 결제 api
var IMP = window.IMP;
var requestPay = (pgId, paypayMethod) => {
	IMP.init("imp34662564"); //가맹점 식별코드
//        
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
		var price = parseInt($("#totalprice").text().replace("원","").trim());//결제금액   
        var productname = $("#payProName").text().trim();//제품name
        
        debugger;
       	IMP.request_pay({
			pg: pgId,
			pay_method: paypayMethod, // 생략가능
  			merchant_uid: makeMerchantUid, // 상점에서 생성한 고유 주문번호
  			name: productname, //상품명
	 		amount: 100, // 결제금액
	 		//buyer_email: "test@portone.io",
  			buyer_name: "구매자이름",
  			buyer_tel: "010-1234-5678",
  			buyer_addr: "서울특별시 강남구 삼성동",
  			buyer_postcode: "123-456"
		}, function (rsp) { // callback 로직
  			if(rsp.success){
				  debugger;
				  console.log(rsp);
//				  $.ajax({
//					  type: "post",
//					  url: "${pageContext.request.contextPath}/pay/paySuccess",
//				  })//ajax
				  
		  	}else{
				  debugger;
				  console.log(res);
			  }
		});
}

//5-1 배송지리스트
function addList(result){
	for (let item of result) {
		$("#divAddress").append('<li class="addressInfo mb-4">'+
									'<div class="boxdeliveryaddress">'+
										'<div class="boxdeliveryaddressTitle">'+
											'<span>'+item.ADD_NICK +'</span>'+
											'<button type="button" class="button__delivery-choice">선택</button>'+
										'</div>'+
										'<div class="useraddressinfo">'+
											'<div id="useraddressinfo">'+
												'<div class="boxdeliveryaddressContent">'+
													'<span>('+item.ADD_POST +') ' +item.ADD_NAME +' ' +item.ADD_DETAIL+'</span>'+
												'</div>'+
												'<div class="boxdeliveryaddressName">'+
													'<span>'+item.ADD_RECEIVER +'</span> '+
													'<span>'+item.ADD_PHONE +'</span>'+
												'</div>'+
											'</div>'+
											'<div class="deliverybtn">'+
												'<button>수정</button>'+
												'<button>삭제</button>'+
											'</div>'+	
										'</div>'+
									'</div>'+
								'</li>')
	}
}// addList()



// 스크립트 시작
$(()=>{
// 결제할(선택된) 페이 css변경(4)
var payCheck = $('.nonCheck')
// 결제할(선택된) 페이(4)
//var payMethod = $('.check').find('span').text().trim();
//var payMethod1 = $('.check').attr('value');	

var pgId = "";
var paypayMethod="";

$('#tossPay').on("click", () =>{
	pgId="tosspay.tosstest";
	paypayMethod="card";
});

$('#kakaoPay').on("click", () =>{
	pgId="kakaopay.TC0ONETIME";
	paypayMethod="card";
})
	
	
// 1. 거래방법 택배거래,직거래 선택 시 배송지입력 노출 및 미노출 	
// 	var radio = $("input[name='optradio']:checked").val();
	$("input[name='optradio']").change(function () {
	
	parseInt($('#totalprice').text().trim().match(/\d+/)[0]) + parseInt($('.kzWuNm').text().trim().match(/\d+/)[0])
		if($("input[name='optradio']:checked").val() == 'option2'){
			$('.Deliveryaddress').hide();
			$('.NBdoU').hide();//배송료 +3000
			parseInt($('#totalprice').text().trim().match(/\d+/)[0]) - parseInt($('.kzWuNm').text().trim().match(/\d+/)[0])
			return;
		}
		$('.Deliveryaddress').show();
		$('.NBdoU').show();
		parseInt($('#totalprice').text().trim().match(/\d+/)[0]) + parseInt($('.kzWuNm').text().trim().match(/\d+/)[0])
	})
		
// 2. 배송지 등록 주소 api(배송지 등록 모달)
	$("#address_find").on('click', function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	            
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            var fullAddr= '';
	            var extraAddr='';
	            
	            if(data.userSelectoredType === 'R'){
	            	fullAddr = data.roadAddress;
	            } else{
	            	fullAddr = data.jibunAddress;
	            }
	            
	            // extraAddr 
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }	                    
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }		            
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullAddr !== ''){
	                fullAddr += extraAddr;
	            }                    
	            
	            $("#address-zipcode").val(data.zonecode); 
	            $("#address-front").val(fullAddr);
	            $("#address-detail").focus();
	            
	        }
	    }).open();
	});

// 2-1 배송지목록 등록 저장
	$('#payAddbtn').on('click', function(){
		// 배송지목록 등록 정보 유효성
		var addnick = $('input[name=ADD_NICK]').val(); 
		var receiver = $('input[name=ADD_RECEIBER]').val();
		var phone = $('input[name=ADD_PHONE]').val();
		var post = $('input[name=ADD_POST]').val();
		var addname = $('input[name=ADD_NAME]').val();
		var adddetail = $('input[name=ADD_DETAIL]').val();
		if(addnick = ''){
			alert("배송지명을 입력하세요.")
			addnick.focus();
			return false;
		}
		if(receiver = ''){
			alert("수령인을 입력하세요.")
			receiver.focus();
			return false;
		}
		if(phone =''){
			alert("연락처을 입력하세요.")
			phone.focus();
			return false;
		}
		if(post =''){
			alert("주소 입력하세요.")
			post.focus();
			return false;
		}
		if(addname =''){
			alert("주소 입력하세요.")
			addname.focus();
			return false;
		}
		if(adddetail =''){
			alert("상세주소를 입력하세요.")
			adddetail.focus();
			return false;
		}
	})
	
	
// 3. 결제수단 클릭 이벤트(css)
// check(결제수단 클릭), nonCheck(결제수단 미클릭) class
    $('.PaymentGridMethod').on('click', function () {
        // 클릭된 요소에 'check'를 추가하고 'nonCheck' 제거
        $(this).addClass('check').removeClass('nonCheck');
        
        // 클릭된 요소의 부모 요소에서 다른 요소를 찾아서 'check' 클래스를 제거하고 'nonCheck' 추가
        $(this).parent().siblings().find('.PaymentGridMethod').addClass('nonCheck').removeClass('check');
    });
    
// 4. 결제하기 버튼 클릭 이벤트(결제 api)
	$("#paymentBtn").on('click',function(){
		if(pgId == "") {
			alert('결제 수단을 선택해주세요');
			return false;
		}
		requestPay(pgId, paypayMethod);
		if($('.kGbUWb').text()==""){
			alert('배송주소를 등록해주세요');
			return false;
		}
	})
// 5.배송지리스트 모달관련
	$('#staticBackdrop').on('show.bs.modal', function(){
		$.ajax({
			url:"addList",
			data:{MEM_NO : $('#MEM_NO').val() },
			success:function(result){
				$("#divAddress").empty();
				addList(result)
			},
			fail:function(){
			}
		})//ajax
			
	})

// 6.새 배송지 추가 저장 취소 관련
	// 새 배송지 추가저장 
	$("#payAddbtn").on('click', function(){
		var ADD_NICK = $("#address-title").val();
		var ADD_RECEIVER = $("#address-name").val();
		var ADD_PHONE = $("#address-tel").val();
		var ADD_POST = $("#address-zipcode").val();
		var ADD_NAME = $("#address-front").val();
		var ADD_DETAIL = $("#address-detail").val();
		var MEM_NO = $('#MEM_NO').val()
		$("#staticBackdrop").modal("show");
	})
	//  모달 취소 > 배송리스트 모달
	$("#payCancelbtn").on('click', function(){
		$("#staticBackdrop").modal("show");
	})
	// x버튼 > 배송리스트 모달
	$("#payListXbtn").on('click', function(){
		$("#staticBackdrop").modal("show");
	})
	
})

