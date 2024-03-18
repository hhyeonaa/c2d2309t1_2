<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/pay/completepay.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">

</head>
<jsp:include page="../template/header.jsp"/>

<body class="d-flex flex-column min-vh-100">
<div style="display: flex; justify-content: center; align-items: center;">
	<form>
		<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
			<div style="border: 0px solid black; width: 100%; height: 1000px;" class="shadow">

				<div class="mainContainer">
					<div class="paddingBox">
						<div class="textBox">
							<h1 class="completepaytitle">결제 완료</h1>
							<div class="textBox_box">
								<p class="textStyle1">결제 상품 정보</p>
							</div>
							<div class="productImg">
								<img src="${pageContext.request.contextPath}/resources/img/uploads/${completePay.IMG_NAME}" alt="${completePay.IMG_NAME}"
									 onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
							</div>
						</div>
						
						<div class="infoBox">
							<div class="infoBoxStyle1">
								<span class="infoTit">상품 제목</span>
								<span class="infocnt">${completePay.NAME}</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 번호</span>
								<span class="infocnt">${completePay.MERCHANT_UID}</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 날짜</span>
								<span class="infocnt">${completePay.PAY_TIME}</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 금액</span>
								<span class="infocnt">${completePay.PAID_AMOUNT}원</span>
							</div>
						</div>
						
						<div class="btnBox">
							<button  type="button" class="btn goMypage">결제 내역</button>
							<button  type="button" class="btn goMain" style="margin-left: 20px;">메인 페이지</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</form>
</div>
</body>
<script>
$(()=>{
	$('.goMain').on('click',function(){
		window.location.href='/' + window.location.pathname.split("/")[1];
	})
	$('.goMypage').on('click', function(){
		window.location.href='/' + window.location.pathname.split("/")[1] + '/member/trading'
	})
})
</script>
<script src="${pageContext.request.contextPath}/resources/js/pay/completepay.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>