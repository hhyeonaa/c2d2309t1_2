<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/pay/payment.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">

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
        <h1 class="sech1">결제하기</h1>
        <hr>
            <div class="productInfo">
<!--                 <div class="productImg" style="flex: 1; border:  1px solid black; height: 100%; display: flex; justify-content: center; align-items: center;"> -->
                <div class="productImg">
					<img src="../resources/img/common/따봉도치.jpg" alt="따봉도치 이미지" class="flex-fill">
                </div>
                <div class="productPost">
                    <h4 class="sc-gFqAkR icVCJU">주문상품 정보</h4>
					<span class="productPostTitle" id="payProName">${payProList.PRO_NAME}</span><br>
					<span class="productPrice">${payProList.PRO_PRICE }원</span>
                </div>
            </div>
            <hr class="sechr">
			<div class="d-flex Selecttransaction">
				<div class="form-check flex-fill">
				    <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>
				    <label class="form-check-label" for="radio1">택배거래</label>
				</div>
				<div class="form-check flex-fill">
				    <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
				    <label class="form-check-label" for="radio2">직거래</label>
				</div>
			</div>
	</section>		
            <hr>
    <section class="DefaultPayment__Section-sc-64075s-3 gNplro">        
<!--             <div class="Delivery address" style="border: 1px solid black; width: 100%; height: 500px;"> -->
            <div class="Deliveryaddress">
				<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY DeliveryPanel__DefaultPanel-sc-10nnk4w-1 kowRcQ">            
	            	<h4 class="sc-gFqAkR icVCJU">배송지</h4>
<!-- 	            	<div class="DeliveryInfo" style="border:1px outset gray;"> -->
	            	<div class="DeliveryInfo">
            			<div class="DeliberyPanel hnnRxs">
            				<section class="DeliveryCard fEYMnp">
            				<c:if test="${!empty memAddBasic }">
            				<input id="MEM_NO" type="hidden" value="${memAddBasic.MEM_NO}" name="MEM_NO">
            					<div class="DeliveryCard__Row-sc-1nchvc3-4 hVnXEo">
            						<p class="DeliveryCard_Name jnXOPH kGbUWb">${memAddBasic.MEM_NAME}</p>
            						<span class="DeliveryCard_UpdateAddress gibuM gAweBe1" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="delUpdateBtn">배송지 수정</span>
            					</div>
            					<p class="sc-gFqAkR DeliveryCard__ReceiptAddress-sc-1nchvc3-1 hiEUHX hVvWHg"> 
            						(${memAddBasic.ADD_POST}) ${memAddBasic.ADD_NAME} ${memAddBasic.ADD_DETAIL}
            					</p>	
            					<p class="sc-gFqAkR DeliveryCard__RecipientPhone-sc-1nchvc3-2 hiEUHX hzdZRi">
            						${memAddBasic.MEM_TEL}
            					</p>
            				</c:if>	
            				<c:if test="${empty memAddBasic }">
            					<div class="DeliveryCard__Row-sc-1nchvc3-4 hVnXEo">
            						<p class="DeliveryCard_Name jnXOPH kGbUWb"></p>
            						<span class="DeliveryCard_UpdateAddress gibuM gAweBe1" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="delInsertBtn">배송지 등록</span>
            						<p class="sc-gFqAkR DeliveryCard__ReceiptAddress-sc-1nchvc3-1 hiEUHX hVvWHg">
            							등록된 배송정보가 없습니다 
            						</p>
            					</div>
            				</c:if>
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
							class="DeliveryPanel__ShippingRequest-sc-10nnk4w-4 dRGkpJ"></textarea>
						</div>
					</div>		
	            </div>
			</div>
