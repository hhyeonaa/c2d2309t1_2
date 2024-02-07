<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>꿀중고장터 | 마이페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/member/mypage.css" rel="stylesheet">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="/* border: 1px solid black; */ width: 100%; height: 100%; padding-top: 5%; align-items: center;">
			<!--  -->
        	<div class="container" style="border: 1px solid black; height: 600px; width: 700px; padding: 0, 20%, 0, 20%;">
                <section class="css-1dk9sr2">
                    
                    <div class="css-312egs">
                        
                        <section class="css-2fvz7x">
                            <img alt="유저 프로필" loading="lazy" width="130px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/member/lemon.jpg"/>
                            <span><b>ljw9863@naver.com</b></span>
                            <div>
                                <span>레몬나르고빚갚으리오</span>
                            </div>
                            <button type="button">프로필 수정하기</button>
                            <br>
                            <div class="chart">
						      <div class="bar" style="width: 40%;">40˚</div>
						    </div>
                        </section>
                        
                        <a target="_blank" rel="noopener noreferrer" class="css-vqah3m" href="https://ggulmojoonggo.notion.site/bb80c14ab0ac4d6299f8096e27bee1af?pvs=4">
                            <span>거래 내역 보기</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                        
                        <a target="_blank" rel="noopener noreferrer" class="css-vqah3m" href="https://ggulmojoonggo.notion.site/bb80c14ab0ac4d6299f8096e27bee1af?pvs=4">
                            <span>찜 목록 보기</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                        
                        <a target="_blank" rel="noopener noreferrer" class="css-vqah3m" href="https://ggulmojoonggo.notion.site/bb80c14ab0ac4d6299f8096e27bee1af?pvs=4">
                            <span>계정삭제</span>
                            <svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                        <div class="css-oyp86"></div>
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