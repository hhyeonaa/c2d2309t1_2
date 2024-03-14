<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>

<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
	    <div class="row align-items-center">
	        <div><h4 class="card-title mb-5"  style="padding-top: 100px;"><b>게시판 목록</b></h4></div>
		    	<div align="center">
			        <select id="boardCategory" class="form-select">
						<option value="MM1" selected>판매</option>
						<option value="MM2">구매</option>
						<option value="MM3">나눔</option>
						<option value="MM4">경매</option>
					</select>
				</div>
    	</div>
		<div id="grid"></div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/admin/board_content.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>

