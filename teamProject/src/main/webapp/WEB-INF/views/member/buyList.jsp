<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 구매목록</title>
<link href="${pageContext.request.contextPath}/resources/css/member/list.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
	<div class="rounded-5 shadow">
	<h3 class="title">구매 내역</h3>
	<hr>
	<div class="tab_wrap" style="padding-top: 1%;">
		<label for="tab1" class="on">판매목록</label>
		<label for="tab2">구매목록</label>
		<label for="tab3">나눔목록</label>
		<label for="tab4">경매목록</label>
	  
	  	<input type="radio" name="tab" id="tab1">
		<input type="radio" name="tab" id="tab2">
		<input type="radio" name="tab" id="tab3">  
		<input type="radio" name="tab" id="tab4">  
	</div><!--tab_wrap-->
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
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>