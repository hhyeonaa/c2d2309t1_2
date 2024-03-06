<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 항목</title>
<style>
	.insert:hover {
    	background-color: rgb(42, 188, 180, 0.2);
    }
    .save:hover {
    	background-color: rgb(124, 252, 0, 0.3);
    }
    .delete:hover {
    	background-color: rgb(255, 0, 0, 0.3);
    }
    button + button {
    	margin-left: 10px;
    }
</style>	
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
		<main style="background: #f0f0f3; padding: 200px;">
			<input type="text" value="${CODE}" id="selectListItem">
			<div style="display: flex; justify-content: flex-start;" id="selectCodeBtn">
				<c:forEach var="item" items="${typeList}">
					<button type="button" class="btn btn-outline-primary">${item.key}</button>
				</c:forEach>
			</div>
			<div id="grid"></div>
		</main>	
	<jsp:include page="../template/store_sidevar_close.jsp"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/muchang_js/codeList.js"></script>
</body>
</html>