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
        <div><h4 class="card-title"><b>관리자 목록</b></h4></div>
        <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
			<div>
			    <a data-mdb-toggle="pill" href="#" role="tab" aria-controls="register" aria-selected="true"
			       class="btn" id="btnAdd"><i class="bx bx-plus me-1"></i>관리자 추가</a>
			</div>
        </div>
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
    	   <button type="button" id="insertBtn" class="btn btn-outline-danger">생성</button>
	     </div>
	  </div>
	</div>
    	
    <form action="">
    <div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table id="adminList" class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">ID</th>
                                <th scope="col">권한</th>
                                <th scope="col">활성 상태</th>
                                <th scope="col">삭제</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        	<c:forEach var="admin" items="${mapList}">
	                            <tr>
	                            	<th>${admin.AD_NO }</th>
	                                <td>${admin.AD_ID }</td>
                                	<td>
                                		<select class="form-select" id="role">
											<option selected hidden>${admin.ROL_NAME }</option>
											<option value="0">기본</option>
											<option value="1">총괄</option>
											<option value="2">운영</option>
											<option value="3">사이트</option>
										</select>
									</td>
	                                <td scope="row">
		                                <div class="form-check form-switch justify-content-center">
			                                <c:if test="${admin.AD_ACTIVE eq '1'}">
												<input class="form-check-input" type="checkbox" id="active" checked>
			                                </c:if>
		                           	       	<c:if test="${admin.AD_ACTIVE eq '0'}">
												<input class="form-check-input" type="checkbox" id="active">
			                                </c:if>
		                                </div>
	                                </td>
                            	    <td scope="row">
										<button type="button" id="deleteBtn">
											<ion-icon name="remove-circle-outline"></ion-icon></button>
	                                </td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-0 pb-4">
    	<div class="mb-4" align="right">
			<button type="reset" class="btn btn-secondary" id="resetBtn">취소</button>
			<button type="button" class="btn btn-outline-danger" id="saveBtn">저장</button>
		</div>
		<div class="demo">
		    <nav class="pagination-outer"  aria-label="Page navigation">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div> 
    </div>
    </form>
    
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
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
</html>