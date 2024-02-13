// 스크립트 시작
$(()=>{
// 거래방법 택배거래,직거래 선택 시 배송지입력 노출 및 미노출 	
// 	var radio = $("input[name='optradio']:checked").val();
	$("input[name='optradio']").change(function () {
		if($("input[name='optradio']:checked").val() == 'option2'){
			$('.Deliveryaddress').hide();
			return;
		}
		$('.Deliveryaddress').show();
	})
	
// 결제수단 클릭 이벤트
// addClass, removeClass
// kvEuJF, cGqPmKf
	$('.PaymentGrid__Card-sc-96u70s-3').on('click', function () {
// 	debugger;
	var payMethod = $('.cGqPmK') // .length(총 결제수단 6개) , 결제수단 미 선택 시 false(결제버튼 클릭)
// 	debugger;
	$(this).removeClass('cGqPmK');
// 	debugger;
	$(this).addClass('kvEuJF');
	if(payMethod == 5){
// 		debugger;
		alert('결제수단을 선택해주세요')
		return false;
	}


	})
})
//유효성 체크 후 submit
function checkSubmit() {
	
}