<!-- 			<hr> -->
<!--             <div class="Payment method and total amount" style="border: 1px solid black; width: 100%; height: 500px;"> -->
            <div class="Payment method and total amount">
            	<div class="PaymentMethodPanel__PaymentMethod-sc-egufas-0 hglvUW">
            		<hr>
            		<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY PaymentMethodPanel__SDefaultPanel-sc-egufas-9 cnEgsB"> 
            			<h4 class="sc-gFqAkR icVCJU">결제수단</h4>
            		</div>
            		<div id="paymentmehod">
						<article class="NormalPayment__PaymentMethods-sc-ymu84t-0 jFQssb">
							<div class="PaymentGrid__Wrapper-sc-96u70s-0 iKNlZe mt-3">
								<div class="PaymentGrid__Row-sc-96u70s-1 wwNXT">
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGridMethod toss nonCheck" value="tosspay" id="tossPay">
											<span class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">토스페이</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGridMethod kakao nonCheck" value="kakaopay" id="kakaoPay">
											<span class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh"value="kakaopay">카카오페이</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGridMethod naver nonCheck" id="naverPay">
											<span class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">네이버페이</span>
										</div>
									</div>	
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGridMethod phonepay nonCheck" id="phonePay">
											<span class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">휴대폰결제</span>
										</div>
									</div>	
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGridMethod samsung nonCheck" id="samsungPay">
											<span class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">삼성페이</span>
										</div>
									</div>
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGridMethod apple nonCheck" id="applePay">
											<span class="sc-gFqAkR PaymentGrid__Payment-sc-96u70s-4 gAweBe dkqnYh">애플페이</span>
										</div>
									</div>										
								</div>
							</div>
						</article>
					</div>
					<hr>
            	</div>
            </div>
         
        
            <div class="Consent and Payment">
            	<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY PricingTablePanel__DefaultPanel-sc-1e9itak-7 Qqlie">
            		<h4 class="sc-gFqAkR icVCJU">결제금액</h4>
            		<div>
            			<div class="Table-sc-178gola-2 PricingTablePanel__Table-sc-1e9itak-4 hKJwfL iwgmOh">
            			
								<div class="Table__Row-sc-178gola-1 PricingTablePanel__Row-sc-1e9itak-6 kxBvfn epdsLL">
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
									상품금액
									</div>
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
									<!--PRO_PRICE  -->
										${payProList.PRO_PRICE }원
									</div>
								</div>
								
								<div class="Table__Row-sc-178gola-1 PricingTablePanel__Row-sc-1e9itak-6 kxBvfn NBdoU">
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
										배송비
									</div>
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
										<span class="PricingTablePanel__Fee-sc-1e9itak-3 kzWuNm">
											+3000원
										</span>
									</div>
								</div>

<!-- 								<div class="Table__Row-sc-178gola-1 FeeRows__Row-sc-zf2uot-4 kxBvfn UYDMx"> -->
<!-- 									<div class="Table__Column-sc-178gola-0 FeeRows__Column-sc-zf2uot-6 jRdbRj eqhFxu"> -->
<!-- 										안전결제 수수료 -->
<!-- 									</div> -->
<!-- 									<div class="Table__Column-sc-178gola-0 FeeRows__Column-sc-zf2uot-6 jRdbRj eqhFxu direction-column"> -->
<!-- 										<span class="FeeRows__Fee-sc-zf2uot-2 gzaALl"> -->
<!-- 										&nbsp;+4,830원 -->
<!-- 										</span> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<div class="Table__Row-sc-178gola-1 PricingTablePanel__Row-sc-1e9itak-6 kxBvfn epdsLL">
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA">
									총 결제금액
									</div>
									<div class="Table__Column-sc-178gola-0 PricingTablePanel__Column-sc-1e9itak-5 jRdbRj IRKRA" id="totalprice">
									${payPrice}<div>원</div>
									</div>
								</div>
							</div>	            			
            			</div>
            		</div>
					<section class="DefaultPayment__Section-sc-64075s-3 eCEzHK">
						<button class="sc-gEvEer kKRlXK bun-ui-button DefaultPayment__SubmitButton-sc-64075s-2 uviPA" id="paymentBtn"
							type="button" color="primary" >결제하기
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
	<div class="modal fade" id="staticBackdrop"
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
								<div class="box__address-add">
									<button type="button" class="button__address-add" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
										<span class="text sprite__mypage--before">새 배송지 추가</span>
									</button>
								</div>
								<div class="addressList">
									<ul id="divAddress" class="deliveryaddress">
