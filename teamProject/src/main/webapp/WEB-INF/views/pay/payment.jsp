<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/pay/payment.css" rel="stylesheet">


</head>
<jsp:include page="../template/header.jsp"/>
<body class="d-flex flex-column min-vh-100">
<div style="display: flex; justify-content: center; align-items: center;">
<!--???  -->
<form>

<!--??  -->
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="border: 1px solid black; width: 100%; height: auto;">
				
    <section class="DefaultPayment__Section-sc-64075s-3 eCEzHK pb-0">
        <h1 style="text-align: center;">결제하기</h1>
        <hr>
            <div class="productInfo" style="border: none; width: 100%; height: 100px; display: flex; flex-wrap: wrap;  ">
<!--                 <div class="productImg" style="flex: 1; border:  1px solid black; height: 100%; display: flex; justify-content: center; align-items: center;"> -->
                <div class="productImg" style="flex: 1; border: none; height: 100%; display: flex; justify-content: center; align-items: center;">
					<img src="../resources/img/common/따봉도치.jpg" alt="따봉도치 이미지" class="flex-fill" style="max-width: 100%; max-height: 100%;">
                </div>
                <div class="productPost" style="flex: 9; border:  none; height: 100%; margin-left: 20px;">
                    <h4 class="sc-gFqAkR icVCJU">주문상품 정보</h4>
					<span class="productPostTitle">따봉도치 팜ㅍㅍㅍ</span><br>
					<span class="productPrice">100,000원</span>
                </div>
            </div>
            <hr style="margin-bottom: 1px;">
			<div class="d-flex" style="margin-top: 15px;">
				<div class="form-check flex-fill" style="flex: 1; display: flex; justify-content: center; align-items: center;">
				    <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>
				    <label class="form-check-label" for="radio1" style="font-size: 20px;">택배거래</label>
				</div>
				<div class="form-check flex-fill" style="flex: 1; display: flex; justify-content: center; align-items: center;">
				    <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
				    <label class="form-check-label" for="radio2" style="font-size: 20px;">직거래</label>
				</div>
			</div>
	</section>		
            <hr>
    <section class="DefaultPayment__Section-sc-64075s-3 gNplro">        
<!--             <div class="Delivery address" style="border: 1px solid black; width: 100%; height: 500px;"> -->
            <div class="Delivery address" style="border: none; width: 100%; height: 350px; margin-top: 1px;">
				<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY DeliveryPanel__DefaultPanel-sc-10nnk4w-1 kowRcQ">            
	            	<h4 class="sc-gFqAkR icVCJU">배송지</h4>
<!-- 	            	<div class="DeliveryInfo" style="border:1px outset gray;"> -->
	            	<div class="DeliveryInfo" style="border: none;">
            			<div class="DeliberyPanel hnnRxs">
            				<section class="DeliveryCard fEYMnp">
            					<div class="DeliveryCard__Row-sc-1nchvc3-4 hVnXEo">
            						<p class="DeliveryCard_Name jnXOPH kGbUWb">홍길동</p>
            						<!--저장된 배송정보 없을 시 배송지 등록노출  -->
            						<span class="DeliveryCard_UpdateAddress gibuM gAweBe1" data-bs-toggle="modal" data-bs-target="#staticBackdrop">배송지 수정</span>
            						<!--저장된 배송정보 있을 때 배송지 변경노출  -->
									<!-- <span class="DeliveryCard_ChangeAddress">변경</span> -->
            					</div>
            					<p class="sc-gFqAkR DeliveryCard__ReceiptAddress-sc-1nchvc3-1 hiEUHX hVvWHg"> 
            						(47246) 부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 7층
            					</p>	
            					<p class="sc-gFqAkR DeliveryCard__RecipientPhone-sc-1nchvc3-2 hiEUHX hzdZRi">
            						051-803-0909
            					</p>
            				</section>
            			</div>
            			<div class="Delivery Request mt-3">
            			<select class="form-select form-select-lg mb-3" aria-label="Large select example">
							<option value="0" selected>배송시 요청사항을 선택해 주세요.</option>
							<option value="1">직접 수령하겠습니다.</option>
							<option value="2">배송 전 연락바랍니다.</option>
							<option value="3">부재 시 경비실에 맡겨주세요.</option>
							<option value="4">부재 시 문 앞에 놓아주세요.</option>
							<option value="5">부재 시 택배함에 넣어주세요.</option>
							<option value="6">직접 입력</option>
						</select>
            			</div>
						<div class="DeliveryPanel__FormGroup-sc-10nnk4w-3 hnnRxs mt-3">
							<textarea maxlength="50" placeholder="배송 요청사항을 입력해주세요" 
							class="DeliveryPanel__ShippingRequest-sc-10nnk4w-4 dRGkpJ" style="height: 125px !important; font-size: 20px;"></textarea>
						</div>
					</div>		
	            </div>
			</div>
