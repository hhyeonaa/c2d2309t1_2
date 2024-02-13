<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="${pageContext.request.contextPath}/resources/js/common/jquery-3.6.0.js"></script>

<!-- header -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/common/header.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>

<!-- sticky menu -->
<link href="${pageContext.request.contextPath}/resources/css/common/stickyMenu.css" rel="stylesheet"/>

<!-- footer -->
<link href="${pageContext.request.contextPath}/resources/css/common/variables.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/bootstrap-icons.css" rel="stylesheet">

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/main.js"></script>


</head>

<div class="wrapper222">
<div class="main222">
<header class="fixed-top navbar navbar-expand-lg" style="justify-content: center;">
<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="uriParts" value="${fn:split(currentUri, '/')}" />
<c:set var="fileNameWithExtension" value="${uriParts[fn:length(uriParts) - 1]}" />
<c:set var="fileName" value="${fn:replace(fileNameWithExtension, '.jsp', '')}" />

		<div class="row">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="collapse navbar-collapse mainHeader" id="navbarTogglerDemo01">
					<a class="navbar-brand" href="#" style="font-size: 30px;"><b>꿀당근장터</b></a>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="menu">
					 		<a class="nav-link ${fileName == 'saleBoard' ? 'active' : ''}" href="${pageContext.request.contextPath}/board/saleBoard">판매</a>
						</li>
						<li class="menu">
							<a class="nav-link ${fileName == 'buyBoard' ? 'active' : ''}" href="${pageContext.request.contextPath}/board/buyBoard">구매</a>
						</li>
						<li class="menu">
							<a class="nav-link ${fileName == 'divideBoard' ? 'active' : ''}" href="${pageContext.request.contextPath}/board/divideBoard">나눔</a>
						</li>
						<li class="menu">
							<a class="nav-link ${fileName == 'auctionBoard' ? 'active' : ''}" href="${pageContext.request.contextPath}/board/auctionBoard">경매</a>
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
					<a class="nav-link writeBtn" href="${pageContext.request.contextPath}/board/writeBoard">상품 등록</a>
				</div>
				<div class="btn-group">
			  	<button class="btn borderNone" type="button" data-bs-toggle="dropdown" id="button">
					<img src="${pageContext.request.contextPath}/resources/img/common/user.png" alt="로그인" onclick="" style="width: 40px; height: 40px;">
				</button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="mypage">프로필</a></li>
				    <li><a class="dropdown-item" href="tradeList">거래내역</a></li>
				    <li><a class="dropdown-item" href="likeList">찜목록</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="logout">로그아웃</a></li>
				  </ul>
				</div>
			</nav>
		</div>
</header>
</html>