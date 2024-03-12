<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 마이페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/member/chatList.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
	
		<div style="/* border: 1px solid black; */ width: 100%; height: 100%; padding-top: 5%; align-items: center;">
			<!--  -->
        	<div class="container rounded-5 shadow" style="height: 100%; width: 700px;">
        		<h3 class="title" style="padding-top: 3%; padding-left: 2%;">채팅방 목록</h3>
        		<hr>
                <section class="css-1dk9sr2">
                    
                    <div class="css-312egs">
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'" style="padding: 8% 0 0 0;">
                        <img alt="유저 프로필" loading="lazy" width="20px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            <span id="span01" style="width: 100px;">내 상품 관리</span>
                            <span id="span01">내 상품 관리</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg01">
                                <g clip-path="url(#ic_arrow_mini_svg__a)">
                                    <path d="M12.866 4.583 7.083 9.908l5.783 5.334" stroke="#000" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="ic_arrow_mini_svg__a">
                                        <path fill="#fff" transform="translate(6.667 4.167)" d="M0 0h6.617v11.492H0z"></path>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'" style="padding: 8% 0 0 0;">
                        <img alt="유저 프로필" loading="lazy" width="20px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            <span id="span01" style="width: 100px;">내 상품 관리</span>
                            <span id="span01">내 상품 관리</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg01">
                                <g clip-path="url(#ic_arrow_mini_svg__a)">
                                    <path d="M12.866 4.583 7.083 9.908l5.783 5.334" stroke="#000" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="ic_arrow_mini_svg__a">
                                        <path fill="#fff" transform="translate(6.667 4.167)" d="M0 0h6.617v11.492H0z"></path>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'" style="padding: 8% 0 0 0;">
                        <img alt="유저 프로필" loading="lazy" width="20px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            <span id="span01" style="width: 100px;">내 상품 관리</span>
                            <span id="span01">내 상품 관리</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg01">
                                <g clip-path="url(#ic_arrow_mini_svg__a)">
                                    <path d="M12.866 4.583 7.083 9.908l5.783 5.334" stroke="#000" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="ic_arrow_mini_svg__a">
                                        <path fill="#fff" transform="translate(6.667 4.167)" d="M0 0h6.617v11.492H0z"></path>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'" style="padding: 8% 0 0 0;">
                        <img alt="유저 프로필" loading="lazy" width="20px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            <span id="span01" style="width: 100px;">내 상품 관리</span>
                            <span id="span01">내 상품 관리</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg01">
                                <g clip-path="url(#ic_arrow_mini_svg__a)">
                                    <path d="M12.866 4.583 7.083 9.908l5.783 5.334" stroke="#000" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="ic_arrow_mini_svg__a">
                                        <path fill="#fff" transform="translate(6.667 4.167)" d="M0 0h6.617v11.492H0z"></path>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'" style="padding: 8% 0 0 0;">
                        <img alt="유저 프로필" loading="lazy" width="20px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            <span id="span01" style="width: 100px;">내 상품 관리</span>
                            <span id="span01">내 상품 관리</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg01">
                                <g clip-path="url(#ic_arrow_mini_svg__a)">
                                    <path d="M12.866 4.583 7.083 9.908l5.783 5.334" stroke="#000" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="ic_arrow_mini_svg__a">
                                        <path fill="#fff" transform="translate(6.667 4.167)" d="M0 0h6.617v11.492H0z"></path>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'" style="padding: 8% 0 0 0;">
                        <img alt="유저 프로필" loading="lazy" width="20px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            <span id="span01" style="width: 100px;">내 상품 관리</span>
                            <span id="span01">내 상품 관리</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg01">
                                <g clip-path="url(#ic_arrow_mini_svg__a)">
                                    <path d="M12.866 4.583 7.083 9.908l5.783 5.334" stroke="#000" stroke-linecap="round" stroke-linejoin="round"></path>
                                </g>
                                <defs>
                                    <clipPath id="ic_arrow_mini_svg__a">
                                        <path fill="#fff" transform="translate(6.667 4.167)" d="M0 0h6.617v11.492H0z"></path>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                        
                    </div>
                </section>
			<!--  -->
		</div>
		</div>
	</div>
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>