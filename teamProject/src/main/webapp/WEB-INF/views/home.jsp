<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet">
</head>
<jsp:include page="template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
	
	
		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>판매중</h3>
					<button aria-label="전체 판매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/saleBoard'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
						<div class="col" id="product">
						  <div class="card h-100" onclick="location.href ='${pageContext.request.contextPath}/board/boardDetail'">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">판매</span>
						     <span class="state2">판매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
					</div>	
				</div>			  
			</article>
		</div>
		
		
		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>나눔중</h3>
					<button aria-label="전체 나눔 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/divideBoard'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">나눔</span>
						     <span class="state3">나눔중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
					</div>	
				</div>			  
			</article>
		</div>
		

		<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>구매중</h3>
					<button aria-label="전체 구매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/buyBoard'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">구매</span>
						     <span class="state4">구매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
					</div>	
				</div>			  
			</article>
		</div>		
		
		
				<div style="border: 1px solid black; width: 100%; height: 100%;">
			<article>
				<div class="css-f96hxp">
					<h3>경매중</h3>
					<button aria-label="전체 경매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}/board/auction'">더보기</button>
				</div>	
				<div class="css=1qeni0p">
					<div class="css-1afg07s">
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
						<div class="col" id="product">
						  <div class="card h-100">
						    <img src="resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
						    <div class="card-body">
						     <span class="state1">경매</span>
						     <span class="state5">경매중</span><br>
						     <p>제목명</p>
						  <h5><b>10,000원</b></h5>
						    </div>
						  </div>
						</div>							
					</div>	
				</div>			  
			</article>
		</div>
		
		
		
	</div>
</div>
</body>

<jsp:include page="template/Footer.jsp"/>
</html>