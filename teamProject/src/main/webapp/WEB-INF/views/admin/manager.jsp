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
<link href="${pageContext.request.contextPath}/resources/css/admin/manager.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container">
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
			  	<input type="text" name="OWN_ID" class="form-control"/>
			</div>
			<div class="form-outline mb-4">
				<div style="text-align: left;"> <label>비밀번호</label> </div>
			    	<input type="password" name="OWN_PW" class="form-control" />
			  </div>
	     </div>
	     <div class="modal-footer" id="modal-footer">
	       <button type="button" id="cancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>     
    	   <button type="button" id="deleteBtn" class="btn btn-outline-danger">생성</button>
	     </div>
	  </div>
	</div>
    
    
    <div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">ID</th>
                                <th scope="col">이름</th>
                                <th scope="col">활성 상태</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <tr>
                            	<th>1</th>
                                <td>admin1</td>
                                <td>관리자1</td>
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td>admin2</td>
                                <td>관리자2</td>
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                          		<th>3</th>
                                <td>admin3</td>
                                <td>관리자3</td>
                                <th scope="row">
                            	    <div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                            	<th>4</th>
                            	<td>admin4</td>
                                <td>관리자4</td>
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-0 pb-4">
    	<div class="mb-4" align="right">
			<button type="button" class="btn btn-light">저장</button>
			<button type="button" class="btn btn-dark">취소</button>
		</div>
		<div class="demo">
		    <nav class="pagination-outer"  aria-label="Page navigation">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div> 
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
</html>