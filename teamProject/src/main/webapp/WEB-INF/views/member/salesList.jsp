<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 판매내역</title>
<link href="${pageContext.request.contextPath}/resources/css/member/list.css" rel="stylesheet">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
	<div class="rounded-5 shadow">
	<h3 class="title">판매 내역</h3>
	<hr>
	<div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain">
	  <div class="col">
	    <div class="card h-100">
	      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
	      <div class="card-body">
		      <span class="state1">나눔</span>
		      <span class="state2">판매중</span><br>
		      <p>제목명</p>
			  <h5><b>10,000원</b></h5>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col">
	    <div class="card h-100">
	      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
	      <div class="card-body">
		      <span class="state1">나눔</span>
		      <span class="state2">판매중</span><br>
		      <p>제목명</p>
			  <h5><b>10,000원</b></h5>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col">
	    <div class="card h-100">
	      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
	      <div class="card-body">
		      <span class="state1">나눔</span>
		      <span class="state2">판매중</span><br>
		      <p>제목명</p>
			  <h5><b>10,000원</b></h5>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col">
	    <div class="card h-100">
	      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
	      <div class="card-body">
		      <span class="state1">나눔</span>
		      <span class="state2">판매중</span><br>
		      <p>제목명</p>
			  <h5><b>10,000원</b></h5>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col">
	    <div class="card h-100">
	      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
	      <div class="card-body">
		      <span class="state1">나눔</span>
		      <span class="state2">판매중</span><br>
		      <p>제목명</p>
			  <h5><b>10,000원</b></h5>
	      </div>
	    </div>
	</div>
	</div>
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>