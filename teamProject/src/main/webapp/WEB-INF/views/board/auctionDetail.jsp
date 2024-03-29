<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<style type="text/css">
th {
	font-size: 25px;
}
td{
	font-size: 15px;
}
/* image modal */
.modal {
    display: none;
    z-index: 500;
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.3);
}
.modalBox {
    position: relative;
    text-align: center;
    top : 15%;
    left : 25%;
    width: 50%;
    max-height: 50%;
    position : sticky;
}
.carousel-item > img:hover{
/*     cursor: -webkit-zoom-in; */
    cursor: pointer;
}
/* image modal end */

.btn-lg {
	display: inline-block; /* Align buttons in a row */
	width: 32%; /* Each button takes up one-third of the container's width */
	box-sizing: border-box; /* Include padding and border in the button's total width */
	margin: 0; /* Remove default margins */
	text-align: center; /* Center the text inside buttons */
	/* Adjust padding as needed, but remember it affects the total width if box-sizing is border-box */
}
.center-align {
    text-align: center;
    vertical-align: middle;
    position: relative;
}
.img-innertext{
    position: absolute;
    left: 50%;
    bottom: 0%;
    transform: translate( -50%, -50% );
    color: white;
    background-color : rgb(0,0,0,0.5);
    width: 150px;
}

