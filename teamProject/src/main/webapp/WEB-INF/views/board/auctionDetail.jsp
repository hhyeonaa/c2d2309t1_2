<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
th {
	font-size: 25px;
}
td{
	font-size: 15px;
}
/* image modal */
.modal {
    display: none;
    z-index: 500;
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.8);
}
.modalBox {
    position: relative;
    text-align: center;
    top : 15%;
    left : 30%;
    width: 50%;
    max-height: 50%;
    position : sticky;
}
.carousel-item > img:hover{
/*     cursor: -webkit-zoom-in; */
    cursor: pointer;
}
/* image modal end */

.btn-lg {
	display: inline-block; /* Align buttons in a row */
	width: 32%; /* Each button takes up one-third of the container's width */
	box-sizing: border-box; /* Include padding and border in the button's total width */
	margin: 0; /* Remove default margins */
	text-align: center; /* Center the text inside buttons */
	/* Adjust padding as needed, but remember it affects the total width if box-sizing is border-box */
}
.center-align {
    text-align: center;
    vertical-align: middle;
    position: relative;
}
.img-innertext{
    position: absolute;
    left: 50%;
    bottom: 0%;
    transform: translate( -50%, -50% );
    color: white;
    background-color : rgb(0,0,0,0.5);
    width: 150px;
}

