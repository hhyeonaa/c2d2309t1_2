<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 진행중인거래</title>
<link href="${pageContext.request.contextPath}/resources/css/member/trading.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
    <div class="rounded-5 shadow">
        <h3 class="title">진행 중인 거래<small> (결제 완료)</small></h3>
        <hr>
        <div class="tab_content tab_content1">
            <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
                <c:forEach var="trading" items="${trading}">
                    <div class="col pro">
                        <input type="hidden" class="proType" value="${trading.PRO_TC}">
                        <div class="card h-100 d-flex flex-column justify-content-between">
                            <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${trading.PRO_WR}&proDate=${trading.PRO_DATE}">
                                <img src="${pageContext.request.contextPath}/resources/img/uploads/${trading.IMG_NAME}" class="card-img-top" 
                                    alt="${trading.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'" style="width: 250px; height: 250px;">
                                <!-- card-body 시작 -->
                                <div class="card-body">
                                    <span class="state1" style="font-size: 14px !important;">결제번호 : <b>${trading.MERCHANT_UID}</b></span>
                                    <span class="state2" id="state_${trading.PRO_TSC}" style="float: right;">${trading.TSC_NAME}</span>
                                    <hr>
                                    <p class="nameP"><b>${trading.NAME}</b></p>
                                    <span class="state3">결제금액 : <big>${trading.PAID_AMOUNT}원</big></span> <br>
                                    <span class="state3">결제일자 : ${trading.PAY_TIME}</span><br>
                                </div>
                                <!-- card-body 끝 -->
                            </a>     
				            <form id="transactionForm" action="changeState" method="post">
				                <input type="hidden" name="PRO_NO" value="${trading.PRO_NO}">
				                <input type="hidden" name="status" value="completed">
				                <input type="hidden" name="MEM_ID" value="<%= session.getAttribute("MEM_ID") %>">
				                <div class="text-center mb-3">
				                    <!-- 구매확정 버튼 -->
				                    <button type="button" id="confirmButton" class="btn btn-outline-success btn-block btn-sm btn-smaller">구매확정</button> 
				                </div>
				            </form>
                        </div>
                    </div>
                 </c:forEach>
                 <c:if test="${empty trading}">
                     <div class="row row-cols-1 row-cols-md-1 g-1" id="empTrading">진행 중인 거래가 없습니다.</div>
                 </c:if>
             </div>
         </div><!--tab_content1-->
     </div>
 </div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/member/trading.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>