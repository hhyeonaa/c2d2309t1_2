<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 내상품관리</title>
<link href="${pageContext.request.contextPath}/resources/css/member/list.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">


<div style="display: flex; justify-content: center; align-items: center; padding-top: 5%;">
	<div class="rounded-5 shadow">
	<h3 class="title">내 상품 관리</h3>
	<hr>
	<div class="tab_wrap" style="padding-top: 1%;">
		<label for="tab1" class="on">판매</label>
		<label for="tab2">구매</label>
		<label for="tab3">나눔</label>
		<label for="tab4">경매</label>
	  
	  	<input type="radio" name="tab" id="tab1">
		<input type="radio" name="tab" id="tab2">
		<input type="radio" name="tab" id="tab3">  
		<input type="radio" name="tab" id="tab4">  
	</div><!--tab_wrap-->
	
	<div class="tab_content tab_content1">
		<div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
		  <div class="col">
		    <div class="card h-100">
		      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		      <div class="card-body">
			      <span class="state1">판매</span>
			      <span class="state2">판매중</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>제목명</p>
				  <h5><b>10,000원</b></h5>
		      </div>
		    </div>
		  </div>
		</div>
	</div><!--tab_content1-->
	<div class="tab_content tab_content2">
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
		  <div class="col">
		    <div class="card h-100">
		      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		      <div class="card-body">
			      <span class="state1">구매</span>
			      <span class="state2">구매중</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>제목명</p>
				  <h5><b>10,000원</b></h5>
		      </div>
		    </div>
		  </div>
		</div>
	</div><!--tab_content2-->
	<div class="tab_content tab_content3">
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
		  <div class="col">
		    <div class="card h-100">
		      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		      <div class="card-body">
			      <span class="state1">나눔</span>
			      <span class="state2">나눔중</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>제목명</p>
				  <h5><b>10,000원</b></h5>
		      </div>
		    </div>
		  </div>
		</div>
	</div><!--tab_content3-->
	<div class="tab_content tab_content4">
	  <div class="row row-cols-1 row-cols-md-4 g-4" id="likeMain" style="padding-top: 2%;">
		  <div class="col">
		    <div class="card h-100">
		      <img src="../resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		      <div class="card-body">
			      <span class="state1">경매</span>
			      <span class="state2">경매중</span>
			      <span style="float: right; font-size: 23px;"><ion-icon name="heart-outline"></ion-icon></span> <!-- 빈 하트 -->
<!-- 	 		      <ion-icon name="heart-sharp"></ion-icon>  -->
			      <p>제목명</p>
				  <h5><b>10,000원</b></h5>
		      </div>
		    </div>
		  </div>
		</div>
	</div><!--tab_content4-->
	
	</div>
</div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/member/myList.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>