</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div class="d-flex flex-wrap" style="width: 100%;">
			<div class="pe-2" style="width: 40%;height: 400px;">
		 	 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  	<div class="modal">
				    <div class="modalBox"></div>
				</div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			 </div>
			</div>
		 	<div style="width: 60%; height: 500px;">
		 		<table>
		 			<tr><th>(중고)따봉도치 트리플</th></tr>
		 			<tr><th>현재가</th><th>15000원</th></tr>
		 			<tr><th>시작가</th><th>0원(최소 입찰은 1000원) <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzIiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCAxMzIgNjAiIGZpbGw9Im5vbmUiPgogICAgPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzE5MjhfMzQzNTUpIj4KICAgICAgICA8cmVjdCB3aWR0aD0iMTMyIiBoZWlnaHQ9IjYwIiBmaWxsPSJ3aGl0ZSIgLz4KICAgICAgICA8cGF0aAogICAgICAgICAgICBkPSJNMTMyIDU0LjQ4MTZWNS41MjY1MkMxMzIgMi40NzQzMSAxMjkuNDY0IDAgMTI2LjMzNSAwSDUuNjY0ODdDMi41MzYyNSAwIDAgMi40NzQzMSAwIDUuNTI2NTJWNTQuNDgxNkMtMS42Nzc1OGUtMDYgNTUuOTQ2NSAwLjU5NzEwMSA1Ny4zNTE0IDEuNjU5NzEgNTguMzg2NUMyLjcyMjMzIDU5LjQyMTYgNC4xNjMyMyA2MC4wMDIgNS42NjQ4NyA1OS45OTk4SDEyNi4zMDFDMTI3LjgwOSA2MC4wMTA4IDEyOS4yNTggNTkuNDM0MyAxMzAuMzI4IDU4LjM5ODJDMTMxLjM5OCA1Ny4zNjIyIDEzMiA1NS45NTIzIDEzMiA1NC40ODE2WiIKICAgICAgICAgICAgZmlsbD0iI0Q4MEMxOCIgLz4KICAgICAgICA8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIKICAgICAgICAgICAgZD0iTTMyLjkzMyAyNy44ODU0SDQzLjYzODdWMjcuODg4N0M0My44NCAyNy44ODg3IDQzLjk0MDcgMjguMTQ2IDQzLjc5NDQgMjguMjkxOUwyNC4xNTA3IDQ4LjA4NDdDMjMuOTk5NyA0OC4yMzU1IDIzLjc0OTYgNDguMTEwOSAyMy43NzAxIDQ3Ljg5M0wyNS4yNjU4IDMxLjc1MTNMMTQuODI3NCAzMS44Njc2QzE0LjYyNDUgMzEuODY5MiAxNC41MjIzIDMxLjYxMDMgMTQuNjcwMSAzMS40NjI4TDM0LjI5MDIgMTEuOTE1OEMzNC40NDI4IDExLjc2NSAzNC42OTI5IDExLjg5NDUgMzQuNjY5MyAxMi4xMTI0TDMyLjkzMyAyNy44ODU0Wk03Ni4xOTM5IDEzLjkwOTFIODEuMTExM1Y0Ni4xMTk2SDc2LjE5MzlWMTMuOTA5MVpNNzQuMjY1NiAxNC4wODgyVjQ1LjUxNTFINjkuNDIyN1YzMC41MTkzSDY2LjUwMDRWMjUuNzg0Nkg2OS40MjI3VjE0LjA4ODJINzQuMjY1NlpNNTEuMzUwMiAzOC43MzZWNDMuMTkwMkw2OC4xODAyIDQyLjQ3MjZWMzguMDkyNkw2NS44NjIzIDM4LjE4MzRMNjUuOTI4NSAxOS4xNTRINjcuOTIzNlYxNC42OTk4SDUxLjYzOTlWMTkuMTU0SDUzLjY0MzNMNTMuNzAxMiAzOC42NDUzTDUxLjM1MDIgMzguNzM2Wk01OC40NTMgMTkuMTU0NUg2MS4xMTg3TDYxLjA1MjUgMzguMzY1NEw1OC41MTEgMzguNDY0M0w1OC40NTMgMTkuMTU0NVpNMTEyLjkwMSAxMy45MDkxSDEwNy44NDNWNDYuMTE5NkgxMTIuOTAxVjEzLjkwOTFaTTg4LjA2NTQgNDEuNDk5M0M4Ni4zOTg3IDM5Ljk5MjYgODUuNDgyNiAzNy42OTY3IDg1LjMxNyAzNC42MTE4Qzg1LjMwNTggMzQuMzM0IDg1LjI5NTEgMzQuMDU4NiA4NS4yODQ2IDMzLjc4NjJDODUuMjU2NCAzMy4wNTU2IDg1LjIyOSAzMi4zNDYgODUuMTkyOCAzMS42NjdDODUuMTQzMSAzMC43MzUgODUuMTQzMSAyOS44MDI5IDg1LjE0MzEgMjguODg3M0M4NS4xNDMxIDI3Ljk3MTcgODUuMTUxNCAyNy4wMzk2IDg1LjE5MjggMjYuMTA3NUM4NS4yMzQyIDI1LjE3NTQgODUuMjc1NiAyNC4xOTM5IDg1LjMxNyAyMy4xNzExQzg1LjQ4MjYgMjAuMDg2MSA4Ni40MDk4IDE3Ljc4NDggODguMDY1NCAxNi4yODM1Qzg5Ljg2NzEgMTQuNzIxMiA5Mi4yMDI4IDEzLjkwOTEgOTQuNTg4OSAxNC4wMTUyQzk1LjgyODMgMTQuMDAyNyA5Ny4wNjE1IDE0LjE5MjIgOTguMjM5NiAxNC41NzYxQzk5LjMxMTEgMTQuOTI4OCAxMDAuMjkyIDE1LjUxMTcgMTAxLjExMiAxNi4yODM1QzEwMS45NTIgMTcuMDkyMiAxMDIuNjA2IDE4LjA3MTEgMTAzLjAzMyAxOS4xNTRDMTAzLjUzNiAyMC40MzYzIDEwMy44MTYgMjEuNzk0OCAxMDMuODYxIDIzLjE3MTFDMTAzLjg2OCAyMy4zMjE4IDEwMy44NzYgMjMuNDcxOSAxMDMuODgzIDIzLjYyMTRDMTAzLjkyNiAyNC40ODY3IDEwMy45NjggMjUuMzMwNSAxMDMuOTY4IDI2LjEzMjNWMjguOTI4NUMxMDMuOTY4IDI5LjIzMTggMTAzLjk3MSAyOS41MzY4IDEwMy45NzQgMjkuODQzMVYyOS44NDQyVjI5Ljg0NTNDMTAzLjk3OSAzMC40NjMgMTAzLjk4NSAzMS4wODU3IDEwMy45NjggMzEuNzA4M0MxMDMuOTQzIDMyLjY0MDQgMTAzLjkxIDMzLjYwNTQgMTAzLjg2MSAzNC42MTE4QzEwMy44MiAzNS45OTM3IDEwMy41NCAzNy4zNTgyIDEwMy4wMzMgMzguNjQ1M0MxMDIuNjAxIDM5LjcyMDQgMTAxLjk0NiA0MC42OTI5IDEwMS4xMTIgNDEuNDk5M0MxMDAuMjkyIDQyLjI3MTEgOTkuMzExMSA0Mi44NTQgOTguMjM5NiA0My4yMDY3Qzk3LjA2MSA0My41ODc5IDk1LjgyNzkgNDMuNzc0NSA5NC41ODg5IDQzLjc1OTRDOTIuMjAzOSA0My44Njc4IDg5Ljg2ODQgNDMuMDU4NiA4OC4wNjU0IDQxLjQ5OTNaTTkwLjgwNTggMjEuNjIwMkM5MC41Njg1IDIyLjU2MzIgOTAuNDI3IDIzLjUyNzYgOTAuMzgzNiAyNC40OTg5QzkwLjI4NDMgMjUuOTA5NCA5MC4yMzQ2IDI3LjM2OTQgOTAuMjM0NiAyOC44ODcxQzkwLjIzNDYgMzAuNDA0OCA5MC4yODQzIDMxLjg3MzEgOTAuMzgzNiAzMy4yODM2QzkwLjQyNyAzNC4yNTIxIDkwLjU2ODQgMzUuMjEzOSA5MC44MDU4IDM2LjE1NDFDOTAuOTY0NyAzNi44MTU3IDkxLjI0NTQgMzcuNDQyMSA5MS42MzM3IDM4LjAwMTdDOTEuOTU3OSAzOC40NDQxIDkyLjM5NTMgMzguNzkxNiA5Mi45MDAzIDM5LjAwODFDOTMuNDI1MyAzOS4yMjE4IDkzLjk4ODkgMzkuMzI1NiA5NC41NTYgMzkuMzEzM0M5NS4xMjI4IDM5LjMyMzYgOTUuNjg2IDM5LjIxOTcgOTYuMjExNiAzOS4wMDgxQzk2LjcxNjYgMzguNzkxNiA5Ny4xNTQgMzguNDQ0MSA5Ny40NzgyIDM4LjAwMTdDOTcuODY2NiAzNy40NDIyIDk4LjE0NzMgMzYuODE1NyA5OC4zMDYxIDM2LjE1NDFDOTguNTQ2NyAzNS4yMTQyIDk4LjY5MDkgMzQuMjUyNSA5OC43MzY2IDMzLjI4MzZDOTguODI3NiAzMS44NzMxIDk4Ljg3NzMgMzAuNDIxMyA5OC44NzczIDI4LjkxMTlDOTguODc3MyAyNy40MDI0IDk4LjgyNzYgMjUuOTI1OSA5OC43MzY2IDI0LjQ5ODlDOTguNjkwOCAyMy41MjczIDk4LjU0NjYgMjIuNTYyOCA5OC4zMDYxIDIxLjYyMDJDOTguMTQ3MyAyMC45NjExIDk3Ljg2NjUgMjAuMzM3MyA5Ny40NzgyIDE5Ljc4MDdDOTcuMTU2NSAxOS4zMzYxIDk2LjcxODMgMTguOTg4IDk2LjIxMTYgMTguNzc0NEM5NS42ODYgMTguNTYyNyA5NS4xMjI4IDE4LjQ1ODkgOTQuNTU2IDE4LjQ2OTJDOTMuOTg4OSAxOC40NTY4IDkzLjQyNTMgMTguNTYwNyA5Mi45MDAzIDE4Ljc3NDRDOTIuMzkzNiAxOC45ODggOTEuOTU1NCAxOS4zMzYxIDkxLjYzMzcgMTkuNzgwN0M5MS4yNDU0IDIwLjMzNzMgOTAuOTY0NiAyMC45NjExIDkwLjgwNTggMjEuNjIwMloiCiAgICAgICAgICAgIGZpbGw9IndoaXRlIiAvPgogICAgPC9nPgogICAgPGRlZnM+CiAgICAgICAgPGNsaXBQYXRoIGlkPSJjbGlwMF8xOTI4XzM0MzU1Ij4KICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjEzMiIgaGVpZ2h0PSI2MCIgZmlsbD0id2hpdGUiIC8+CiAgICAgICAgPC9jbGlwUGF0aD4KICAgIDwvZGVmcz4KPC9zdmc+"
		 									style="width: 50px; height: 30px;"></th></tr>
		 		</table>
		 	<hr>
		 		<table class="table"><!--  table-borderless -->
		 			<tr>
			 			<td><img src="${pageContext.request.contextPath}/resources/img/common/heart.png"> 3</td>
			 			<td><i class="bi bi-eye"></i> 112</td>
			 			<td><i class="bi bi-calendar3"></i>2024/02/06 13:21:33</td>
			 			<td><img src="${pageContext.request.contextPath}/resources/img/board/report.png">신고하기</td>
		 			</tr>
		 			<tr><td colspan="4"><i class="bi bi-stopwatch"></i><span id="timer">타이머 로딩 중...</span> (종료 24/02/15 13:21:33)</td></tr>
		 			<tr>
		 				<td>상품상태:</td>
		 				<td>사용감 적음</td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>교환여부:</td>
		 				<td>교환불가능</td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>배송비:</td>
		 				<td>배송비포함</td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>거래지역:</td>
		 				<td><i class="bi bi-building-check"></i>부산광역시 사하구 하단제2동</td>
		 				<td></td>
		 				<td></td>
		 			</tr>	
		 			<tr>
		 				<td colspan="4">
		 					<button class="btn btn-danger btn-lg">찜</button>
		 					<button class="btn btn-warning btn-lg">경매기록</button>
		 					<button class="btn btn-success btn-lg">입찰하기</button>
		 				</td>
