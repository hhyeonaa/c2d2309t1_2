<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트관리-카테고리 관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link href="${pageContext.request.contextPath}/resources/css/admin/category.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container">
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>적용 미리 보기</b></h4></div>
    </div>
    <div class="preview mb-5 ps-3">
		<div class="navbar navbar-expand-lg">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-justified" id="category-ul">
				<li class="nav-item mt-2">
					<svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M4.167 5.417h11.666M4.167 10h11.666M4.167 14.584h11.666" stroke="#000" stroke-linecap="round"></path>
					</svg>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">의류</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">식품</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">생활용품</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">가전제품</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">가구/인테리어</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">디지털/가전제품</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">도서/티켓</a>
				</li>
				<li id="category-li">
					<a class="nav-link" href="#">잡화</a>
				</li>	
				<li id="category-li">
					<a class="nav-link" href="#">기타</a>
				</li>	
			</ul>
		</div>
   </div> 
   
    <div class="row align-items-center mt-5 mb-4">
        <div><h4 class="card-title"><b>카테고리 설정</b></h4></div>
    </div>
    <div class="cateEdit mb-4">
		<table id="categoryList" class="table align-middle text-center mb-4">
			<thead class="tableHr">
				<tr>
					<th scope="col" >카테고리명</th>
					<th scope="col">순서</th>
					<th scope="col">숨김 여부</th>
				</tr>
			</thead>
			<tbody class="tableHr">
				<tr>
					<td>의류</td>
					<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
					<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
				</tr>
				<tr>
					<td>식품</td>
					<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
					<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
				</tr>
				<tr>
					<td>생활용품</td>
					<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
					<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
				</tr>
				<tr>
					<td>기타</td>
					<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
					<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button type="button" class="btn btn-light" id="saveBtn">저장</button>
			<button type="button" class="btn btn-dark" id="resetBtn">취소</button>
	    </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/category.js"></script>
</html>