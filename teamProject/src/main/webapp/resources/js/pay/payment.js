document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>'); 
// 배송지(연락처) 입력 유효성
//var phoneRegex =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;        
$("#address-tel").on("keyup", function(e){
	var partton = /[^0-9]/g;
	if(partton.test($(this).val())){
			var value = $(this).val().replace(/[^0-9]/g,"");
			$("#address-tel").val(value);
		}
}) 
//function checkPhone(TEL) {
//	var phone = $("#address-tel").val();
//	if(phoneRegex.test(phone)){
//		return true;
//	}
//	return false;
//}      
// 1-1 거래방식 선택 +  배송료 , 최종금액 관련함수
//function selectMethod(){
//	$("input[name='optradio']").change(function () {
//	//var deliprice = parseInt($('.kzWuNm').text().trim().match(/\d+/)[0]);
//	//var prodprice = parseInt($('#prodprice').text().trim().match(/\d+/)[0]);
//		if($("input[name='optradio']:checked").val() == 'option2'){
//			$('.Deliveryaddress').hide();
//			//$('.NBdoU').hide();//배송료 +3000
//			//$("#allPrice").text(prodprice);
//			return;
//		}
//		//$("#allPrice").text(prodprice + deliprice);
//		$('.Deliveryaddress').show();
//		//$('.NBdoU').show();
//	})
//}
// 10 결제완료 후 상품상태 TM1 > TM2 update (확인O)
function payProUpdate(a){
	$.ajax({
		url : "payProUpdate",
		type:"post",
		data:{PRO_NO : a}
	})//ajax
	.done(function(data){
		if(data == 1){
			//alert('거래상태 update 성공');			
		}	
	})
	.fail(function(){
	})
}

