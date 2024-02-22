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
			<div style="border: 1px solid black; width: 100%; height: 1000px;">
<!-- 			    <section class="DefaultPayment__Section-sc-64075s-3 eCEzHK pb-0"> -->
<!-- 			        <h1 class="sech1">결제완료</h1> -->
<!-- 			        <hr> -->
<!-- 			            <div class="productInfo"> -->
<!-- 			                <div class="productImg"> -->
<!-- 								<img src="../resources/img/common/따봉도치.jpg" alt="따봉도치 이미지" class="flex-fill"> -->
<!-- 			                </div> -->
<!-- 			                <div class="productPost"> -->
<!-- 			                    <h4 class="sc-gFqAkR icVCJU">주문상품 정보</h4> -->
<!-- 								<span class="productPostTitle">따봉도치 팜ㅍㅍㅍ</span><br> -->
<!-- 								<span class="productPrice">100,000원</span> -->
<!-- 			                </div> -->
<!-- 			            </div> -->
<!-- 			    	<div> -->
									    	
<!-- 			    	</div>         -->
<!-- 				</section>		 -->

				<div class="mainContainer">
					<div class="paddingBox">
						<div class="textBox">
							<h1 class="completepaytitle">결제 완료</h1>
							<div class="textBox_box">
								<p class="textStyle1">결제 상품 정보</p>
<!-- 								<p style="margin: 5px">고객님의 예약이 확정되었어요.</p> -->
<!-- 								<p style="margin: 0">아래의 예약 정보를 확인해 주세요.</p> -->
							</div>
							<div class="productImg">
								<img src="../resources/img/common/따봉도치.jpg" alt="따봉도치 이미지">
							</div>
						</div>
						
						<div class="infoBox">
							<div class="infoBoxStyle1">
								<span class="infoTit">상품 제목</span>
								<span class="infocnt">따봉도치 ㅍㅍㅍㅍㅍ</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 번호</span>
								<span class="infocnt">XXXXXXXXX</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 날짜</span>
								<span class="infocnt">2024.02.15</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 내용</span>
								<span class="infocnt">택배거래 ???페이</span>
							</div>
							<div class="infoBoxStyle1">
								<span class="infoTit">결제 금액</span>
								<span class="infocnt">100,000 원</span>
							</div>
						</div>
						
						<div class="btnBox">
							<button class="btn goMypage" onclick="location.href ='mypage.cu'">결제 확인</button>
							<button class="btn goMain" style="margin-left: 20px;" onclick="location.href ='main.ma'">메인 페이지로</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</form>
</div>



</body>
<script src="${pageContext.request.contextPath}/resources/js/pay/completepay.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>