</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div class="d-flex flex-wrap" style="width: 100%;">
			<div class="pe-2" style="width: 40%;height: 400px;">
		 	 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
   			  	<c:forEach var="img" items="${imgList}" varStatus="status">
			  		<c:if test="${status.index eq 0}">
			  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" class="active" aria-current="true" aria-label="Slide ${status.count }"></button>
			  		</c:if>
			  		<c:if test="${status.index ne 0}">
			  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" aria-label="Slide ${status.count }"></button>
			  		</c:if>
			  	</c:forEach>
			  </div>
			  <div class="carousel-inner">
			  	<c:forEach var="img" items="${imgList}" varStatus="status">
			  		<c:if test="${status.index eq 0}">
			  			<div class="carousel-item active">
					      <img src="${pageContext.request.contextPath}/resources/img/uploads/${img}" class="d-block" style="width: 414px;height: 385px;" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
					    </div>
			  		</c:if>
			  		<c:if test="${status.index ne 0}">
			  			<div class="carousel-item">
					      <img src="${pageContext.request.contextPath}/resources/img/uploads/${img}" class="d-block" style="width: 414px;height: 385px;" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
					    </div>
			  		</c:if>
			  	</c:forEach>
			  </div>
			  	<div class="modal">
				    <div class="modalBox"></div>
				</div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			 </div>
			</div>
		 	<div style="width: 60%; height: 500px;">
		 	<input type="hidden" id="aucNo" value="${resultMap.AUC_NO}">
		 	<input type="hidden" id="aucTc" value="${resultMap.AUC_TC}">
		 	<input type="hidden" id="aucSeller" value="${resultMap.AUC_SELLER}">
		 	<input type="hidden" id="aucDate" value="${resultMap.AUC_DATE}">
		 	<input type="hidden" id="aucEtime" value="${resultMap.AUC_ETIME}">
		 		<table>
		 			<tr><th>${resultMap.AUC_NAME}</th>
		 				<c:if test="${sessionScope.MEM_ID eq resultMap.AUC_SELLER}">
		 					<th><button id="deleteAuction" class="btn btn-secondary">삭제</button></th>
		 				</c:if>
		 			</tr>
		 			<tr><th>현재가</th><th>${resultMap.AUC_BP}원</th></tr>
		 			<tr><th>시작가</th><th>${resultMap.AUC_SP}원(최소 입찰은 ${resultMap.AUC_MINP}원) <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzIiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCAxMzIgNjAiIGZpbGw9Im5vbmUiPgogICAgPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzE5MjhfMzQzNTUpIj4KICAgICAgICA8cmVjdCB3aWR0aD0iMTMyIiBoZWlnaHQ9IjYwIiBmaWxsPSJ3aGl0ZSIgLz4KICAgICAgICA8cGF0aAogICAgICAgICAgICBkPSJNMTMyIDU0LjQ4MTZWNS41MjY1MkMxMzIgMi40NzQzMSAxMjkuNDY0IDAgMTI2LjMzNSAwSDUuNjY0ODdDMi41MzYyNSAwIDAgMi40NzQzMSAwIDUuNTI2NTJWNTQuNDgxNkMtMS42Nzc1OGUtMDYgNTUuOTQ2NSAwLjU5NzEwMSA1Ny4zNTE0IDEuNjU5NzEgNTguMzg2NUMyLjcyMjMzIDU5LjQyMTYgNC4xNjMyMyA2MC4wMDIgNS42NjQ4NyA1OS45OTk4SDEyNi4zMDFDMTI3LjgwOSA2MC4wMTA4IDEyOS4yNTggNTkuNDM0MyAxMzAuMzI4IDU4LjM5ODJDMTMxLjM5OCA1Ny4zNjIyIDEzMiA1NS45NTIzIDEzMiA1NC40ODE2WiIKICAgICAgICAgICAgZmlsbD0iI0Q4MEMxOCIgLz4KICAgICAgICA8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIKICAgICAgICAgICAgZD0iTTMyLjkzMyAyNy44ODU0SDQzLjYzODdWMjcuODg4N0M0My44NCAyNy44ODg3IDQzLjk0MDcgMjguMTQ2IDQzLjc5NDQgMjguMjkxOUwyNC4xNTA3IDQ4LjA4NDdDMjMuOTk5NyA0OC4yMzU1IDIzLjc0OTYgNDguMTEwOSAyMy43NzAxIDQ3Ljg5M0wyNS4yNjU4IDMxLjc1MTNMMTQuODI3NCAzMS44Njc2QzE0LjYyNDUgMzEuODY5MiAxNC41MjIzIDMxLjYxMDMgMTQuNjcwMSAzMS40NjI4TDM0LjI5MDIgMTEuOTE1OEMzNC40NDI4IDExLjc2NSAzNC42OTI5IDExLjg5NDUgMzQuNjY5MyAxMi4xMTI0TDMyLjkzMyAyNy44ODU0Wk03Ni4xOTM5IDEzLjkwOTFIODEuMTExM1Y0Ni4xMTk2SDc2LjE5MzlWMTMuOTA5MVpNNzQuMjY1NiAxNC4wODgyVjQ1LjUxNTFINjkuNDIyN1YzMC41MTkzSDY2LjUwMDRWMjUuNzg0Nkg2OS40MjI3VjE0LjA4ODJINzQuMjY1NlpNNTEuMzUwMiAzOC43MzZWNDMuMTkwMkw2OC4xODAyIDQyLjQ3MjZWMzguMDkyNkw2NS44NjIzIDM4LjE4MzRMNjUuOTI4NSAxOS4xNTRINjcuOTIzNlYxNC42OTk4SDUxLjYzOTlWMTkuMTU0SDUzLjY0MzNMNTMuNzAxMiAzOC42NDUzTDUxLjM1MDIgMzguNzM2Wk01OC40NTMgMTkuMTU0NUg2MS4xMTg3TDYxLjA1MjUgMzguMzY1NEw1OC41MTEgMzguNDY0M0w1OC40NTMgMTkuMTU0NVpNMTEyLjkwMSAxMy45MDkxSDEwNy44NDNWNDYuMTE5NkgxMTIuOTAxVjEzLjkwOTFaTTg4LjA2NTQgNDEuNDk5M0M4Ni4zOTg3IDM5Ljk5MjYgODUuNDgyNiAzNy42OTY3IDg1LjMxNyAzNC42MTE4Qzg1LjMwNTggMzQuMzM0IDg1LjI5NTEgMzQuMDU4NiA4NS4yODQ2IDMzLjc4NjJDODUuMjU2NCAzMy4wNTU2IDg1LjIyOSAzMi4zNDYgODUuMTkyOCAzMS42NjdDODUuMTQzMSAzMC43MzUgODUuMTQzMSAyOS44MDI5IDg1LjE0MzEgMjguODg3M0M4NS4xNDMxIDI3Ljk3MTcgODUuMTUxNCAyNy4wMzk2IDg1LjE5MjggMjYuMTA3NUM4NS4yMzQyIDI1LjE3NTQgODUuMjc1NiAyNC4xOTM5IDg1LjMxNyAyMy4xNzExQzg1LjQ4MjYgMjAuMDg2MSA4Ni40MDk4IDE3Ljc4NDggODguMDY1NCAxNi4yODM1Qzg5Ljg2NzEgMTQuNzIxMiA5Mi4yMDI4IDEzLjkwOTEgOTQuNTg4OSAxNC4wMTUyQzk1LjgyODMgMTQuMDAyNyA5Ny4wNjE1IDE0LjE5MjIgOTguMjM5NiAxNC41NzYxQzk5LjMxMTEgMTQuOTI4OCAxMDAuMjkyIDE1LjUxMTcgMTAxLjExMiAxNi4yODM1QzEwMS45NTIgMTcuMDkyMiAxMDIuNjA2IDE4LjA3MTEgMTAzLjAzMyAxOS4xNTRDMTAzLjUzNiAyMC40MzYzIDEwMy44MTYgMjEuNzk0OCAxMDMuODYxIDIzLjE3MTFDMTAzLjg2OCAyMy4zMjE4IDEwMy44NzYgMjMuNDcxOSAxMDMuODgzIDIzLjYyMTRDMTAzLjkyNiAyNC40ODY3IDEwMy45NjggMjUuMzMwNSAxMDMuOTY4IDI2LjEzMjNWMjguOTI4NUMxMDMuOTY4IDI5LjIzMTggMTAzLjk3MSAyOS41MzY4IDEwMy45NzQgMjkuODQzMVYyOS44NDQyVjI5Ljg0NTNDMTAzLjk3OSAzMC40NjMgMTAzLjk4NSAzMS4wODU3IDEwMy45NjggMzEuNzA4M0MxMDMuOTQzIDMyLjY0MDQgMTAzLjkxIDMzLjYwNTQgMTAzLjg2MSAzNC42MTE4QzEwMy44MiAzNS45OTM3IDEwMy41NCAzNy4zNTgyIDEwMy4wMzMgMzguNjQ1M0MxMDIuNjAxIDM5LjcyMDQgMTAxLjk0NiA0MC42OTI5IDEwMS4xMTIgNDEuNDk5M0MxMDAuMjkyIDQyLjI3MTEgOTkuMzExMSA0Mi44NTQgOTguMjM5NiA0My4yMDY3Qzk3LjA2MSA0My41ODc5IDk1LjgyNzkgNDMuNzc0NSA5NC41ODg5IDQzLjc1OTRDOTIuMjAzOSA0My44Njc4IDg5Ljg2ODQgNDMuMDU4NiA4OC4wNjU0IDQxLjQ5OTNaTTkwLjgwNTggMjEuNjIwMkM5MC41Njg1IDIyLjU2MzIgOTAuNDI3IDIzLjUyNzYgOTAuMzgzNiAyNC40OTg5QzkwLjI4NDMgMjUuOTA5NCA5MC4yMzQ2IDI3LjM2OTQgOTAuMjM0NiAyOC44ODcxQzkwLjIzNDYgMzAuNDA0OCA5MC4yODQzIDMxLjg3MzEgOTAuMzgzNiAzMy4yODM2QzkwLjQyNyAzNC4yNTIxIDkwLjU2ODQgMzUuMjEzOSA5MC44MDU4IDM2LjE1NDFDOTAuOTY0NyAzNi44MTU3IDkxLjI0NTQgMzcuNDQyMSA5MS42MzM3IDM4LjAwMTdDOTEuOTU3OSAzOC40NDQxIDkyLjM5NTMgMzguNzkxNiA5Mi45MDAzIDM5LjAwODFDOTMuNDI1MyAzOS4yMjE4IDkzLjk4ODkgMzkuMzI1NiA5NC41NTYgMzkuMzEzM0M5NS4xMjI4IDM5LjMyMzYgOTUuNjg2IDM5LjIxOTcgOTYuMjExNiAzOS4wMDgxQzk2LjcxNjYgMzguNzkxNiA5Ny4xNTQgMzguNDQ0MSA5Ny40NzgyIDM4LjAwMTdDOTcuODY2NiAzNy40NDIyIDk4LjE0NzMgMzYuODE1NyA5OC4zMDYxIDM2LjE1NDFDOTguNTQ2NyAzNS4yMTQyIDk4LjY5MDkgMzQuMjUyNSA5OC43MzY2IDMzLjI4MzZDOTguODI3NiAzMS44NzMxIDk4Ljg3NzMgMzAuNDIxMyA5OC44NzczIDI4LjkxMTlDOTguODc3MyAyNy40MDI0IDk4LjgyNzYgMjUuOTI1OSA5OC43MzY2IDI0LjQ5ODlDOTguNjkwOCAyMy41MjczIDk4LjU0NjYgMjIuNTYyOCA5OC4zMDYxIDIxLjYyMDJDOTguMTQ3MyAyMC45NjExIDk3Ljg2NjUgMjAuMzM3MyA5Ny40NzgyIDE5Ljc4MDdDOTcuMTU2NSAxOS4zMzYxIDk2LjcxODMgMTguOTg4IDk2LjIxMTYgMTguNzc0NEM5NS42ODYgMTguNTYyNyA5NS4xMjI4IDE4LjQ1ODkgOTQuNTU2IDE4LjQ2OTJDOTMuOTg4OSAxOC40NTY4IDkzLjQyNTMgMTguNTYwNyA5Mi45MDAzIDE4Ljc3NDRDOTIuMzkzNiAxOC45ODggOTEuOTU1NCAxOS4zMzYxIDkxLjYzMzcgMTkuNzgwN0M5MS4yNDU0IDIwLjMzNzMgOTAuOTY0NiAyMC45NjExIDkwLjgwNTggMjEuNjIwMloiCiAgICAgICAgICAgIGZpbGw9IndoaXRlIiAvPgogICAgPC9nPgogICAgPGRlZnM+CiAgICAgICAgPGNsaXBQYXRoIGlkPSJjbGlwMF8xOTI4XzM0MzU1Ij4KICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjEzMiIgaGVpZ2h0PSI2MCIgZmlsbD0id2hpdGUiIC8+CiAgICAgICAgPC9jbGlwUGF0aD4KICAgIDwvZGVmcz4KPC9zdmc+"
		 									style="width: 50px; height: 30px;"></th></tr>
		 		</table>
		 	<hr>
		 		<table class="table"><!--  table-borderless -->
		 			<tr>
			 			<td><img src="${pageContext.request.contextPath}/resources/img/common/heart.png"> ${resultMap.LIKES_COUNT}</td>
			 			<td><i class="bi bi-eye"></i>${resultMap.AUC_HITS}</td>
			 			<fmt:parseDate var="parsedDate" value="${resultMap.AUC_DATE}" pattern="yyyyMMddHHmmss"/>
			 			<fmt:parseDate var="parsedDate2" value="${resultMap.AUC_ETIME}" pattern="yyyyMMddHHmmss"/>
			 			<td><i class="bi bi-calendar3"></i><fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss "/>${newFormattedDateString }</td>
			 			<td><img src="${pageContext.request.contextPath}/resources/img/board/report.png">신고하기</td>
		 			</tr>
		 			<tr><td colspan="4"><i class="bi bi-stopwatch"></i><span id="timer">타이머 로딩 중...</span></td></tr>
		 			<tr>
		 				<td>상품상태:</td>
		 				<c:set var="statusValue" value="${resultMap.AUC_STATUS_CODE}" />
		 				<c:choose>
						    <c:when test="${fn:contains(statusValue, '(')}">
						        <td>${fn:substringBefore(statusValue, '(')}</td>
						    </c:when>
						    <c:otherwise>
						        <td>${statusValue}</td>
						    </c:otherwise>
						</c:choose>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>카테고리:</td>
		 				<td><a href="#">${resultMap.AUC_CATE_CODE}</a></td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>배송비:</td>
		 				<td>배송비포함</td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>거래지역:</td>
		 				<td colspan="2"><i class="bi bi-building-check"></i>${resultMap.ADD_NAME}</td>
		 				<td></td>
		 			</tr>	
		 			<tr>
		 				<td colspan="4">
		 					<c:if test="${empty sessionScope.MEM_ID }">
		 						<button class="btn btn-lg border" id="noUserBtn">찜
		 							<ion-icon name="heart-outline"/>
	 							</button>
	 						</c:if>	
	 						<c:if test="${not empty sessionScope.MEM_ID}">
			 					<button class="btn btn-lg border" id="likeBtn">찜
			 						<span id="likNo" style="display: none;">${resultMap.LIK_NO}</span>
			 						
									    <ion-icon id="yesLike" name="heart-sharp" style="color:#E21818;" 
									              ${resultMap.LIK_NO ne '0' ? '' : 'hidden="hidden"'}></ion-icon>
									    <ion-icon id="noLike" name="heart-outline" 
									              ${resultMap.LIK_NO eq '0' ? '' : 'hidden="hidden"'}></ion-icon> 
			 					</button>
		 					</c:if>
		 					<button class="btn btn-warning btn-lg">경매기록</button>
		 					<c:if test="${resultMap.AUC_TSC eq 'TM1'}">
		 					<button class="btn btn-success btn-lg">입찰하기</button>
		 					</c:if>
		 				</td>