// 4. 결제 api
var IMP = window.IMP;
var requestPay = (pgId) => {
	IMP.init("imp34662564"); //가맹점 식별코드
//       
 		//판매자 구매자 정보 가져오기 ajax
 		$.ajax({
			 url:"payInfo",
			 data:{
				 MEM_NO : $('#MEM_NO').val(), //결제자 고유번호
				 ADD_NO : $('#ADD_NO').val(), //배송지 고유번호
				 PRO_NO : $('#PRO_NO').val(), //상품 고유번호
				 PRO_WR : $('#PRO_WR').val(), //판매자 아이디
				 PRO_DATE : $('#PRO_DATE').val() //상품 작성날짜
				 },
			 async: false,
			 success:function(data){
				if(data != null){
				//data값
					//주문번호 만들기
					const make_merchant_uid = () => {
				        const current_time = new Date();
				        const hour = current_time.getHours().toString();
				        const minute = current_time.getMinutes().toString();
				        const second = current_time.getSeconds().toString();
						const milliseconds = String(current_time.getMilliseconds()).slice(0, 1);
				        var merchant_uid = "" + hour + minute + second + milliseconds;
				        merchant_uid = merchant_uid.length != 7 ? merchant_uid.padEnd(7, "L") : merchant_uid;
				        return merchant_uid;
				    };
				    const merchant_uid = make_merchant_uid()
			        
					var price = parseInt($("#totalprice").text().replace("원","").trim());//결제금액   
			        var productname = $("#payProName").text().trim();//제품name

			        //var msg = $('#selectDel option:selected').text();
			        
			       	IMP.request_pay({
						pg: pgId, 
			  			merchant_uid: "PAY"+merchant_uid, // 상점에서 생성한 고유 주문번호 //MERCHANT_UID
			  			name: productname, //상품명 // PRO_NAME
				 		amount: 100, // 결제금액 price //PAID_AMOUNT
			  			buyer_name: data.BUYNAME, //결제자 이름 
			  			buyer_tel: data.BUYTEL, //결제자 연락처 //BUYER_TEL
			  			buyer_addr: $("#addName").text() + $("#addDetail").text(), // 배송주소 //BUYER_ADDR
			  			buyer_postcode: $("#addPost").text() // 배송우편번호 //BUYER_POSTCODE
					}, function (rsp) { // callback 로직
			  			if(rsp.success){ //결제 성공
							rsp["SELLER_NO"] = data.SELLER;
							rsp["BUYER_NO"] = $('#MEM_NOreal').val();
							rsp["PRO_NO"] = $('#PRO_NO').val();
							//배송요청사항
							rsp["PAY_MSG"] = $('#selectDel option:selected').text();
							if($("#selectDel  option").index($("#selectDel  option:selected")) == 6 ){
								rsp["PAY_MSG"] = $('.DeliveryPanel__ShippingRequest-sc-10nnk4w-4').val();
							}
							//**
							//var newData = {};
							//newData.imp_uid = rsp.imp_uid
							console.log(rsp);
							 $.ajax({
								 type: "post",
								 url: "paySuccess",
								 data: rsp
							 })//ajax
							 .done(function(data){
								 if(data){
									var PRO_NO = $('#PRO_NO').val();
									var MEM_NO = $('#MEM_NOreal').val();
									payProUpdate(PRO_NO);
									var url = 'completepay?PRO_NO=' + PRO_NO + '&MEM_NO=' + MEM_NO 
									window.location.href = url;
								 } else{
									 console.log("paySuccess insert 실패");
								 } 
								 
							 })
						  	}else{
								  console.log(res);
							 }
						});
				//data값
				}
			},//success:function(data)
			fail:function(){
			}
		})//ajax
}
//5-1 배송지리스트
function addList(result){
	var i = 0;    
	for (let item of result) {
		$("#divAddress").append('<li class="addressInfo mb-4" id="addListNo' + i + '">'+
									'<div class="boxdeliveryaddress">'+
									'<input id="ADD_NO' + i + '" type="hidden" value="'+item.ADD_NO+'" name="ADD_NO" class="addno">' +
									'<input id="MEM_NO1" type="hidden" value="'+item.MEM_NO+'" name="MEM_NO">' +
										'<div class="boxdeliveryaddressTitle">'+
											'<span>'+item.ADD_NICK +'</span>'+
											'<button type="button" class="button__delivery-choice" id="choiceBtn' + i + '">선택</button>'+
										'</div>'+
										'<div class="useraddressinfo">'+
											'<div id="useraddressinfo">'+
												'<div class="boxdeliveryaddressContent">'+
													'<span>(<span id="addPost" class="addPost">'+item.ADD_POST +'</span>) ' 
															+ '<span class="addName">' +item.ADD_NAME +'</span> ' 
															+ '<span class="addDetail">' +item.ADD_DETAIL +'</span></span>'+
												'</div>'+
												'<div class="boxdeliveryaddressName">'+
													'<span class="addReceiver">'+item.ADD_RECEIVER +'</span> '+
													'<span class="addTel">'+item.ADD_PHONE +'</span>'+
												'</div>'+
											'</div>'+
											'<div class="deliverybtn">'+
												'<button type="button" class="deliUpdate' + i + '">수정</button>'+
												'<button type="button" class="deliDelete' + i + '">삭제</button>'+
											'</div>'+	
										'</div>'+
									'</div>'+
								'</li>')
		i++;
	}
}// addList()



// 스크립트 시작
$(()=>{
	$.ajax({
		url: "paymentPro"
	})
	.done(function(data){
		if(data.length == 0){
			$("#hideOrShow").hide();
			return;
		}
		$("#delUpdateBtn").text("배송지 수정");
		$("#MEM_NO").val(data[0].MEM_NO);
		$("#ADD_NO").val(data[0].ADD_NO);
		$("#addReceiver").text(data[0].ADD_RECEIVER);
		$("#addSpan").prepend('(<span id="addPost"></span>)');
		$("#addPost").text(data[0].ADD_POST);
		$("#addName").text(data[0].ADD_NAME);
		$("#addDetail").text(data[0].ADD_DETAIL);
		$("#addTel").text(data[0].ADD_PHONE);
	})
	 
	
// 결제할(선택된) 페이 css변경(4)
var payCheck = $('.nonCheck')

var pgId = "";

$('#tossPay').on("click", () =>{
	pgId="tosspay.tosstest";
});

$('#kakaoPay').on("click", () =>{
	pgId="kakaopay.TC0ONETIME";
})

$('#paycoPay').on("click", () => {
	pgId="payco.PARTNERTEST";
})	

$('#phonePay').on("click", () => {
	pgId="danal";
})
$('#samsungPay').on('click', () => {
	alertMsg("AM24",["삼성페이"]);
})
$('#applePay').on('click', () => {
	alertMsg("AM24",["애플페이"]);
})
	
// 1. 거래방법 택배거래,직거래 선택 시 배송지입력 노출 및 미노출 	
//selectMethod();
		
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
			alertMsg("AM9",["결제 수단"]);
			return false;
		}
		if($('.kGbUWb').text()==""){
			alertMsg("AM22",["배송 주소"]);
			return false;
		}
		if($("#selectDel  option").index($("#selectDel  option:selected")) == 0){
			alertMsg("AM6",["배송 요청사항"]);
			
			return false;
		}
		requestPay(pgId);
	})
	
	
