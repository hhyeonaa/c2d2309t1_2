<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 항목</title>
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
    button + button {
    	margin-left: 10px;
    }
    .select2-container {
    	z-index: 9999 !important; /* or a higher value than the modal's z-index */
	}
</style>	
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	<main style="background: #f0f0f3; padding: 200px;">
		<input type="hidden" value="${CODE}" id="selectListItem">
		<div style="display: flex; justify-content: flex-start;" id="selectCodeBtn">
			<c:forEach var="items" items="${keyList}">
				<button type="button" class="btn btn-outline-primary">${items.key}</button>
			</c:forEach>
		</div>
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
		<div id="grid" style="width: 1280px;"></div>
		<div style="display: flex; justify-content: flex-end;"><button class="btn btn-danger" id="ckDeleteBtn">삭제</button></div>
		<!-- 관리자추가 모달창 -->
		<div id="addModal" class="modal">
		  	<div class="modal-content mt-5" id="modal-content">
		     	<div class="modal-header" id="modal-header" style="display: flex; flex-direction: column; align-items: flex-start">
		     		<div style="display: flex; align-items: baseline; width: 300px; justify-content: space-between;" id="header-modal">
			     		<button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">&times;</button>
		     		</div>
			     	<div style="display: flex;">
			     		<select id="selectCodeList" style="width: 250px;">
			     			<option value="true">＊항목을 선택해주세요 :)</option>
							<c:forEach begin="0" end="${fn:length(valueList)}" step="1" var="i">
								<option value="${valueList[i].value}">${keyList[i].key}</option>
							</c:forEach>
						</select>
		     		</div>
		     	</div>
		     	<div class="modal-body p-3" id="modal-body">
		     		
		     	</div>
		     	<div class="modal-footer" id="modal-footer">
		       		<button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>     
	    	   		<button type="button" id="beforeInsertBtn" class="btn btn-outline-danger">저장</button>
		     	</div>
		  	</div>
		</div>
		
	</main>	
	<jsp:include page="../template/store_sidevar_close.jsp"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/muchang_js/codeList.js"></script>
</body>
</html>