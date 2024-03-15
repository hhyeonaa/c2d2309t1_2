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

<!-- sticky menu -->
<link href="${pageContext.request.contextPath}/resources/css/common/stickyMenu.css" rel="stylesheet"/>

<!-- footer -->
<link href="${pageContext.request.contextPath}/resources/css/common/variables.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/variable.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/common/variableCode.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/common/jquery.twbsPagination.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/css/common/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/bootstrap-icons.css" rel="stylesheet">

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<!-- Toast UI Grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<!-- chatModal -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/common/chatModal.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/common/chatModal.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/common/headerSearchBar.js"></script>
</head>

<div class="wrapper222">
<div class="main222">
<header class="fixed-top navbar navbar-expand-lg" style="justify-content: center;">
<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="uriParts" value="${fn:split(currentUri, '/')}" />
<c:set var="fileNameWithExtension" value="${uriParts[fn:length(uriParts) - 1]}" />
<c:set var="fileName" value="${fn:replace(fileNameWithExtension, '.jsp', '')}" />
<input type="hidden" class="id_session" value="${sessionScope.MEM_ID}">
<input type="hidden" class="nick_session" value="${sessionScope.MEM_NICK}">

		<div class="row">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="collapse navbar-collapse mainHeader" id="navbarTogglerDemo01">
					<a class="navbar-brand" href="${pageContext.request.contextPath}" style="font-size: 30px;"><img src="${pageContext.request.contextPath}/resources/img/member/logo.jpg" alt="로고" style="width: 125px; height: 55px;"></a>
					<ul class="navbar-nav mb-2 mb-lg-0" id="hearderMenu" style="width: 230px;"> 
					</ul>
					<div id="selectedCodeList">
					<c:forEach var="entry" items="${selectCode}" varStatus="status">
						<input class="${entry.key}" type="hidden" value="${entry.value}">
					</c:forEach>
					</div>
					<form class="d-flex" method="get" id="searchSubmit" action="" style="margin-left: 30px;">
						<div>
							<div style="display: flex;">
								<select class="form-select" name="menu" id="menu" style="width: 70px;"></select>
					        	<select class="form-select" name="category" id="category" style="width: 150px;"></select>
					        	<select class="form-select" name="trade" id="trade" style="width: 100px;"></select>
					        	<select class="form-select" name="price" id="price" style="width: 180px;"></select>							
							</div>
				        	<div class="input-group" style="flex-wrap: nowrap;">
						      	<input
							        class="form-control me-2"
							        type="search"
							        placeholder="찾고 싶은 물품을 검색해 보세요."
							        aria-label="Search"
							        id="search"
							        name="title"
							    />
						    	<button class="btn" type="button" id="searchButton"><ion-icon name="search-outline"></ion-icon></button>
						    	<input type="submit" id="submitBtn" style="display: none;">
						    </div>
						</div>
					</form>
				</div>
				<div class="writeBtnBox" style="width: 100px; display:flex; justify-content: center;">
					<button style="font-size: 15px;" id="writeBoardPage" class="btn btn-outline-success">상품 등록</button>
				</div>
				<c:if test="${!empty sessionScope.MEM_ID}">
					<div class="btn-group">
				  	<button class="btn borderNone" type="button" data-bs-toggle="dropdown" id="button" >
						<img src="${pageContext.request.contextPath}/resources/img/member/loginLogo.png" alt="로그인" onclick="" style="width: 40px; height: 40px;">
					</button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/mypage">프로필</a></li>
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/likeList">찜목록</a></li>
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/myList">내 상품 관리</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					  </ul>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.MEM_ID}">
					<div class="btn-group">
				  	<button class="btn borderNone" type="button" data-bs-toggle="dropdown" id="button">
						<img src="${pageContext.request.contextPath}/resources/img/common/user.png" alt="로그인" onclick="" style="width: 40px; height: 40px;">
					</button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
					  </ul>
					</div>
				</c:if>
				
			</nav>
		</div>
</header>
</html>