// 5.배송지리스트 모달관련(삭제, 수정, 선택)
	$('#staticBackdrop').on('show.bs.modal', function(){
		$("#payUpdateBtn").attr("id", "payAddbtn");
		$("#payAddbtn").text("저장");
		
		$.ajax({
			url:"addList",
			async: false,
			success:function(result){
				$("#divAddress").empty();
				addList(result)
			},
			fail:function(){
			}
		})//ajax
		
		// 6.배송지 삭제
		$("[class^='deliDelete']").on('click', function(e){
			$("#staticBackdrop").modal("hide");
			$.ajax({
				url: "addDeliveryDelete",
				data: {ADD_NO : $('#ADD_NO' + $(e.target).attr("class").match(/\d+/)[0]).val()
					  ,MEM_NO : $('#MEM_NO1').val()},
				async: false
			})//ajax
			.done(function(data){
				if(data == 1){
				}
			})
			.fail(function(){
			})
		})// 6끝
		
		//7.배송지 수정버튼 > select,update
		//7-1 수정버튼 클릭 > ADD_NO값으로 해당 배송지 select >  출 
		$("[class^='deliUpdate']").on('click', function(e){
			$("#staticBackdrop").modal("hide");
			
			$.ajax({
				url: "addDeliveryUpdate",
				data: {ADD_NO : $('#ADD_NO' + $(e.target).attr("class").match(/\d+/)[0]).val()
					  ,MEM_NO : $('#MEM_NO1').val()},
				async: false
			})//ajax
			.done(function(data){
				if(data != null){
					//alert("여기까지")
					$("#address-no").val(data.ADD_NO);
					$("#address-title").val(data.ADD_NICK);
					$("#address-name").val(data.ADD_RECEIVER);
					$("#address-tel").val(data.ADD_PHONE);
					$("#address-zipcode").val(data.ADD_POST);
					$("#address-front").val(data.ADD_NAME);
					$("#address-detail").val(data.ADD_DETAIL);
					
					
					$("#payAddbtn").attr("id", "payUpdateBtn");
					$("#payUpdateBtn").text("수정");
				}
			})
			.fail(function(){
			})
			$("#staticBackdrop1").modal("show");
		}) // 7끝	
		

		//선택
		$(".button__delivery-choice").on("click", function(){
			
			var idNum = $(this).attr("id").replace("choiceBtn", "");
			var list = $("#addListNo" + idNum);
			$("#delUpdateBtn").text("배송지 수정");
			$("#addReceiver").text(list.find(".addReceiver").text());
			$("#addPost").text(list.find(".addPost").text());
			$("#addName").text(list.find(".addName").text());
			$("#addDetail").text(list.find(".addDetail").text());
			$("#addTel").text(list.find(".addTel").text());
			$("#ADD_NO").val(list.find(".addno").val());
			$("#staticBackdrop").modal("hide");
			$("#hideOrShow").show();
			
			$("#sOrH").hide();
		})
		
	})
	
	//6-2 배송지 수정작업
	$(document).on('click', '#payUpdateBtn', function(){
		var addnick = $('input[name=ADD_NICK]').val(); 
		var receiver = $('input[name=ADD_RECEIVER]').val();
		var phone = $('input[name=ADD_PHONE]').val();
		var post = $('input[name=ADD_POST]').val();
		var addname = $('input[name=ADD_NAME]').val();
		var adddetail = $('input[name=ADD_DETAIL]').val();
		if(addnick == ''){
			alertMsg("AM6",["배송지명"]);
			addnick.focus();
			return false;
		}
		if(receiver == ''){
			alertMsg("AM6",["수령인"]);
			receiver.focus();
			return false;
		}
		if(phone == ''){
			alertMsg("AM6",["연락처"]);
			phone.focus();
			return false;
		}
		if(post == ''){
			alertMsg("AM6",["주소"]);
			post.focus();
			return false;
		}
		if(addname == ''){
			alertMsg("AM6",["주소"]);
			addname.focus();
			return false;
		}
		if(adddetail == ''){
			alertMsg("AM6",["상세주소"]);
			adddetail.focus();
			return false;
		}
		$.ajax({
			url: "addDeliveryUpdate1",
			type:'post',
			data:{
				ADD_NO : $("#address-no").val(),
				MEM_NO : $('#MEM_NO').val(),
				ADD_NICK : addnick,
				ADD_RECEIVER : receiver,
				ADD_PHONE : phone,
				ADD_POST : post,
				ADD_NAME : addname,
				ADD_DETAIL : adddetail
			},
			async: false,
			success:function(result){
				if(result == 1){
					$("#staticBackdrop1").modal("hide");
				}			
			},
			fail:function(){
				//alert("주소수정실패!");
				$("#staticBackdrop1").modal("hide");
			}
		})//ajax
		$("#staticBackdrop1").modal("hide");
		$("#staticBackdrop1").find("input").val("");
		$("#staticBackdrop").modal("show");
	})
	

