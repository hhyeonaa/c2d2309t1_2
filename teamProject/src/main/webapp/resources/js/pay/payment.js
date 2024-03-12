// 1-1 거래방식 선택 +  배송료 , 최종금액 관련함수
function selectMethod(){
	$("input[name='optradio']").change(function () {
	var deliprice = parseInt($('.kzWuNm').text().trim().match(/\d+/)[0]);
	var prodprice = parseInt($('#prodprice').text().trim().match(/\d+/)[0]);
		if($("input[name='optradio']:checked").val() == 'option2'){
			$('.Deliveryaddress').hide();
			$('.NBdoU').hide();//배송료 +3000
			$("#allPrice").text(prodprice);
			return;
		}
		$("#allPrice").text(prodprice + deliprice);
		$('.Deliveryaddress').show();
		$('.NBdoU').show();
	})
}

// 4. 결제 api
var IMP = window.IMP;
var requestPay = (pgId) => {
	IMP.init("imp34662564"); //가맹점 식별코드
//       
 		//판매자 구매자 정보 가져오기 ajax
 		debugger;
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
					var today = new Date();   
			        var hours = today.getHours(); // 시
			        var minutes = today.getMinutes();  // 분
			        var seconds = today.getSeconds();  // 초
			        var milliseconds = today.getMilliseconds();
			        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
			        
					var price = parseInt($("#totalprice").text().replace("원","").trim());//결제금액   
			        var productname = $("#payProName").text().trim();//제품name

			        //var msg = $('#selectDel option:selected').text();
			        
			        debugger;
			       	IMP.request_pay({
						pg: pgId, 
			  			merchant_uid: makeMerchantUid, // 상점에서 생성한 고유 주문번호 //MERCHANT_UID
			  			name: productname, //상품명 // PRO_NAME
				 		amount: 100, // 결제금액 price //PAID_AMOUNT
			  			buyer_name: data.BUYNAME, //결제자 이름 
			  			buyer_tel: data.BUYTEL, //결제자 연락처 //BUYER_TEL
			  			buyer_addr: $("#addName").text() + $("#addDetail").text(), // 배송주소 //BUYER_ADDR
			  			buyer_postcode: $("#addPost").text() // 배송우편번호 //BUYER_POSTCODE
					}, function (rsp) { // callback 로직
			  			if(rsp.success){ //결제 성공
							debugger;
							rsp["SELLER_NO"] = data.SELLER;
							rsp["BUYER_NO"] = $('#MEM_NO').val();
							rsp["PRO_NO"] = $('#PRO_NO').val();
							rsp["PAY_MSG"] = $('#selectDel option:selected').text();
							//**
							//var newData = {};
							//newData.imp_uid = rsp.imp_uid
							debugger;
							console.log(rsp);
							 $.ajax({
								 type: "post",
								 url: "paySuccess",
								 data: rsp
							 })//ajax
							 
						  	}else{
								  debugger;
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
		debugger;
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
	debugger;
	$.ajax({
		url: "paymentPro"
	})
	.done(function(data){
		debugger;
		if(data.length == 0){
			debugger;
			$("#hideOrShow").hide();
			return;
		}
		debugger;
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
	
	
// 1. 거래방법 택배거래,직거래 선택 시 배송지입력 노출 및 미노출 	
selectMethod();
		
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
		if(addnick == ''){
			alert("배송지명을 입력하세요.")
			addnick.focus();
			return false;
		}
		if(receiver == ''){
			alert("수령인을 입력하세요.")
			receiver.focus();
			return false;
		}
		if(phone == ''){
			alert("연락처을 입력하세요.")
			phone.focus();
			return false;
		}
		if(post == ''){
			alert("주소 입력하세요.")
			post.focus();
			return false;
		}
		if(addname == ''){
			alert("주소 입력하세요.")
			addname.focus();
			return false;
		}
		if(adddetail == ''){
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
		requestPay(pgId);
		if($('.kGbUWb').text()==""){
			alert('배송주소를 등록해주세요');
			return false;
		}
		//
		
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
			debugger;
			$.ajax({
				url: "addDeliveryDelete",
				data: {ADD_NO : $('#ADD_NO' + $(e.target).attr("class").match(/\d+/)[0]).val()
					  ,MEM_NO : $('#MEM_NO1').val()},
				async: false
			})//ajax
			.done(function(data){
				if(data == 1){
					debugger;
					alert("delete여기까지")
				}
			})
			.fail(function(){
				debugger;
			})
		})// 6끝
		
		//7.배송지 수정버튼 > select,update
		//7-1 수정버튼 클릭 > ADD_NO값으로 해당 배송지 select >  출 
		$("[class^='deliUpdate']").on('click', function(e){
			$("#staticBackdrop").modal("hide");
			debugger;
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
					
					debugger;
					
					$("#payAddbtn").attr("id", "payUpdateBtn");
					$("#payUpdateBtn").text("수정");
				}
			})
			.fail(function(){
				debugger;
			})
			$("#staticBackdrop1").modal("show");
		}) // 7끝	
		

		//선택
		$(".button__delivery-choice").on("click", function(){
			debugger;
			
			var idNum = $(this).attr("id").replace("choiceBtn", "");
			var list = $("#addListNo" + idNum);
			debugger;
			$("#delUpdateBtn").text("배송지 수정");
			$("#addReceiver").text(list.find(".addReceiver").text());
			$("#addPost").text(list.find(".addPost").text());
			$("#addName").text(list.find(".addName").text());
			$("#addDetail").text(list.find(".addDetail").text());
			$("#addTel").text(list.find(".addTel").text());
			$("#ADD_NO").val(list.find(".addno").val());
			debugger;
			$("#staticBackdrop").modal("hide");
			$("#hideOrShow").show();
			
			$("#sOrH").hide();
		})
		
	})
	
	//6-2 배송지 수정작업
	$(document).on('click', '#payUpdateBtn', function(){
		debugger;
		$.ajax({
			url: "addDeliveryUpdate1",
			type:'post',
			data:{
				ADD_NO : $("#address-no").val(),
				ADD_NICK : $("#address-title").val(),
				ADD_RECEIVER : $("#address-name").val(),
				ADD_PHONE : $("#address-tel").val(),
				ADD_POST : $("#address-zipcode").val(),
				ADD_NAME : $("#address-front").val(),
				ADD_DETAIL : $("#address-detail").val(),
				MEM_NO : $('#MEM_NO').val()
			},
			async: false,
			success:function(result){
				debugger;
				if(result == 1){
					$("#staticBackdrop1").modal("hide");
				}			
			},
			fail:function(){
				debugger;
				//alert("주소수정실패!");
				$("#staticBackdrop1").modal("hide");
			}
		})//ajax
		debugger;
		$("#staticBackdrop1").modal("hide");
		$("#staticBackdrop1").find("input").val("");
		$("#staticBackdrop").modal("show");
	})
	

