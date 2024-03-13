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
<link href="${pageContext.request.contextPath}/resources/css/member/mypage.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="/* border: 1px solid black; */ width: 100%; height: 100%; padding-top: 5%; align-items: center;">
			<!--  -->
        	<div class="container rounded-5 shadow" style="height: 700px; width: 700px; padding: 0, 20%, 0, 20%;">
                <section class="css-1dk9sr2">
                    
                    <div class="css-312egs">
                        
                        <section class="css-2fvz7x">
                            <img alt="유저 프로필" loading="lazy" width="130px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/uploads/${profile.MEM_IMAGE	}"/>
                            
                            <c:if test="${profile.MEM_PW == null || profile.MEM_PW == ''}">
                            	<c:choose>
                            		<c:when test="${fn:length(profile.MEM_ID) lt '12'}">
	                            		<span><b><img src="../resources/img/member/kakao.png" id="image" width="24" height="24"/>${profile.MEM_EMAIL}</b></span>
			                            <div>
			                                <span>${profile.MEM_NICK}</span>
			                            </div>
                            		</c:when>
                            		 <c:otherwise>
                            		 	<span><b><img src="../resources/img/member/naver.png" id="image" width="24" height="24"/>${profile.MEM_EMAIL}</b></span>
			                            <div>
			                                <span>${profile.MEM_NICK}</span>
			                            </div>
                            		 </c:otherwise>
                            	</c:choose>
		                            
                            </c:if>
                            
                            <c:if test="${profile.MEM_PW != null && profile.MEM_PW != ''}">
	                            <span><b><ion-icon name="person-outline"></ion-icon> ${profile.MEM_EMAIL}</b></span>
	                            <div>
	                                <span>${profile.MEM_NICK}</span>
	                            </div>
                            </c:if>
                            
                            <button type="button" onclick="location.href='memberEdit'">프로필 수정하기</button>
                            <br><span>내 평점온도</span>
                            <div class="chart" style="width: 250px;">
                            
	                            <div class="outer_div">
	                            	<div class="my_gradient_4" style="width: 60%">
	                            	<p style="font-size: 10px; text-align: right; padding-right: 5%; color: white;">60˚</p></div>
	                            </div>
<!-- 						      <div class="bar" style="width: 40%;">40˚</div> -->
						    </div>
                        </section>
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='myList'">
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
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='tradeList'">
                            <span id="span01">내 거래 내역</span>
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
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='likeList'">
                            <span id="span04">찜한 상품</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg04">
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
                        <hr style="border-color: white;">
                        
                        <a rel="noopener noreferrer" class="css-vqah3m" onclick="location.href='memberDelete'">
                            <span id="span05">회원탈퇴</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" id="svg05">
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