<!-- 			 			<td><button class="btn btn-danger btn-lg">찜</button></td> -->
<!-- 			 			<td><button class="btn btn-warning btn-lg">채팅</button></td> -->
<!-- 			 			<td><button class="btn btn-success btn-lg">바로구매</button></td> -->
<!-- 			 			<td></td> -->
		 			</tr>
		 			<tr><td colspan="4">
		 				<div class="input-group mb-3">
		 					<c:if test="${resultMap.AUC_TSC eq 'TM1'}">
		 					<input class="form-control" type="text" value="" placeholder="직접 가격을 입력하세요.">
		 					<button class="btn btn-outline-secondary" type="button">직접입력</button>
		 					</c:if>
		 				</div>
		 				</td></tr>
		 		</table>
		 	</div>
		 	<div style="width: 70%; height: auto;">
		 		<table class="table">
					<tr><td colspan="7">연관상품</td><tr>
					<tr>
						<c:forEach var="img" items="${relatedImg}">
						<td><a href="${pageContext.request.contextPath}/board/auctionDetail?aucSeller=${img.AUC_SELLER}&aucDate=${img.AUC_DATE}"><img src="${pageContext.request.contextPath}/resources/img/uploads/${img.IMG_NAME}" style="width: 134px; height: 134px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></a></td>
						</c:forEach>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
