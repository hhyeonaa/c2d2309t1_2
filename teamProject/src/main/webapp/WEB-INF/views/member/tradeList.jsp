<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 거래내역</title>
<link href="${pageContext.request.contextPath}/resources/css/member/tradeList.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">


<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
	<div class="rounded-5 shadow">
	<h3 class="title">거래 완료 목록</h3>
	<hr>
	<div class="tab_wrap" style="padding-top: 1%;">
		<label for="tab1" class="on">내가 등록한</label>
			
		<label for="tab2">남이 등록한</label>
	  
		<input type="radio" name="tab" id="tab1">
		<input type="radio" name="tab" id="tab2">  
	</div><!--tab_wrap-->
	<!-- -----------------------------------내가 등록한----------------------------------- -->
	<div class="tab_content tab_content1">
	  <select class="form-select" name="selectMenu" id="selectMenu" style="width: 100px;">
	  	 <option value="MM0">전체</option>
	  	 <option value="MM1">판매</option>
	  	 <option value="MM2">구매</option>
	  	 <option value="MM3">나눔</option>
<!-- 	  	 <option value="MM4">경매</option> -->
	  </select>
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
	  <c:forEach var="myTrade" items="${myTrade}">
		  <div class="col pro">
		  
		  	<input type="hidden" class="proType" value="${myTrade.PRO_TC}">
		    <div class="card h-100">
		      <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${myTrade.PRO_WR}&proDate=${myTrade.PRO_DATE}">
		      	<img src="${pageContext.request.contextPath}/resources/img/uploads/${myTrade.IMG_NAME}" class="card-img-top" 
		      	     alt="${myTrade.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'" style="width: 250px; height: 250px;">
		      </a>	  
		      <div class="card-body">
		      	  <span class="state1">${myTrade.TC_NAME}</span>
				  <span class="state2" id="state_${myTrade.PRO_TSC}">${myTrade.TSC_NAME}</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p class="nameP">${myTrade.PRO_NAME}</p>
				  <h5><b>${myTrade.PRO_PRICE}원</b></h5>
		      </div>
		    </div>
		  </div>
		 </c:forEach>
		 <c:if test="${empty myTrade}">
		 	<div class="row row-cols-1 row-cols-md-1 g-1" id="empMy">거래한 내역이 없습니다.</div>
		 </c:if>
		</div>
	</div><!--tab_content1-->
	<!-- -----------------------------------남이 등록한----------------------------------- -->
	<div class="tab_content tab_content2">
	  <select class="form-select" name="selectMenu2" id="selectMenu2" style="width: 100px;">
	  	 <option value="MM0">전체</option>
	  	 <option value="MM1">판매</option>
	  	 <option value="MM2">구매</option>
	  	 <option value="MM3">나눔</option>
	  	 <option value="MM4">경매</option>
	  </select>
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
	  <c:forEach var="otherTrade" items="${otherTrade}">
		  <div class="col pro2">
		  	<input type="hidden" class="proType2" value="${otherTrade.PRO_TC}">
		    <div class="card h-100">
		      <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${otherTrade.PRO_WR}&proDate=${otherTrade.PRO_DATE}">
		      <img src="${pageContext.request.contextPath}/resources/img/uploads/${otherTrade.IMG_NAME}" class="card-img-top" 
		      	   alt="${otherTrade.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
		      </a>
		      <div class="card-body">
		      	 <span class="state1">${otherTrade.TC_NAME}</span>
				  <span class="state2" id="state_${otherTrade.PRO_TSC}">${otherTrade.TSC_NAME}</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span>
<!-- <!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p class="nameP">${otherTrade.PRO_NAME}</p>
				  <h5><b>${otherTrade.PRO_PRICE}원</b></h5>
		      </div>
		    </div>
		  </div>
		 </c:forEach>
		 <c:if test="${empty otherTrade}">
		 	<div class="row row-cols-1 row-cols-md-1 g-1" id="empOther">거래한 내역이 없습니다.</div>
		 </c:if>
		</div>
	</div><!--tab_content2-->
	
	</div>
</div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/member/tradeList.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>