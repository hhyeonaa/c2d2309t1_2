<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5" style="padding-top: 100px;"><b>신고 목록</b></h4></div>
    </div>
	<div class="btn-wrapper">
		<select name="perPage" id="setPerpage" class="plSelect">
			<option selected disabled hidden>선택</option>
			<option value="-1">기본값</option>
			<option value="0">한 페이지에 보기</option>
			<option value="1">1개 씩 보기</option>
			<option value="5">5개 씩 보기</option>
			<option value="10">10개 씩 보기</option>
			<option value="20">20개 씩 보기</option>
			<option value="30">30개 씩 보기</option>
			<option value="50">50개 씩 보기</option>
			<option value="100">100개 씩 보기</option>
		</select>
	</div>	
		<div id="grid"></div>
		
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/admin/member_report.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>