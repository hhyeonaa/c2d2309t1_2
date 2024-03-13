<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet">
<title>여기 다 모여 있다, '다모임'</title>
</head>
<jsp:include page="template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
	
	
		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>판매중</h3>
					<button aria-label="전체 판매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/saleBoard'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
					<!--  -->
					<c:forEach var="sale" items="${saleList}">
						<div class="col" id="product">
						  <div class="card h-100" onclick="location.href ='${pageContext.request.contextPath}/board/boardDetail?proWr=${sale.PRO_WR}&proDate=${sale.PRO_DATE}'">
						    <img src="${pageContext.request.contextPath}/resources/img/uploads/${sale.IMG_NAME}" class="card-img-top" alt="${sale.IMG_NAME}" alt="..."
						    			onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'">
						    <div class="card-body">
						     <span class="state1">${sale.PRO_TC_CODE}</span>
						     <span class="state2">${sale.PRO_TSC_CODE}</span><br>
						     <p>${sale.PRO_NAME}</p>
						  <h5><b>${sale.PRO_PRICE}원</b></h5>
						    </div>
						  </div>
						</div>
					</c:forEach>	
					<!--  -->		
					</div>	
				</div>			  
			</article>
		</div>
		
		
		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>나눔중</h3>
					<button aria-label="전체 나눔 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/divideBoard'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
					<!--  -->
					<c:forEach var="divList" items="${divList}">
						<div class="col" id="product">
						  <div class="card h-100" onclick="location.href ='${pageContext.request.contextPath}/board/boardDetail?proWr=${divList.PRO_WR}&proDate=${divList.PRO_DATE}'">
						    <img src="${pageContext.request.contextPath}/resources/img/uploads/${divList.IMG_NAME}" class="card-img-top" alt="${divList.IMG_NAME}" alt="..."
						    			onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'">
						    <div class="card-body">
						     <span class="state1">${divList.PRO_TC_CODE}</span>
						     <span class="state3">${divList.PRO_TSC_CODE}</span><br>
						     <p>${divList.PRO_NAME}</p>
						  <h5><b>${divList.PRO_PRICE}원</b></h5>
						    </div>
						  </div>
						</div>
					</c:forEach>
					<!--  -->
					</div>	
				</div>			  
			</article>
		</div>
		

		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>구매중</h3>
					<button aria-label="전체 구매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/buyBoard'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
					<!--  -->
					<c:forEach var="buy" items="${buyList}">
						<div class="col" id="product">
						  <div class="card h-100" onclick="location.href ='${pageContext.request.contextPath}/board/boardDetail?proWr=${buy.PRO_WR}&proDate=${buy.PRO_DATE}'">
						    <img src="${pageContext.request.contextPath}/resources/img/uploads/${buy.IMG_NAME}" class="card-img-top" alt="${buy.IMG_NAME}" alt="..."
						    			onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'">
						    <div class="card-body">
						     <span class="state1">${buy.PRO_TC_CODE}</span>
						     <span class="state4">${buy.PRO_TSC_CODE}</span><br>
						     <p>${buy.PRO_NAME}</p>
						  <h5><b>${buy.PRO_PRICE}원</b></h5>
						    </div>
						  </div>
						</div>
					</c:forEach>
					<!--  -->
					</div>	
				</div>			  
			</article>
		</div>		
		
		
		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>경매중</h3>
					<button aria-label="전체 경매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/auction'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
					<!--  -->
					<c:forEach var="auc" items="${aucList}">
						<div class="col" id="product">
						  <div class="card h-100" onclick="location.href ='${pageContext.request.contextPath}/board/boardDetail?proWr=${auc.AUC_SELLER}&proDate=${auc.AUC_DATE}'">
						    <img src="${pageContext.request.contextPath}/resources/img/uploads/${auc.IMG_NAME}" class="card-img-top" alt="${auc.IMG_NAME}" alt="..."
						    			onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'">
						    <div class="card-body">
						     <span class="state1">${auc.PRO_TC_CODE}</span>
						     <span class="state5">${auc.PRO_TSC_CODE}</span><br>
						     <p>${auc.AUC_NAME}</p>
						  <h5><b>${auc.AUC_SP}원</b></h5>
						    </div>
						  </div>
						</div>
					</c:forEach>
					<!--  -->
					</div>	
				</div>			  
			</article>
		</div>
		
		
		
	</div>
</div>
</body>

<jsp:include page="template/Footer.jsp"/>
</html>