<!-- 			 			<td><button class="btn btn-danger btn-lg">찜</button></td> -->
<!-- 			 			<td><button class="btn btn-warning btn-lg">채팅</button></td> -->
<!-- 			 			<td><button class="btn btn-success btn-lg">바로구매</button></td> -->
<!-- 			 			<td></td> -->
		 			</tr>
		 			<tr><td colspan="4">
		 				<div class="input-group mb-3">
		 					<input class="form-control" type="text" value="" placeholder="직접 가격을 입력하세요.">
		 					<button class="btn btn-outline-secondary" type="button">직접입력</button>
		 				</div>
		 				</td></tr>
		 		</table>
		 	</div>
		 	<div>
		 		<table class="table">
					<tr><td colspan="7">연관상품</td><tr>
					<tr>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 134px; height: 134px;"></td>
					<tr>									 		
		 		</table>
		 	</div>
		 	<div style="width: 70%; height: auto;">
		 		<table class="table">
		 			<tr><td colspan="6">상품 상세 정보</td><tr>
		 			<tr><td colspan="6"><textarea rows="5" cols="100" readonly>따봉도치 트리플입니다. 중고이지만 새 것과 차이나지 않아요.</textarea></td></tr>
		 			<tr style="text-align: center;">
		 				<td colspan="3">거래지역: 전국</td>
		 				<td colspan="3">카테고리: <a href="#">자켓/점퍼</a></td>
		 			</tr>
		 		</table>
		 		<table class="table">
		 			<tr><td colspan="6">입찰자 정보</td><tr>
		 			<tr>
		 				<td colspan="1">입찰자 ID</td>
		 				<td colspan="2">입찰일자</td>
		 				<td colspan="2">입찰가격</td>
		 				<td colspan="1">수량</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치5</td>
		 				<td colspan="2">2024/02/14 11:11:15</td>
		 				<td colspan="2">15000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치4</td>
		 				<td colspan="2">2024/02/14 11:11:14</td>
		 				<td colspan="2">14000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치3</td>
		 				<td colspan="2">2024/02/14 11:11:13</td>
		 				<td colspan="2">13000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치2</td>
		 				<td colspan="2">2024/02/14 11:11:12</td>
		 				<td colspan="2">12000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 			<tr>
		 				<td colspan="1">따봉도치1</td>
		 				<td colspan="2">2024/02/14 11:11:11</td>
		 				<td colspan="2">11000원</td>
		 				<td colspan="1">1개</td>
		 			</tr>
		 		</table>
				 		<div class="d-grid gap-2">
				  <button class="btn btn-secondary" type="button">글 수정</button>
				</div>
		 	</div>
		 	<div style="width: 30%; height: auto;">
		 		<table class="table" style="text-align: center;">
		 			<tr><td colspan="2">게시자 정보</td></tr>
		 			<tr>
		 				<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 60px; height: 60px;"></td>
		 				<td>따봉도치사냥꾼<br>(<small>상품 133</small>)<br>(<small>신뢰도 9.9</small>)</td>
		 			</tr>
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>		 	
		 			<tr>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 				<td class="center-align">
		 					<img alt="" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 150px; height: 150px;">
		 					<div class="img-innertext"><span>10000원</span></div>
		 				</td>
		 			</tr>
		 			<tr>
		 				<td colspan="2"><button class="btn btn-outline-secondary" style="width: 40%;">상품 더보기</button></td>
		 			</tr>
		 			<tr>
		 				<td colspan="2">게시자 후기</td>
		 			</tr>
		 			<tr>
		 				<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 50px; height: 50px;"><br>홍길동</td>
		 				<td>포장이 깔끔해요.상품 설명과 실제 상품이 동일해요.배송이 빨라요.<br>2023.12.26</td>
		 			</tr>
		 			<tr>
		 				<td><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" style="width: 50px; height: 50px;"><br>홍길동</td>
		 				<td>포장이 깔끔해요.상품 설명과 실제 상품이 동일해요.배송이 빨라요.<br>2023.12.26</td>
		 			</tr>
		 			<tr><td colspan="2"><button class="btn btn-outline-secondary">후기 더보기</button></td></tr>
		 			<tr>
		 				<td colspan="2">
		 					<button class="btn btn-warning" style="width: 40%;">신청자 확인</button>
		 					<button class="btn btn-success" style="width: 40%;">나눔신청</button>
		 				</td>
		 			</tr>		 					
		 		</table>
		 	</div>
		</div>

	</div>