<!-- 			<hr> -->
<!--             <div class="Payment method and total amount" style="border: 1px solid black; width: 100%; height: 500px;"> -->
            <div class="Payment method and total amount" style="border: none; width: 100%; height: 200px; margin-top: 20px;">
            	<div class="PaymentMethodPanel__PaymentMethod-sc-egufas-0 hglvUW">
            		<hr>
            		<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY PaymentMethodPanel__SDefaultPanel-sc-egufas-9 cnEgsB"> 
            			<h4 class="sc-gFqAkR icVCJU">결제수단</h4>
            		</div>
            		<div>
						<article class="NormalPayment__PaymentMethods-sc-ymu84t-0 jFQssb">
							<div class="PaymentGrid__Wrapper-sc-96u70s-0 iKNlZe mt-3">
								<div class="PaymentGrid__Row-sc-96u70s-1 wwNXT">
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
<!-- 										<div class="PaymentGrid__Card-sc-96u70s-3 kvEuJF"> //클릭시 class kvEuJF -->
<!-- 										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK"> //미 클릭시 cGqPmK-->
										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK">
											<span
												class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">토스페이</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK">
											<span
												class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">카카오페이</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK">
											<span
												class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">네이버페이</span>
										</div>
									</div>
								</div>
								<div class="PaymentGrid__Row-sc-96u70s-1 wwNXT">
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK">
											<span
												class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">휴대폰결제</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK">
											<span
												class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">삼성페이</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGrid__Card-sc-96u70s-3 cGqPmK">
											<span
												class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">애플페이</span>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>
					<hr>
            	</div>
            </div>
         
        
            <div class="Consent and Payment" style="border: none; width: 100%; height: 500px; margin-top: 100px;">
            	<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY PricingTablePanel__DefaultPanel-sc-1e9itak-7 Qqlie">
            		<h4 class="sc-gFqAkR icVCJU">결제금액</h4>
            		<div>
            			<div class="Table-sc-178gola-2 PricingTablePanel__Table-sc-1e9itak-4 hKJwfL iwgmOh">
            			
								<div class="Table__Row-sc-178gola-1 PricingTablePanel__Row-sc-1e9itak-6 kxBvfn epdsLL">
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
									상품금액
									</div>
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
										135,000원
									</div>
								</div>
								
								<div class="Table__Row-sc-178gola-1 PricingTablePanel__Row-sc-1e9itak-6 kxBvfn NBdoU">
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
										배송비
									</div>
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
										<span class="PricingTablePanel__Fee-sc-1e9itak-3 kzWuNm">
											+3,000원
										</span>
									</div>
								</div>

								<div class="Table__Row-sc-178gola-1 FeeRows__Row-sc-zf2uot-4 kxBvfn UYDMx">
									<div class="Table__Column-sc-178gola-0 FeeRows__Column-sc-zf2uot-6 jRdbRj eqhFxu">
										안전결제 수수료
									</div>
									<div class="Table__Column-sc-178gola-0 FeeRows__Column-sc-zf2uot-6 jRdbRj eqhFxu direction-column">
										<span class="FeeRows__Fee-sc-zf2uot-2 gzaALl" style="margin-top: 2px;">
										&nbsp;+4,830원
										</span>
									</div>
								</div>
								<div class="Table__Row-sc-178gola-1 PricingTablePanel__Row-sc-1e9itak-6 kxBvfn epdsLL">
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
									총 결제금액
									</div>
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA" style="font-size: 25px;">
										142,830원
									</div>
								</div>
							</div>	            			
            			</div>
            		</div>
					<section class="DefaultPayment__Section-sc-64075s-3 eCEzHK">
						<button class="sc-gEvEer kKRlXK bun-ui-button DefaultPayment__SubmitButton-sc-64075s-2 uviPA" 
							type="submit" color="primary">결제하기
						</button>
					</section>
			</div>
    </section>    
            </div>
        </div>
    </form>