<%-- 						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td> --%>
					<tr>									 		
		 		</table>
		 	</div>
		 	<div style="width: 70%; height: auto;">
		 		<table class="table">
		 			<tr><td colspan="6">상품 상세 정보</td><tr>
		 			<tr><td colspan="6"><textarea rows="10" cols="90" readonly>${resultMap.AUC_CONTENT}</textarea></td></tr>
		 			<tr style="text-align: center;">
<!-- 		 				<td colspan="3">거래지역: 전국</td> -->
<!-- 		 				<td colspan="3">카테고리: <a href="#">자켓/점퍼</a></td> -->
		 			</tr>
		 		</table>
		 		<table class="table">
		 			<tr><td colspan="6">입찰자 정보</td><tr>
		 			<tr>
		 				<td colspan="1">입찰자 ID</td>
		 				<td colspan="2">입찰일자</td>
		 				<td colspan="2">입찰가격</td>
		 				<td colspan="1">수량</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치5</td>
		 				<td colspan="2">2024/02/14 11:11:15</td>
		 				<td colspan="2">15000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치4</td>
		 				<td colspan="2">2024/02/14 11:11:14</td>
		 				<td colspan="2">14000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치3</td>
		 				<td colspan="2">2024/02/14 11:11:13</td>
		 				<td colspan="2">13000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치2</td>
		 				<td colspan="2">2024/02/14 11:11:12</td>
		 				<td colspan="2">12000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치1</td>
		 				<td colspan="2">2024/02/14 11:11:11</td>
		 				<td colspan="2">11000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 		</table>
				 <c:if test="${resultMap.AUC_SELLER eq sessionScope.MEM_ID}">
				 	<c:if test="${resultMap.AUC_TSC ne 'TM3'}">
			 		<div class="d-grid gap-2">
					  <button class="btn btn-secondary" type="button" id="updateAuction">글 수정</button>
					</div>
					</c:if>
				</c:if>
		 	</div>
		 	<div style="width: 30%; height: auto;">
		 		<table class="table" style="text-align: center;">
		 			<tr><td colspan="2">게시자 정보</td></tr>
		 			<tr>
		 				<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 60px; height: 60px;"></td>
		 				<td>${resultMap.AUC_SELLER}<br>(<small>상품 133</small>)<br>(<small>신뢰도 9.9</small>)</td>
		 			</tr>
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>		 	
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>
		 			<tr>
		 				<td colspan="2"><button class="btn btn-outline-secondary" style="width: 40%;">상품 더보기</button></td>
		 			</tr>
