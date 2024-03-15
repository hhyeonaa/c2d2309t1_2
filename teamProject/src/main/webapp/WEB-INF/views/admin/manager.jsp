<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트관리-매니저관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/admin/manager.css" rel="stylesheet">
<c:set var="adminList" value="${ requestScope.mapList }"/>
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container" id="adminDiv">
    <div class="row align-items-center">
        <div><h3 class="card-title"><b>관리자 목록</b></h3></div>
    </div>
    
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
    	   <button type="button" id="checkBtn" class="btn btn-outline-danger">생성</button>
	     </div>
	  </div>
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
		<button id="appendBtn" class="btn btn-warning">추가</button>
		<button id="ckDeleteBtn" class="btn btn-danger">선택 삭제</button>
	</div>
    <div id="grid"></div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
</html>