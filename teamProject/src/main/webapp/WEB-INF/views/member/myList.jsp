<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 내상품관리</title>
<link href="${pageContext.request.contextPath}/resources/css/paging.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
<script>
$(()=>{
	myListAuction("div" , 5, 0);
})
</script>
<link href="${pageContext.request.contextPath}/resources/css/member/list.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">


<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
	<div class="rounded-5 shadow">
	<h3 class="title">내 상품 관리</h3>
	<hr>
	<div class="tab_wrap" style="padding-top: 1%;">
		<label for="tab1" class="on">판매목록</label>
		<label for="tab2">구매목록</label>
		<label for="tab3">나눔목록</label>
		<label for="tab4">경매목록</label>
	  
	  	<input type="radio" name="tab" id="tab1">
		<input type="radio" name="tab" id="tab2">
		<input type="radio" name="tab" id="tab3">  
		<input type="radio" name="tab" id="tab4">  
	</div><!--tab_wrap-->
	
	<!-- -----------------------------------판매 목록----------------------------------- -->
	<div class="tab_content tab_content1">
		<div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
		<c:forEach var="myListSell" items="${myListSell}">
		  <div class="col">
		    <div class="card h-100">
		      <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${myListSell.PRO_WR}&proDate=${myListSell.PRO_DATE}">
		      <img src="${pageContext.request.contextPath}/resources/img/uploads/${myListSell.IMG_NAME}" class="card-img-top" 
		      	   alt="${myListSell.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'" style="width: 250px; height: 250px;">
		      </a>
		      <div class="card-body">
		      	<a href="${pageContext.request.contextPath}/boardDetail?proWr=${map['PRO_WR']}&proDate=${map['PRO_DATE']}">
			      	<span class="state1">${myListSell.TC_NAME}</span>
			      	<span class="state2">${myListSell.TSC_NAME}</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>${myListSell.PRO_NAME}</p>
				  <h5><b>${myListSell.PRO_PRICE}원</b></h5>
				</a>
		      </div>
		    </div>
		  </div>
		  </c:forEach>
		  <c:if test="${empty myListSell}">
		 	<div class="row row-cols-1 row-cols-md-1 g-1" id="emptySell">등록된 상품이 없습니다.</div>
		 </c:if>
		</div>
	</div><!--tab_content1-->
	
	<!-- -----------------------------------구매 목록----------------------------------- -->
	<div class="tab_content tab_content2">
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
	  <c:forEach var="myListBuy" items="${myListBuy}">
		  <div class="col">
		    <div class="card h-100">
		      <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${myListBuy.PRO_WR}&proDate=${myListBuy.PRO_DATE}">
		      <img src="${pageContext.request.contextPath}/resources/img/uploads/${myListBuy.IMG_NAME}" class="card-img-top" 
		      	   alt="${myListBuy.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'" style="width: 250px; height: 250px;">
		      </a>
		      <div class="card-body">
			      <span class="state1">${myListBuy.TC_NAME}</span>
			      <span class="state2">${myListBuy.TSC_NAME}</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>${myListBuy.PRO_NAME}</p>
				  <h5><b>${myListBuy.PRO_PRICE}원</b></h5>
		      </div>
		    </div>
		  </div>
		 </c:forEach>
		 <c:if test="${empty myListBuy}">
		 	<div class="row row-cols-1 row-cols-md-1 g-1" id="emptyBuy">등록된 상품이 없습니다.</div>
		 </c:if>
		</div>
		<div class="demo">
	    <nav class="pagination-outer"  aria-label="Page navigation">
	        <ul class="pagination" id="pagination"></ul>
	    </nav>
		</div> 
	</div><!--tab_content2-->
	<!-- -----------------------------------나눔 목록----------------------------------- -->
	<div class="tab_content tab_content3">
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
	  <c:forEach var="myListShare" items="${myListShare}">
		  <div class="col">
		    <div class="card h-100">
		      <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${myListShare.PRO_WR}&proDate=${myListShare.PRO_DATE}">
		      <img src="${pageContext.request.contextPath}/resources/img/uploads/${myListShare.IMG_NAME}" class="card-img-top" 
		      	   alt="${myListShare.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'" style="width: 250px; height: 250px;">
		      </a>
		      <div class="card-body">
			      <span class="state1">${myListShare.TC_NAME}</span>
			      <span class="state2">${myListShare.TSC_NAME}</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>${myListShare.PRO_NAME}</p>
				  <h5><b>${myListShare.PRO_PRICE}원</b></h5>
		      </div>
		    </div>
		  </div>
		</c:forEach>
		<c:if test="${empty myListShare}">
		 	<div class="row row-cols-1 row-cols-md-1 g-1" id="emptyShare">등록된 상품이 없습니다.</div>
		 </c:if>
		</div>
	</div><!--tab_content3-->
	
	<!-- -----------------------------------경매 목록----------------------------------- -->
	<div class="tab_content tab_content4">
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%; height: 100%;">
	  <c:forEach var="myListAuction" items="${myListAuction}">
		  <div class="col">
		   <div class="card h-100">
		     <a href="${pageContext.request.contextPath}/board/auctionDetail?aucSeller=${myListAuction.AUC_SELLER}&aucDate=${myListAuction.AUC_DATE}">
		     	<img src="${pageContext.request.contextPath}/resources/img/uploads/${myListAuction.IMG_NAME}" class="card-img-top" 
		      	   alt="${myListAuction.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'" style="width: 250px; height: 250px;">
		     </a>
		     <div class="card-body" style="padding-top: 10px; height: 130px;" >
		      <span class="state1">${myListAuction.TC_NAME}</span>
		      <span class="state2">${myListAuction.TSC_NAME}</span>
		      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
		      <p>${myListAuction.AUC_NAME}</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가: </small><b>${myListAuction.AUC_BP}원</b></h6>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">즉구가: </small><b>${myListAuction.AUC_INP}원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10명</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;"> ${myListAuction.AUC_ETIME}</span><br>
		     </div>
		   </div>
		 </div>
		</c:forEach>
		<c:if test="${empty myListAuction}">
		 	<div class="row row-cols-1 row-cols-md-1 g-1" id="emptyAuction">등록된 상품이 없습니다.</div>
		 </c:if>
		</div>
	</div><!--tab_content4-->
	
	</div>
</div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/member/tradeList.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>