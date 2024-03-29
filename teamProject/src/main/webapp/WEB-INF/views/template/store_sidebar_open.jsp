<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>중고거래</title>
    <!-- CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/common/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common/jquery.twbsPagination.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/variable.css" />
	<link href="${pageContext.request.contextPath}/resources/css/excel/excelBtn.css" rel="stylesheet">
    <title>SideBar sub menus</title>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
    	/* GOOGLE FONTS */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

/* VARIABLES CSS */
:root {
    --nav--width: 92px;
	color-scheme: light only;
    /* Colores */
    --first-color: #0c5df4;
    --bg-color: #12192c;
    --sub-color: #b6cefc;
    --white-color: #fff;

    /* Fuente y tipografia */
    --body-font: 'Poppins', sans-serif;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;

    /* z index */
    --z-fixed: 100;
}
	
/* BASE */
*, ::before, ::after {
    box-sizing: border-box;
}

body {
    position: relative;
    margin: 0;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s;
}

h1 {
    margin: 0;
}

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

a {
    text-decoration: none;
}

/* l NAV */
.l-navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: var(--nav--width);
    height: 100vh;
    background-color: #fff;
    color: var(--white-color);
    padding: 1.5rem 1.5rem 2rem;
    transition: .5s;
    z-index: var(--z-fixed);
}

/* NAV */
.nav {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden;
}

.nav__brand {
    display: grid;
    grid-template-columns: max-content max-content;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.nav__toggle {
    font-size: 1.25rem;
    padding: .75rem;
    cursor: pointer;
}

.nav__logo {
    color: var(--white-color);
    font-weight: 600;
}

.nav__link {
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: .75rem;
    color: black;
    font-weight:bold;
    border-radius: .5rem;
    margin-bottom: 1rem;
    transition: .3s;
    cursor: pointer;
}

.nav__icon {
    font-size: 1.25rem;
}

.nav_name {
    font-size: 20px;
}

/* Expander menu */
.expander {
    width: calc(var(--nav--width) + 9.25rem);
}

/* Add padding body*/
.body-pd {
}


/* COLLAPSE */
.collapse {
    grid-template-columns: 20px max-content 1fr;
}

.collapse__link {
    justify-self: flex-end;
    transition: .5;
}

.collapse__menu {
    display: none;
    padding: .75rem 2.25rem;
}

.collapse__sublink {
    color: var(--sub-color);
    font-size: var(--small-font-size);
}

.collapse__sublink:hover {
    color: var(--white-color);
}

/* Show collapse */
.showCollapse {
    display: block;
}

/* Rotate icon */
.rotate {
    transform: rotate(180deg);
    transition: .5s;
}
ul{
	text-align: center;
}

.plSelect{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    line-height: 20px;
}

.plSelect:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}
    </style>
</head>
<body class="d-flex flex-column min-vh-100" style="padding: 0 0 0 240px; background:#f0f0f3;">
	<c:set var="adminSession" value="${sessionScope.MEM_ID}"/>
    <div class="l-navbar expander" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                	<div class="p-3" style="display:flex; flex-direction: row; align-items: center; ">
                		<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/member/logo.jpg" alt="로고" style="width: 150px; height: 70px;"></a>
<!-- 						<span class="material-symbols-outlined" style="color:#9CED92; -webkit-text-stroke:0.3px #FFF2A6;">lunch_dining</span> -->
<!-- 						<span id="logo"style="color:#9CED92; -webkit-text-stroke:0.3px #FFF2A6; font-size: 30px; letter-spacing:-2px; font-weight: bold;" >Dining Day</span> -->
					</div>
                </div>
                <c:if test="${adminSession eq 'RO1' || adminSession eq 'RO2' || adminSession eq 'RO3'}">
                <div class="nav__list">
					<ul>
						<li> 
                    		<a href="#;" class="nav__link">
		                        <ion-icon name="construct-outline"></ion-icon>
		                        <span class="nav_name">운영 관리</span>
		                    </a>       
                    	</li>
						<li><a class="nav__link" id="member_manage" href="${pageContext.request.contextPath}/admin/member_manage" style="width: 155px;">
			            	<small>● 회원 관리</small></a>
			            </li>
						<li><a class="nav__link" id="member_report" href="${pageContext.request.contextPath}/admin/member_report" style="width: 155px;">
			            	<small>● 신고 관리</small></a>
			            </li>
			            <li><a class="nav__link" id="chart" href="${pageContext.request.contextPath}/admin/chart" style="width: 155px;">
			            	<small>● 통계</small></a>
			            </li>
			            <li><a class="nav__link mb-5" id="board_content" href="${pageContext.request.contextPath}/admin/board_content" style="width: 155px;">
			            	<small>● 게시판 글 관리</small></a>
			            </li>
					</ul>                
                </div>
                </c:if>
                <c:if test="${adminSession eq 'RO1' || adminSession eq 'RO2'}">
                <div class="nav__list">
                    <ul>
                    	<li> 
                    		<a href="#" class="nav__link">
		                        <ion-icon name="construct-outline"></ion-icon>
		                        <span class="nav_name">사이트 관리</span>
		                    </a>       
                    	</li>
	                    <li><a class="nav__link" id="role_manage" href="${pageContext.request.contextPath}/admin/manager" style="width: 155px;">
	                    	<small>● 권한 관리</small></a>
	                    </li>
	                    <li class=""><a class="nav__link"  id="board_manage"  href="${pageContext.request.contextPath}/admin/board" style="width: 155px;">
	                    	<small>● 게시판 관리</small></a>
	                    </li>
	                    <li><a class="nav__link mb-5" id="catelist_manage"  href="${pageContext.request.contextPath}/admin/category" style="width: 155px;">
	                    	<small>● 카테고리 목록 관리</small></a>
	                    </li>
                    </ul>
                 </div>
                 </c:if>
                 <c:if test="${adminSession eq 'RO1'}">
                 <div class="nav__list">  
                    <ul>
                    	<li> 
		                    <a href="#;" class="nav__link">
		                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
		                        <span class="nav_name">시스템 관리</span>
		                    </a>
                    	</li>
	                    <li><a class="nav__link" id="message_manage" href="${pageContext.request.contextPath}/admin/message_manage" style="width: 155px;">
	                    	<small>● 메세지 관리</small></a>
	                    </li>
	                    <li><a class="nav__link" id="code_manage" href="${pageContext.request.contextPath}/admin/code_manage" style="width: 155px;">
	                    	<small>● 코드 관리</small></a>
	                    </li>
                    </ul>
				</div>
				</c:if>
                <ul>
                   	<li class="mt-5">
		                <a href="#;" class="nav__link">
		                    <ion-icon name="person-outline"></ion-icon>
		                    <span class="nav_name">계정</span>
		                </a>
                	</li>
                    <li class="mt-2"><a class="nav__link" id="logout" href="${pageContext.request.contextPath}/admin/logout" style="width: 155px;">
                    	<small>● 로그아웃</small></a>
                    </li>
            	</ul>
            </div>
        </nav>
    </div>
</html> 
 
