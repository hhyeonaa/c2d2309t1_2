<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트관리-카테고리 관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link href="${pageContext.request.contextPath}/resources/css/admin/category.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container">


	<input type="hidden" value="${CODE}" id="selectListItem">
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>카테고리 목록 리스트</b></h4></div>
    </div>
	<div style="display: flex; justify-content: flex-start; padding-bottom: 80px;" id="selectCodeBtn">
		<c:forEach var="items" items="${keyList}">
			<c:if test="${items.key != '메뉴항목'}">
				<button type="button" class="btn btn-outline-primary">${items.key}</button>
			</c:if>
		</c:forEach>
	</div>

   	<div class="btn-wrapper">
<!-- 		<select name="perPage" id="setPerpage"> -->
<!-- 			<option selected disabled hidden="">선택</option> -->
<!-- 			<option value="-1">기본값</option> -->
<!-- 			<option value="0">한 페이지에 보기</option> -->
<!-- 			<option value="1">1개 씩 보기</option> -->
<!-- 			<option value="5">5개 씩 보기</option> -->
<!-- 			<option value="10">10개 씩 보기</option> -->
<!-- 			<option value="20">20개 씩 보기</option> -->
<!-- 			<option value="30">30개 씩 보기</option> -->
<!-- 			<option value="50">50개 씩 보기</option> -->
<!-- 			<option value="100">100개 씩 보기</option> -->
<!-- 		</select> -->
		<button id="saveBtn" class="btn btn-outline-danger">저장</button>
		<button id="resetBtn" class="btn btn-outline-danger">새로고침</button>
	    <div id="excel"></div>
    	<div id="grid"></div>
	</div>
    

</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/category.js"></script>
</html>