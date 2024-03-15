<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트관리-게시판관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link href="${pageContext.request.contextPath}/resources/css/admin/board.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container" id="boardDiv">
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>현재 저장된 헤더</b></h4></div>
    </div>
    <div class="preview mb-5">
		<div class="row align-middle">
			<nav class="navbar navbar-expand-lg navbar-light p-3">
				<div class="collapse navbar-collapse mainHeader" id="navbarTogglerDemo01">
					<img src="${pageContext.request.contextPath}/resources/img/member/logo.jpg" alt="로고" style="width: 150px; height: 70px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<c:forEach var="menu" items="${menu}">
							<c:if test="${menu.ACTIVE eq '1'}">
								<li class="menu">
							 		<a class="nav-link" href="#">${menu.CODE }</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<form class="d-flex">
						<div class="input-group" style="flex-wrap: nowrap;">
					      <select class="form-select" aria-label="boardSelect">
					      	<c:forEach var="menu" items="${menu}">
					      		<c:if test="${menu.ACTIVE eq '1'}">
					      			<option value="${menu.CO_NO }">${menu.CODE }</option>
					      		</c:if>
				          	</c:forEach>
				          </select>
					      <input
					        class="form-control me-2"
					        type="search"
					        placeholder="찾고 싶은 물품을 검색해 보세요."
					        aria-label="Search"
					        id="search"
					    />
					    <button class="btn" id="searchButton"><ion-icon name="search-outline"></ion-icon></button>
					    </div>
						</form>
				</div>
				<div class="writeBtnBox" style="width: 100px; display:flex; justify-content: center;">
					<span class="material-symbols-outlined addIcon">add_circle</span>
					<a class="nav-link">상품 등록</a>
				</div>
				<div class="btn-group">
			  	<button class="btn borderNone" type="button" data-bs-toggle="dropdown">
					<img src="${pageContext.request.contextPath}/resources/img/common/user.png" alt="로그인"  style="width: 40px; height: 40px;">
				</button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item">프로필</a></li>
				    <li><a class="dropdown-item">거래내역</a></li>
				    <li><a class="dropdown-item">글목록</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item">로그아웃</a></li>
				  </ul>
				</div>
			</nav>
		</div>
    </div>
    
    
    
    
   	<input type="hidden" value="${CODE}" id="selectListItem">
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>게시판 목록</b></h4></div>
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
	</div>
	
    <div id="excel"></div>	
    <div id="grid"></div>
</div>



</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
</html>