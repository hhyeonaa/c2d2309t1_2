<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/Template/header.jsp"%> 
<head>
    <meta charset="utf-8">
    <title>결제 완료</title>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/pay/payment_success.css" rel="stylesheet">
</head>

	<!-- main은 속성 값은 왠만하면 건들지x -->
	<main style="background:white; display: flex; justify-content: center; align-items: center; text-align: center; margin-top: 100px; padding:100px 0 50px 0; ">
		
		<!-- 예시div style속성 값 조절해서 사용! -->
		<div class="mainContainer">
			<div class="paddingBox">
				<div class="textBox">
				<span class="material-icons" style="font-size: 50px; color: #9ced92;">check_circle</span>
					<p class="textStyle1">예약 완료</p>
					<p style="margin: 5px">고객님의 예약이 확정되었어요.</p>
					<p style="margin: 0">아래의 예약 정보를 확인해 주세요.</p>
				</div>
				
				<div class="infoBox">
					<div class="infoBoxStyle1">
						<span class="infoTit">예약 번호</span>
						<span class="infocnt">${resInfo.MERCHANT_UID}</span>
					</div>
					<div class="infoBoxStyle1">
						<span class="infoTit">예약 날짜</span>
						<span class="infocnt">${resInfo.RES_DATE}</span>
					</div>
					<div class="infoBoxStyle1">
						<span class="infoTit">예약 내용</span>
						<span class="infocnt">${resInfo.STORE_NAME} (${resInfo.SEAT_NAME})</span>
					</div>
					<div class="infoBoxStyle1">
						<span class="infoTit">결제 금액</span>
						<span class="infocnt">${resInfo.PAID_AMOUNT} 원</span>
					</div>
				</div>
				
				<div class="btnBox">
					<button class="btn goMypage" onclick="location.href ='mypage.cu'">예약 확인</button>
					<button class="btn goMain" style="margin-left: 20px;" onclick="location.href ='main.ma'">메인 페이지로</button>
				</div>
			</div>
		</div>
		
	</main>
<%@ include file="/Template/footer.jsp"%>
</html> 