<!-- 		 			<tr> -->
<!-- 		 				<td colspan="2">게시자 후기</td> -->
<!-- 		 			</tr> -->
<!-- 		 			<tr> -->
<%-- 		 				<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 50px; height: 50px;"><br>홍길동</td> --%>
<!-- 		 				<td>포장이 깔끔해요.상품 설명과 실제 상품이 동일해요.배송이 빨라요.<br>2023.12.26</td> -->
<!-- 		 			</tr> -->
<!-- 		 			<tr> -->
<%-- 		 				<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 50px; height: 50px;"><br>홍길동</td> --%>
<!-- 		 				<td>포장이 깔끔해요.상품 설명과 실제 상품이 동일해요.배송이 빨라요.<br>2023.12.26</td> -->
<!-- 		 			</tr> -->
<!-- 		 			<tr><td colspan="2"><button class="btn btn-outline-secondary">후기 더보기</button></td></tr> -->
<!-- 		 			<tr> -->
<!-- 		 				<td colspan="2"> -->
<!-- 		 					<button class="btn btn-warning" style="width: 40%;">신청자 확인</button> -->
<!-- 		 					<button class="btn btn-success" style="width: 40%;">나눔신청</button> -->
<!-- 		 				</td> -->
<!-- 		 			</tr>		 					 -->
		 		</table>
		 	</div>
		</div>

	</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/auctionDetail.js"></script>
<script type="text/javascript">
</script>
<jsp:include page="../template/Footer.jsp"/>
</html>