</div>
<!-- 	</div> -->
<!-- </div> -->

	<!-- Modal 배송지 목록 모달창-->
	<div class="modal fade" id="staticBackdrop" style="--bs-modal-width: 600px !important;"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 정보</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form>
	      	<div class="modal-body">
	      		
				<div id="container">
					<div id="content" class="mypage__wrap mypage__address-list">
						<div id="content" class="userDeliveryList">
							<section class="section__order-info">
								<div class="box__address-add" style="width: 100% !important;">
									<button type="button" class="button__address-add" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
										<span class="text sprite__mypage--before">새 배송지 추가</span>
									</button>
								</div>
								<div class="addressList" style="width:100%;">
									<ul id="divAddress" class="deliveryaddress" style="padding-left:0; ">
										<li class="addressInfo mb-4" style="border: 1px solid #e0e0e0;">
											<div class="boxdeliveryaddress" style="padding: 15px;">
												<div class="boxdeliveryaddressTitle" style="margin-bottom: 20px; font-size: 25px; font-weight: bold; display: flex; justify-content: space-between;">
													<span>배송지이름(XXX)</span>
													<button type="button" class="button__delivery-choice">선택</button>
												</div>
												<div style="display: flex;flex-direction: row;">
													<div style="width: 84%;">
														<div class="boxdeliveryaddressContent" style="margin-bottom: 5px; font-size: 15px;">
															<span>(우편번호XXX) 부산광역시 부산진구 부전동 동천로 109 삼한골드게이트 7층</span>
														</div>
														<div class="boxdeliveryaddressName" style="font-size: 15px;">
															<span>홍길동</span>
															<span>010-2222-2222</span>
														</div>
													</div>
													<div style="display: flex;flex-direction: row;">
														<button style="display: inline-flex;align-items: flex-end;">수정</button>
														<button style="display: inline-flex;align-items: flex-end;">삭제</button>
													</div>	
												</div>
											</div>
										</li>
										<li class="addressInfo mb-4" style="border: 1px solid #e0e0e0;">
											<div class="boxdeliveryaddress" style="padding: 15px;">
												<div class="boxdeliveryaddressTitle" style="margin-bottom: 20px; font-size: 25px; font-weight: bold; display: flex; justify-content: space-between;">
													<span>배송지이름(XXX)</span>
													<button type="button" class="button__delivery-choice">선택</button>
												</div>
												<div style="display: flex;flex-direction: row;">
													<div style="width: 84%;">
														<div class="boxdeliveryaddressContent" style="margin-bottom: 5px; font-size: 15px;">
															<span>(우편번호XXX) 부산광역시 부산진구 부전동 동천로 109 삼한골드게이트 7층</span>
														</div>
														<div class="boxdeliveryaddressName" style="font-size: 15px;">
															<span>홍길동</span>
															<span>010-2222-2222</span>
														</div>
													</div>
													<div style="display: flex;flex-direction: row;">
														<button style="display: inline-flex;align-items: flex-end;">수정</button>
														<button style="display: inline-flex;align-items: flex-end;">삭제</button>
													</div>	
												</div>
											</div>
										</li>
										<li class="addressInfo mb-4" style="border: 1px solid #e0e0e0;">
											<div class="boxdeliveryaddress" style="padding: 15px;">
												<div class="boxdeliveryaddressTitle" style="margin-bottom: 20px; font-size: 25px; font-weight: bold; display: flex; justify-content: space-between;">
													<span>배송지이름(XXX)</span>
													<button type="button" class="button__delivery-choice">선택</button>
												</div>
												<div style="display: flex;flex-direction: row;">
													<div style="width: 84%;">
														<div class="boxdeliveryaddressContent" style="margin-bottom: 5px; font-size: 15px;">
															<span>(우편번호XXX) 부산광역시 부산진구 부전동 동천로 109 삼한골드게이트 7층</span>
														</div>
														<div class="boxdeliveryaddressName" style="font-size: 15px;">
															<span>홍길동</span>
															<span>010-2222-2222</span>
														</div>
													</div>
													<div style="display: flex;flex-direction: row;">
														<button style="display: inline-flex;align-items: flex-end;">수정</button>
														<button style="display: inline-flex;align-items: flex-end;">삭제</button>
													</div>	
												</div>
											</div>
										</li>
									</ul>
								</div>
							</section>
						</div>
					</div>	
				</div>
			</div>
<!-- 	      	<div class="modal-footer"> -->
<!-- 	        	<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
<!-- 	        	<button type="submit" class="btn btn-primary" >저장하기</button> -->
<!-- 	      	</div> -->

	      </form>
	    </div>
	  </div>
	</div>
	<!-- Modal -->

	<!-- Modal 배송지 입력 및 수정 모달창-->
	<div class="modal fade" id="staticBackdrop1" style="--bs-modal-width: 600px !important;"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	      <!-- 수정 버튼시 title 배송지 수정 -->
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 추가</h1>
<!-- 	        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 수정</h1> -->
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form>
				

	 
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        	<button type="submit" class="btn btn-primary" >저장</button>
	      	</div>

	      </form>
	    </div>
	  </div>
	</div>
	<!-- Modal -->



</body>
<script>
// 스크립트 시작
$(()=>{
	
	
	
})

</script>
<jsp:include page="../template/Footer.jsp"/>
</html>