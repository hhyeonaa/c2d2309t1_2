<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/muchang_css/modal.css" rel="stylesheet">
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
</style>
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
		<main style="background: #f0f0f3; padding: 200px;">
			<div class="mb-3"><h3><b>메시지 관리</b></h3></div>
			<input type="hidden" id="CODE_TYPE" value="${CODE_TYPE}">
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
				<button class="btn btn-warning" id="btnAdd">추가</button>
				<button class="btn btn-danger" id="ckDeleteBtn">선택 삭제</button>
			</div>
			<div>
				<div id="grid" style="width: 1280px;"></div>
			</div>
			<!-- 관리자추가 모달창 -->
			<div id="addModal" class="modal">
			  	<div class="modal-content mt-5" id="modal-content">
			     	<div class="modal-header" id="modal-header">
				    	<h3 class="modal-title" id="modal-title"><b>메시지 추가</b></h3>
				     	<button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
				     	&times;</button>
			     	</div>
			     	<div class="modal-body" id="modal-body">
			     	</div>
			     	<div class="modal-footer" id="modal-footer">
			       		<button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>     
		    	   		<button type="button" id="beforeInsertBtn" class="btn btn-outline-danger">생성</button>
			     	</div>
			  	</div>
			</div>
		</main>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/muchang_js/message.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>