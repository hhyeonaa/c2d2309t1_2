<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
h2 {text-align: center;}

.hnnRxs {
    position: relative;
}

.fEYMnp {
    position: relative;
    padding: 20px;
    border: 1px solid rgb(229, 229, 229);
    border-radius: 6px;
}

.hVnXEo {
    display: flex;
}

.jnXOPH {
    color: rgb(25, 25, 25);
}

.kGbUWb {
    font-weight: 700;
    font-size: 20px;
    line-height: 145%;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.gibuM {
    position: absolute;
    top: 20px;
    right: 20px;
    margin-left: auto;
    color: rgb(76, 76, 76);
    text-decoration: underline;
    text-underline-offset: 2px;
    cursor: pointer;
}
.gAweBe1 {
    font-weight: 700;
    font-size: 14px;
    line-height: 120%;
}
.hVvWHg {
    color: rgb(76, 76, 76);
}
.hiEUHX {
    font-weight: 500;
    font-size: 18px;
    line-height: 150%;
}
.hzdZRi {
    color: rgb(76, 76, 76);
}

.kowRcQ {
    padding: 0px;
    font-size: 21px;
    font-weight: bold;
}
.evSWSY {
    display: flex;
    flex-direction: column;
    gap: 16px;
}
.kowRcQ > div div + div {
    margin-top: 10px;
}

.hnnRxs {
    position: relative;
}

.fZgYbu {
    width: 100%;
    height: 70px;
    border: 1px solid rgb(229, 229, 229);
    border-radius: 6px;
    font-size: 1rem;
    padding: 0px 20px;
}

input, textarea {
/*     border: none; */
    outline: none;
    appearance: none;
}
.hnnRxs aside {
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}
.hnnRxs aside button {
    font-size: 14px;
    font-weight: bold;
    color: rgb(0, 165, 135);
    text-decoration: underline;
}
button {
    padding: 0px;
    border: none;
    background: none;
}
button {
    appearance: auto;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-variant-alternates: ;
    font-variant-position: ;
/*     font-weight: ; */
    font-stretch: ;
/*     font-size: ; */
/*     font-family: ; */
    font-optical-sizing: ;
    font-kerning: ;
    font-feature-settings: ;
    font-variation-settings: ;
    text-rendering: auto;
/*     color: buttontext; */
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
/*     box-sizing: border-box; */
/*     background-color: buttonface; */
    margin: 0em;
    padding-block: 1px;
    padding-inline: 6px;
/*     border-width: 2px; */
/*     border-style: outset; */
/*     border-color: buttonborder; */
/*     border-image: initial; */
}
.hnnRxs aside svg {
    transform: translate(3px, -4px);
}
svg[Attributes Style] {
    width: 30;
    height: 20;
    fill: rgb(204, 204, 204);
}
svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
}
.hnnRxs aside button {
    font-size: 14px;
    font-weight: bold;
    color: rgb(0, 165, 135);
    text-decoration: underline;
}
.kowRcQ > div div + div {
    margin-top: 10px;
}
.dRGkpJ {
    display: block;
    width: 100%;
    padding: 1rem 20px;
    border: none;
    box-sizing: border-box;
    outline: 0px;
    border-radius: 6px;
    background: rgb(250, 250, 250);
    font-size: 1rem;
    resize: none;
}
/*결제수단 css  */
.cEbALs {
    position: relative;
    padding-top: 20px;
}
.cnEgsB {
/*     padding: 0px; */
    font-size: 21px;
    font-weight: bold;
}
.exSHIf .NormalPayment__PaymentMethods-sc-ymu84t-0 {
    margin-top: 6px;
}
.iKNlZe {
    display: flex;
    flex-direction: column;
/*     align-content: space-between; */
    margin: -4px;
}
.cnEgsB {
/*     padding: 0px; */
    font-size: 21px;
    font-weight: bold;
}
.wwNXT {
    display: flex;
    flex-direction: row;
}
.bwWbat {
    width: calc(33.3333%);
}

.bwWbat :hover{
	cursor: pointer;
}
/* .kvEuJF :hover { */
/*     cursor: pointer; */
/* } */
/* .cGqPmK :hover{ */
/* 	cursor: pointer; */
/* } */
.kvEuJF {
    position: relative;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
/*     margin: 4px; */
    margin: 15px;
    height: 70px;
    background: rgb(255, 255, 255);
    border-radius: 6px;
    border: 1px solid rgb(25, 25, 25);
}

.cGqPmK {
    position: relative;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
/*     margin: 4px; */
    margin: 15px;
    height: 70px;
    background: rgb(255, 255, 255);
    border: 1.6px solid rgb(229, 229, 229);
    border-radius: 6px;
}
.gAweBe {
    font-weight: 600;
    font-size: 20px;
    line-height: 350%;
}
</style>

</head>
<jsp:include page="../template/header.jsp"/>
<div style="display: flex; justify-content: center; align-items: center;">
    <form>
        <div class="row g-4 mt-12" style="display: flex; flex-wrap: wrap;" id="main">
        <h1 style="text-align: center;">결제하기</h1>
        <hr>
            <div class="productInfo" style="border: none; width: 100%; height: 100px; display: flex; flex-wrap: wrap;  ">