<%-- 										<c:forEach var="AA" items="${memAddList }"> --%>
<!-- 										<li class="addressInfo mb-4"> -->
<!-- 											<div class="boxdeliveryaddress"> -->
<!-- 												<div class="boxdeliveryaddressTitle"> -->
<!-- 													<span>집집집</span> -->
<!-- 													<button type="button" class="button__delivery-choice">선택</button> -->
<!-- 												</div> -->
<!-- 												<div class="useraddressinfo"> -->
<!-- 													<div id="useraddressinfo"> -->
<!-- 														<div class="boxdeliveryaddressContent"> -->
<!-- 															<span>(우편번호XXX) 부산광역시 부산진구 부전동 동천로 109 삼한골드게이트 7층</span> -->
<!-- 														</div> -->
<!-- 														<div class="boxdeliveryaddressName"> -->
<!-- 															<span>홍길동</span> -->
<!-- 															<span>010-2222-2222</span> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													<div class="deliverybtn"> -->
<!-- 														<button>수정</button> -->
<!-- 														<button>삭제</button> -->
<!-- 													</div>	 -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</li> -->
<%-- 										</c:forEach>	 --%>
									</ul>
								</div>
							</section>
						</div>
					</div>	
				</div>
			</div>
<!--  	      	<div class="modal-footer">  -->
<!--  	        	<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>  -->
<!--  	        	<button type="submit" class="btn btn-primary" >저장하기</button> -->
<!--  	      	</div>  -->
	      </form>
	    </div>
	  </div>
	</div>
	<!-- Modal -->

	<!-- Modal 배송지 입력 및 수정 모달창-->
	<div class="modal fade" id="staticBackdrop1"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	      <!-- 수정 버튼시 title 배송지 수정 -->
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 추가</h1>
<!-- 	        <h1 class="modal-title fs-5" id="staticBackdropLabel">배송지 수정</h1> -->
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="payListXbtn"></button>
	      </div>
	      <form action="${pageContext.request.contextPath }/pay/payAddress" method="post">
	      	<div class="modal-body">
				<div id="container">
					<div id="content" class="mypage__wrap mypage__new-address">
						<section class="section__order-info">
							<div class="new-address new-address__title" id="newaddress">
								<div class="box__label">
									<label for="address-title" class="text__label">배송지명</label>
								</div>
								<div class="box__input box__text-area" style="display: block;  width: 470px;">
									<input class="input_txt" name="ADD_NICK" id="address-title" maxlength="10" value="">
								</div>
							</div>
							
							<div class="box__form-control new-address new-address__name" id="newaddress">
								<div class="box__label">
									<label for="address-name" class="text__label">받는 분</label>
								</div>
								<div class="box__input box__text-area" style="display: block; width: 470px;">
									<input class="input_txt" name="ADD_RECEIVER" id="address-name" maxlength="10" placeholder="수령인 이름을 입력해주세요">
								</div>
							</div>
							
							<div class="box__form-control new-address new-address__tel" id="newaddress">
								<div class="box__label">
									<label for="address-tel" class="text__label">연락처</label>
								</div>
								<div class="box__input box__text-area" style="display: block;  width: 470px;">
									<input class="input_txt"  name="ADD_PHONE" id="address-tel" maxlength="10" placeholder="연락가능한 연락처를 입력해주세요">
								</div>
							</div>

							<div class="box__form-control new-address new-address__destination">
								<div class="box__label">
									<label for="address-destination" class="sprite__mypage--after text__label text__label-check">주소</label>
								</div>
								<div class="box__input" id="box-zipcode" style="width: 390px;">
									<input type="text" name="ADD_POST" id="address-zipcode" class="input_txt" title="우편번호" readonly="" name="ZipCode">
								</div>
									<button type="button" class="button__address-search" id="address_find">주소찾기</button>
							</div>

								<div class="box__form-control new-address__detail" id="newaddress" style="display: flex; flex-direction: row; justify-content: space-between;">
									<div></div>
									<div class="box__input" style="margin-bottom: 20px; width: 470px;">
										<input type="text" name="ADD_NAME" id="address-front" class="input_txt" title="주소검색결과" readonly="" name="FrontAddress" value="">
									</div>
								</div>
								<div class="box__form-control new-address__detail" id="newaddress" style="display: flex; flex-direction: row; justify-content: space-between;">
									<div></div>
									<div class="box__input box__text-area" style="display: block; width: 470px;">
										<input class="input_txt" name="ADD_DETAIL" id="address-detail" maxlength="50" value="" >
									</div>
								
								</div>
									
						</section>
					</div>
	      		</div>
	 		</div>
		  	<div id="addaddressbtn" class="modal-footer">
		    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="payCancelbtn">취소</button>
		    	<button type="submit" class="btn btn-primary" id="payAddbtn">저장</button>
		  	</div>
	      </form>
	    </div>
	  </div>
	</div>
	<!-- Modal -->



</body>
<script src="${pageContext.request.contextPath}/resources/js/pay/payment.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>