// 8.새 배송지 추가 저장 취소 관련
	// 새 배송지 추가(입력)저장 
	$(document).on('click', '#payAddbtn', function(){
		$("#staticBackdrop").modal("hide");
		var addnick = $('input[name=ADD_NICK]').val(); 
		var receiver = $('input[name=ADD_RECEIVER]').val();
		var phone = $('input[name=ADD_PHONE]').val().replaceAll("-", "");
		var post = $('input[name=ADD_POST]').val();
		var addname = $('input[name=ADD_NAME]').val();
		var adddetail = $('input[name=ADD_DETAIL]').val();
		if(addnick == ''){
			alertMsg("AM6",["배송지명"]);
			addnick.focus();
			return false;
		}
		if(receiver == ''){
			alertMsg("AM6",["수령인"]);
			receiver.focus();
			return false;
		}
		if(phone == ''){
			alertMsg("AM6",["연락처"]);
			phone.focus();
			return false;
		}
//		checkPhone(phone);
		if(post == ''){
			alertMsg("AM6",["주소"]);
			post.focus();
			return false;
		}
		if(addname == ''){
			alertMsg("AM6",["주소"]);
			addname.focus();
			return false;
		}
		if(adddetail == ''){
			alertMsg("AM6",["상세주소"]);
			adddetail.focus();
			return false;
		}
		$.ajax({
			url:"addDelivery",
			type:'post',
			data:{
				ADD_NO : $("#address-no").val(),
				MEM_NO : $('#MEM_NO').val(),
				ADD_NICK : addnick,
				ADD_RECEIVER : receiver,
				ADD_PHONE : phone,
				ADD_POST : post,
				ADD_NAME : addname,
				ADD_DETAIL : adddetail
			},
			async: false,	
			success:function(result){
				if(result == 1){
					$("#staticBackdrop1").modal("hide");
//					$("#staticBackdrop").modal("show");
				}			
			},
			fail:function(){
				//alert("주소추가실패!");
				$("#staticBackdrop1").modal("hide");
			}	
		})//ajax
		$("#staticBackdrop1").find("input").val("");
		$("#staticBackdrop").modal("show");
	})
	
	//  모달 취소 > 배송리스트 모달
	$("#payCancelbtn").on('click', function(){
		$("#staticBackdrop1").find("input").val("");
		$("#staticBackdrop").modal("show");
	})
	// x버튼 > 배송리스트 모달
	$("#payListXbtn").on('click', function(){
		$("#staticBackdrop1").find("input").val("");
		$("#staticBackdrop").modal("show");
	})
	
	// 수정 버튼
	$(".payUpdateBtn").on("click",function(){
		$("#staticBackdrop1").modal("hide");
		$("#staticBackdrop").modal("show");
	});

	//9.배송 요청사항 이벤트
	$('#selectDel').change(function() {
        //var selectedOptionText = $("#selectDel option:selected").text();
        var textarea = $('.DeliveryPanel__ShippingRequest-sc-10nnk4w-4');
        var selectedOptionIndex =$("#selectDel  option").index($("#selectDel  option:selected"));
		textarea.prop('disabled', true);
		textarea.val('');
		if(selectedOptionIndex == 6 ){
			textarea.prop('disabled', false); // textarea 활성화
		}
		
	    });
	
	
	
})