<!--                 <div class="productImg" style="flex: 1; border:  1px solid black; height: 100%; display: flex; justify-content: center; align-items: center;"> -->
                <div class="productImg" style="flex: 1; border: none; height: 100%; display: flex; justify-content: center; align-items: center;">
					<img src="resources/img/common/따봉도치.jpg" alt="따봉도치 이미지" class="flex-fill" style="max-width: 100%; max-height: 100%;">
                </div>
                <div class="productPost" style="flex: 9; border:  none; height: 100%; margin-left: 20px;">
                    <h4>주문상품 정보</h4>
					<span class="productPostTitle">따봉도치 팜ㅍㅍㅍ</span><br>
					<span class="productPrice">100,000원</span>
                </div>
            </div>
            <hr style="margin-bottom: 1px;">
			<div class="form-check" style="flex: 1; display: flex; justify-content: center; align-items: center;">
			    <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>
			    <label class="form-check-label" for="radio1" style="font-size: 20px;">택배거래</label>
			</div>
			<div class="form-check" style="flex: 1; display: flex; justify-content: center; align-items: center;">
			    <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
			    <label class="form-check-label" for="radio2" style="font-size: 20px;">직거래</label>
			</div>
            <hr>
<!--             <div class="Delivery address" style="border: 1px solid black; width: 100%; height: 500px;"> -->
            <div class="Delivery address" style="border: none; width: 100%; height: 350px; margin-top: 1px;">
				<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY DeliveryPanel__DefaultPanel-sc-10nnk4w-1 kowRcQ">            
	            	<h4 class="mt-2">배송 정보</h4>
<!-- 	            	<div class="DeliveryInfo" style="border:1px outset gray;"> -->
	            	<div class="DeliveryInfo" style="border: none;">
            			<div class="DeliberyPanel hnnRxs">
            				<section class="DeliveryCard fEYMnp">
            					<div class="DeliveryCard__Row-sc-1nchvc3-4 hVnXEo">
            						<p class="DeliveryCard_Name jnXOPH kGbUWb">홍길동</p>
            						<!--저장된 배송정보 없을 시 등록노출  -->
            						<span class="DeliveryCard_UpdateAddress gibuM gAweBe1">등록</span>
            						<!--저장된 배송정보 있을 때 변경노출  -->
<!--             						<span class="DeliveryCard_ChangeAddress">변경</span> -->
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
            				<div value="직접입력" class="DeliveryPanel__FormGroup-sc-10nnk4w-3 hnnRxs">
            					<input readonly="" placeholder="배송 요청사항 (선택)" class="DeliveryPanel__Input-sc-10nnk4w-2 fZgYbu" value="직접입력">
								<aside>
									<button type="button">
										<svg width="30" height="20" xmlns="http://www.w3.org/2000/svg"
											fill="#cccccc" viewBox="0 0 20 20">
											<path d="M.59 5.087a.999.999 0 011.074.166L10 12.663l8.336-7.41a1 1 0 111.328 1.494l-9 8a.999.999 0 01-1.328 0l-9-8a.999.999 0 01.254-1.66z"
												 fill="#cccccc" fill-rule="evenodd">
											</path>
										</svg>
									</button>
								</aside>
							</div>
            			</div>
						<div class="DeliveryPanel__FormGroup-sc-10nnk4w-3 hnnRxs mt-3">
							<textarea maxlength="50" placeholder="배송 요청사항을 입력해주세요" class="DeliveryPanel__ShippingRequest-sc-10nnk4w-4 dRGkpJ" style="height: 70px !important;"></textarea>
						</div>
						<hr>
					</div>		
	            </div>
			</div>
<!--             <div class="Payment method and total amount" style="border: 1px solid black; width: 100%; height: 500px;"> -->
            <div class="Payment method and total amount" style="border: none; width: 100%; height: 200px; margin-top: 50px;">
            	<div class="PaymentMethodPanel__PaymentMethod-sc-egufas-0 hglvUW">
            		<div class="PanelLayout__Layout-sc-7wp27q-0 evSWSY PaymentMethodPanel__SDefaultPanel-sc-egufas-9 cnEgsB"> 
            			<h4>결제수단</h4>
            		</div>
            		<div>
						<article class="NormalPayment__PaymentMethods-sc-ymu84t-0 jFQssb">
							<div class="PaymentGrid__Wrapper-sc-96u70s-0 iKNlZe mt-3">
								<div class="PaymentGrid__Row-sc-96u70s-1 wwNXT">
									<div class="PaymentGrid__Column-sc-96u70s-2 bwWbat">
										<div class="PaymentGrid__Card-sc-96u70s-3 kvEuJF">
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
            	</div>
            </div>
            <div class="Consent and Payment" style="border: 1px solid black; width: 100%; height: 500px; margin-top: 50px;">
            
            </div>
  		   
        </div>
    </form>
</div>
<jsp:include page="../template/Footer.jsp"/>
</html>