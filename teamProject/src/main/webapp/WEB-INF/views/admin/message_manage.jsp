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
			<div style="display: flex; justify-content: flex-end">
				<button class="btn btn-warning" id="btnAdd">추가</button>
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
			
			<!-- 관리자추가 모달창 -->
			<div id="addModal" class="modal">
			  	<div class="modal-content mt-5" id="modal-content">
			     	<div class="modal-header" id="modal-header">
				    	<h3 class="modal-title" id="modal-title"><b>관리자 추가</b></h3>
				     	<button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
				     	&times;</button>
			     	</div>
			     	<div class="modal-body" id="modal-body">
					<div class="form-outline mb-4">
					  	<div style="text-align: left;"> <label>아이디</label> </div>
					  	<input type="text" name="AD_ID" id="AD_ID" class="form-control"/>
					</div>
					<div class="form-outline mb-4">
						<div style="text-align: left;"> <label>비밀번호</label> </div>
					    	<input type="password" name="AD_PW" id="AD_PW" class="form-control" />
					</div>
					<div class="form-outline mb-4">
					  	<div style="text-align: left;"> <label>이름</label> </div>
					  	<input type="text" name="AD_NAME" id="AD_NAME" class="form-control"/>
					</div>
			     	</div>
			     	<div class="modal-footer" id="modal-footer">
			       		<button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>     
		    	   		<button type="button" id="insertBtn" class="btn btn-outline-danger">생성</button>
			     	</div>
			  	</div>
			</div>
		</main>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/muchang_js/message.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>