// 8.새 배송지 추가 저장 취소 관련
	// 새 배송지 추가(입력)저장 
	$(document).on('click', '#payAddbtn', function(){
		$("#staticBackdrop").modal("hide");
		debugger;
		$.ajax({
			url:"addDelivery",
			type:'post',
			data:{
				ADD_NO : $("#address-no").val(),
				ADD_NICK : $("#address-title").val(),
				ADD_RECEIVER : $("#address-name").val(),
				ADD_PHONE : $("#address-tel").val(),
				ADD_POST : $("#address-zipcode").val(),
				ADD_NAME : $("#address-front").val(),
				ADD_DETAIL : $("#address-detail").val(),
				MEM_NO : $('#MEM_NO').val()
			},
			async: false,	
			success:function(result){
				debugger;
				if(result == 1){
					$("#staticBackdrop1").modal("hide");
//					$("#staticBackdrop").modal("show");
				}			
			},
			fail:function(){
				debugger;
				//alert("주소추가실패!");
				$("#staticBackdrop1").modal("hide");
			}	
		})//ajax
		$("#staticBackdrop1").find("input").val("");
		$("#staticBackdrop").modal("show");
	})
	
	//  모달 취소 > 배송리스트 모달
	$("#payCancelbtn").on('click', function(){
		debugger;
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

	
	
	
	
})

