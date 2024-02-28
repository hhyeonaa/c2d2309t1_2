//결제하기 버튼관련
//function checkSubmit(payCheck) {
//	//결제수단 미 선택시 (nonCheck가 6개)
//	if(payCheck.length == 6){
//		alert('결제수단을 선택해주세요')
//		return false;
//	}
//}




// 토스결제 api
//function TossPayment(){
//	IMP.request_pay({
//		pg: "tosspay.{tosstest}",
//	})
//}


// 카카오페이 api
//function KakaoPayment(){
//	debugger;
//		var IMP = window.IMP;
//        IMP.init("imp34662564"); //가맹점 식별코드
//        
//        var today = new Date();   
//        var hours = today.getHours(); // 시
//        var minutes = today.getMinutes();  // 분
//        var seconds = today.getSeconds();  // 초
//        var milliseconds = today.getMilliseconds();
//        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
//	IMP.request_pay({
//		pg: "kakaopay.{TC0ONETIME}",
//		pay_method: "card", // 생략가능
//  		merchant_uid: makeMerchantUid, // 상점에서 생성한 고유 주문번호
//  		name: "주문명:결제테스트",
// 		amount: 100, // 결제금액
// 		buyer_email: "test@portone.io",
//  		buyer_name: "구매자이름",
//  		buyer_tel: "010-1234-5678",
//  		buyer_addr: "서울특별시 강남구 삼성동",
//  		buyer_postcode: "123-456",
//	}, function (rsp) { // callback 로직
//  		if(rsp.success){
//			  console.log(rsp);
//		  }else{
//			  console.log(res);
//		  }
//	});
//}

// 스크립트 시작
$(()=>{
// 결제할(선택된) 페이 css변경(4)
var payCheck = $('.nonCheck')
// 결제할(선택된) 페이(4)
//var payMethod = $('.check').find('span').text().trim();
//var payMethod1 = $('.check').attr('value');	
	
	
// 1. 거래방법 택배거래,직거래 선택 시 배송지입력 노출 및 미노출 	
// 	var radio = $("input[name='optradio']:checked").val();
	$("input[name='optradio']").change(function () {
		if($("input[name='optradio']:checked").val() == 'option2'){
			$('.Deliveryaddress').hide();
			return;
		}
		$('.Deliveryaddress').show();
	})
		
// 2. 배송지 등록 주소 api(배송지 등로 모달)
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
	
// 3. 결제수단 클릭 이벤트(css)
// check(결제수단 클릭), nonCheck(결제수단 미클릭) class
    $('.PaymentGridMethod').on('click', function () {
        // 클릭된 요소에 'check' 클래스를 추가하고 'nonCheck' 클래스 제거
        $(this).addClass('check').removeClass('nonCheck');
        
        // 클릭된 요소의 부모 요소에서 다른 요소를 찾아서 'check' 클래스를 제거하고 'nonCheck' 클래스를 추가합니다.
        $(this).parent().siblings().find('.PaymentGridMethod').addClass('nonCheck').removeClass('check');
    });
    
// 4. 결제하기 버튼 클릭 이벤트(결제 api)
	$("#paymentBtn").on('click',function(){
		debugger;

		
//		// 결제수단 체크 유무 확인하기
//		checkSubmit(payCheck);
		// 체크된 결제수단 
		var IMP = window.IMP;
        IMP.init("imp34662564"); //가맹점 식별코드
        
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
       	switch($('.check').find('span').text().trim()){
			case '토스페이':
			TossPayment();
			break;
			
			case '카카오페이':
			debugger;
//			KakaoPayment();
			IMP.request_pay({
				pg: "kakaopay.{TC0ONETIME}",
				pay_method: "card", // 생략가능
		  		merchant_uid: makeMerchantUid, // 상점에서 생성한 고유 주문번호
		  		name: "주문명:결제테스트",
		 		amount: 100, // 결제금액
		 		buyer_email: "test@portone.io",
		  		buyer_name: "구매자이름",
		  		buyer_tel: "010-1234-5678",
		  		buyer_addr: "서울특별시 강남구 삼성동",
		  		buyer_postcode: "123-456",
			}, function (rsp) { // callback 로직
		  		if(rsp.success){
					  console.log(rsp);
				  }else{
					  console.log(res);
				  }
			});
			break;
			
			default:
			alert('결제 수단을 선택해주세요');
			break;	
		}
        

	})

})

