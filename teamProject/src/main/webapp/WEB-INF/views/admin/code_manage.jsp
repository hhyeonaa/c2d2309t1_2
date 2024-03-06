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
			<div class="btn-wrapper">
				<select name="perPage" id="setPerpage">
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
				<button id="appendBtn">행 추가</button>
				<button id="removeBtn">추가 행 삭제</button>
				<button id="resetBtn">취소</button>
				<button id="saveBtn">저장</button>
				<button id="updateBtn">수정</button>
			</div>
			<div id="grid"></div>
		</main>	
	<jsp:include page="../template/store_sidevar_close.jsp"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/muchang_js/codeList.js"></script>
</body>
</html>