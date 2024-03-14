<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 찜한상품</title>
<link href="${pageContext.request.contextPath}/resources/css/member/list.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">

<style>
#PRO_STATE_TM1 {
	background-color: #0AC304;
	color: white;
}

#PRO_STATE_TM2 {
	background-color: #EFB100;
	color: white;
}

#PRO_STATE_TM3 {
	background-color: #E30000;
	color: white;
}
</style>

</head>

<jsp:include page="../template/header.jsp"/>

<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
	<div class="rounded-5 shadow" id="likeDiv">
	
		<h3 class="title">찜한 상품</h3>
		<hr>
		<div class="tab_wrap mb-3" style="padding-top: 1%;">
			<c:forEach var="menu" items="${menuList}" >
				<c:if test="${menu.CO_NO eq '1'}">
					<label for="tab${menu.CO_NO}" class="on">${menu.CODE}</label>
				</c:if>
				<c:if test="${menu.CO_NO ne '1'}">
					<label for="tab${menu.CO_NO}">${menu.CODE}</label>
				</c:if>
		  	</c:forEach>
		</div>
		<select class="form-select" name="selectMenu" id="selectMenu" style="width: 150px; margin-left: 3%; margin-top: 2%;">
			<c:forEach var="tsc" items="${tscList}">
				<option value="${tsc.CO_TYPE}${tsc.CO_NO}">${tsc.CODE}</option>
			</c:forEach>
		</select>
		
		<!-- -----------------------------------판매 목록----------------------------------- -->
		<div class="tab_content" id="listDiv">
			<div class="row row-cols-1 row-cols-md-4 g-4" id="listData">
			
			<c:forEach var="list" items="${likeList}">
			  <div class="col">
			    <div class="card h-100">
			      <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${list.PRO_WR}&proDate=${list.PRO_DATE}"><img src="${pageContext.request.contextPath}/resources/img/uploads/${list.IMG_NAME}" class="card-img-top" alt="${list.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'"></a>
			      <div class="card-body">
				      <span class="state1">${list.TC_NAME}</span>
				      <span class="state2" id="PRO_STATE_${list.PRO_TSC}">${list.TSC_NAME}</span>
				      <span style="float: right; font-size: 23px;">
					      <a id=likeBtn class="profile_btn">
					      	<input type="text" id="LIK_NO" value="${list.LIK_NO}" hidden="">
			 		     	<ion-icon id="yesLike" name="heart-sharp" style="color:#E21818;"></ion-icon> 
					      </a>
				      </span>
				      <p>${list.PRO_NAME}</p>
					  <h5><b>${list.PRO_PRICE}원</b></h5>
			      </div>
			    </div>
			  </div>
			<c:if test="${empty likeList}">
				<div class="row row-cols-1 row-cols-md-1 g-1" id="emptySell">등록된 상품이 없습니다.</div>
			</c:if>
			</c:forEach>
			
			</div>
		</div>
		
	</div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/member/likeList.js"></script>

<jsp:include page="../template/Footer.jsp"/>
</html>