</div>
</body>
<script type="text/javascript">
$(() => { // 문서가 완전히 로드되면 함수를 실행합니다.
	$(".carousel-item img").click(function(){
	    let img = new Image();
	    img.src = $(this).attr("src")
	    $('.modalBox').html(img);
	    $(".modal").show();
	});
	// 모달 클릭할때 이미지 닫음
	$(".modal").click(function (e) {
		$(".modal").toggle();
	});
	
    function updateTimer() {
        const now = new Date();
        const targetDate = new Date(2024, 1, 15, 13, 21, 33); // 2월은 1로 표기합니다(월은 0부터 시작).
        const timer = targetDate - now; // 남은 밀리초

        if (timer > 0) {
            // 밀리초를 "일 시 분 초"로 변환
            const days = Math.floor(timer / (1000 * 60 * 60 * 24));
            const hours = Math.floor((timer % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((timer % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((timer % (1000 * 60)) / 1000);
            // 화면에 표시
			$("#timer").text(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초");
        } else {
            // 시간이 만료되었을 경우
            clearInterval(timerInterval);
            $("#timer").text("시간이 만료되었습니다!");
        }
    }

    // 1초마다 updateTimer 함수를 호출하여 타이머 업데이트
    const timerInterval = setInterval(updateTimer, 1000);
});
</script>
<jsp:include page="../template/Footer.jsp"/>
</html>