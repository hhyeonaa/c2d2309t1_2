<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>사이트관리-게시판관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<script src="${pageContext.request.contextPath}/resources/js/common/jquery-3.6.0.js"></script>
<style>
body {
	padding: 100px 0 0 240px !important;
}
.project-list-table {
    border-collapse: separate;
    border-spacing: 0 12px;
}
#insertForm {
    text-decoration: underline;
    color: gray;
}
.form-select {
	width: 50% !important;
	float: none !important;
	text-align: center;
}

.form-check .form-check-input {
    float: none !important;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);
}

/* 관리자추가 모달 */
#modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 10px 20px 30px 20px;
	border: 1px solid #888;
	width: 20%;
	position: fixed;
    top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal-body {
	padding: 20px 10px 20px 0px;
}

#modal-footer {
	padding-top: 20px;
	align-content: right;
}

#close {
	color: salmon;
  	float: right;
  	font-size: 50px;
  	font-weight: bold;
  	border-color: #ffffff;
  	background-color: #ffffff;
  	border-style: none;
}

#close:hover,
#close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5"><b>게시판 목록</b></h4></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">게시판명</th>
                                <th scope="col">게시판 유형</th>
                                <th scope="col">글쓰기 입력폼</th>
                                <th scope="col">숨김 여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            	<th>1</th>
                                <td>판매게시판</td>
                                <td>
                                	<div align="center">
	                                	<select class="form-select">
											<option selected disabled>게시판 선택</option>
											<option value="1">글</option>
											<option value="2">글+사진</option>
											<option value="3">공지사항</option>
										</select>
									</div>
								</td>
                                <td><a href="#" id="insertForm">설정하기</a></td>
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td>구매게시판</td>
                                <td>
                                	<div align="center">
	                                	<select class="form-select">
											<option selected disabled>게시판 선택</option>
											<option value="1">글</option>
											<option value="2">글+사진</option>
											<option value="3">공지사항</option>
										</select>
									</div>
								</td>
                                <td><a href="#" id="insertForm">설정하기</a></td>
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                          		<th>3</th>
                                <td>나눔게시판</td>
                                <td>
                                	<div align="center">
	                                	<select class="form-select">
											<option selected disabled>게시판 선택</option>
											<option value="1">글</option>
											<option value="2">글+사진</option>
											<option value="3">공지사항</option>
										</select>
									</div>
								</td>
                                <td><a href="#" id="insertForm">설정하기</a></td>
                                <th scope="row">
                            	    <div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                            	<th>4</th>
                            	<td>경매게시판</td>
                                <td>
                                	<div align="center">
	                                	<select class="form-select">
											<option selected disabled>게시판 선택</option>
											<option value="1">글</option>
											<option value="2">글+사진</option>
											<option value="3">공지사항</option>
										</select>
									</div>
								</td>
                                <td><a href="#" id="insertForm">설정하기</a></td>
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
    
    
    	<!-- 게시판 입력폼 모달창 -->
	<div id="addModal" class="modal">
	  <div class="modal-content mt-5" id="modal-content">
	     <div class="modal-header" id="modal-header">
		     <h3 class="modal-title" id="modal-title"><b>판매게시판 입력폼</b></h3>
		     <button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
		     	&times;</button>
	     </div>
	     <div class="modal-body" id="modal-body">
		    <div class="headerEdit mb-4">
		   		<div>
				    <a data-mdb-toggle="pill" href="#" role="tab" aria-controls="register" aria-selected="true"
				       class="btn" id="btnAdd"><i class="bx bx-plus me-1"></i>입력폼 추가</a>
				</div>
				<table class="table align-middle text-center mb-4">
					<thead class="tableHr">
						<tr>
							<th scope="col" >라벨명</th>
<!-- 							<th scope="col">타입</th> -->
<!-- 							<th scope="col">항목</th> -->
							<th scope="col">순서</th>
							<th scope="col">숨김 여부</th>
						</tr>
					</thead>
					<tbody class="tableHr">
						<tr>
							<td>판매</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>구매</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>나눔</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>경매</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
					</tbody>
				</table>
				<div align="center">

			    </div>
		    </div>		
	     </div>
	     <div class="modal-footer" id="modal-footer">
	     					<button type="button" class="btn btn-light">저장</button>
					<button type="button" class="btn btn-dark">취소</button>
	     </div>
	  </div>
	</div>
    
    
    <div class="row g-0 pb-4">
    	<div class="mb-4" align="right">
			<button type="button" class="btn btn-light">저장</button>
			<button type="button" class="btn btn-dark">취소</button>
		</div>
		<div>
		    <ul class="pagination mb-sm-0 justify-content-center">
		        <li class="page-item disabled">
		            <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
		        </li>
		        <li class="page-item active"><a href="#" class="page-link">1</a></li>
		        <li class="page-item"><a href="#" class="page-link">2</a></li>
		        <li class="page-item"><a href="#" class="page-link">3</a></li>
		        <li class="page-item"><a href="#" class="page-link">4</a></li>
		        <li class="page-item"><a href="#" class="page-link">5</a></li>
		        <li class="page-item">
		            <a href="#" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
		        </li>
		    </ul>
		</div>
    </div>
</div>

<script type="text/javascript">
$(function(){
	var modal = document.getElementById("addModal");
	var btn = document.getElementById("insertForm");
	var span = document.getElementsByClassName("close")[0];
	var cancelBtn = document.getElementById("cancelBtn");
	
	$('#insertForm').on('click', function(){
		modal.style.display = "block";	
	})
	
	$('#close').on('click', function(){
		modal.style.display = "none";
	})
	
	$('#cancelBtn').on('click', function(){
		modal.style.display = "none";
	})
	
	$('#deleteBtn').on('click', function(){
	})
	
});
</script>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>