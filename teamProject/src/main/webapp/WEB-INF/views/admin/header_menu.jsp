<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>사이트관리-헤더메뉴관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<style type="text/css">
body {
	padding: 100px 0 0 240px !important;
}

.preview {
    border: 1px solid;
    background-color: white;
    border-radius: 10px;
    margin: 0 5% 0 5%;
}

.headerEdit {
    border: 1px solid;
    background-color: white;
    border-radius: 10px;
    width: 500px;
    margin: 0 5% 0 5%;
    padding: 3%;
    justify-content: center;
}

.tableHr {
	border-bottom: 3px solid;
}

#btn {
	background-color: white;
	border: none;
}

#btnTop {
    width: 30px;
    height: 30px;
}
</style>
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<div class="container">
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>적용 미리 보기</b></h4></div>
    </div>
    <div class="preview mb-5">
		<div class="row align-middle">
			<nav class="navbar navbar-expand-lg navbar-light p-3">
				<div class="collapse navbar-collapse mainHeader" id="navbarTogglerDemo01">
					<a class="navbar-brand" href="#" style="font-size: 30px;"><b>꿀당근장터</b></a>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="menu">
					 		<a class="nav-link" href="board/saleBoard">판매</a>
						</li>
						<li class="menu">
							<a class="nav-link" href="#">구매</a>
						</li>
						<li class="menu">
							<a class="nav-link" href="#">나눔</a>
						</li>
						<li class="menu">
							<a class="nav-link" href="#">경매</a>
						</li>
					</ul>
					<form class="d-flex">
						<div class="input-group" style="flex-wrap: nowrap;">
					      <select class="form-select" aria-label="boardSelect">
					          <option value="판매" selected>판매</option>
					          <option value="구매">구매</option>
					          <option value="나눔">나눔</option>
					          <option value="경매">경매</option>
				        	</select>
					      <input
					        class="form-control me-2"
					        type="search"
					        placeholder="찾고 싶은 물품을 검색해 보세요."
					        aria-label="Search"
					        id="search"
					    />
					    <button class="btn" type="submit" id="searchButton"><ion-icon name="search-outline"></ion-icon></button>
					    </div>
					</form>
				</div>
				<div class="writeBtnBox" style="width: 100px; display:flex; justify-content: center;">
					<span class="material-symbols-outlined addIcon">add_circle</span>
					<a class="nav-link writeBtn" href="#">상품 등록</a>
				</div>
				<div class="btn-group">
			  	<button class="btn borderNone" type="button" data-bs-toggle="dropdown" id="button">
					<img src="${pageContext.request.contextPath}/resources/img/common/user.png" alt="로그인" onclick="" style="width: 40px; height: 40px;">
				</button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">프로필</a></li>
				    <li><a class="dropdown-item" href="#">거래내역</a></li>
				    <li><a class="dropdown-item" href="#">글목록</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="#">로그아웃</a></li>
				  </ul>
				</div>
			</nav>
		</div>
    </div>
    <div class="row align-items-center mt-5 mb-4">
        <div><h4 class="card-title"><b>헤더 메뉴  설정</b></h4></div>
    </div>
    <div class="headerEdit mb-4">
		<table class="table align-middle text-center mb-4">
			<thead class="tableHr">
				<tr>
					<th scope="col" >메뉴명</th>
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
			<button type="button" class="btn btn-light">저장</button>
			<button type="button" class="btn btn-dark">취소</button>
	    </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>