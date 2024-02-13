//결제하기 버튼관련
function checkSubmit(payMethod) {
	//결제수단 미 선택시
	if(payMethod.length == 6){
		alert('결제수단을 선택해주세요')
		return false;
	}
}

// 스크립트 시작
$(()=>{
var payMethod = $('.nonCheck')
	
	
	
// 1. 거래방법 택배거래,직거래 선택 시 배송지입력 노출 및 미노출 	
// 	var radio = $("input[name='optradio']:checked").val();
	$("input[name='optradio']").change(function () {
		if($("input[name='optradio']:checked").val() == 'option2'){
			$('.Deliveryaddress').hide();
			return;
		}
		$('.Deliveryaddress').show();
	})
	
// 2. 결제수단 클릭 이벤트
// check(결제수단 클릭), nonCheck(결제수단 미클릭) class
    $('.PaymentGridMethod').on('click', function () {
        // 클릭된 요소에 'check' 클래스를 추가하고 'nonCheck' 클래스 제거
        $(this).addClass('check').removeClass('nonCheck');
        
        // 클릭된 요소의 부모 요소에서 다른 요소를 찾아서 'check' 클래스를 제거하고 'nonCheck' 클래스를 추가합니다.
        $(this).parent().siblings().find('.PaymentGridMethod').addClass('nonCheck').removeClass('check');
    });
	

// 결제하기 버튼 클릭 이벤트(결제수단 관련)
	$("#paymentBtn").on('click',function(){
		checkSubmit(payMethod);
	})
	
})

