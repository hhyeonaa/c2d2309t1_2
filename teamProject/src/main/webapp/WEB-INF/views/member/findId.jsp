<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>다모임 | 아이디찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/member/find.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="css/login.css?v=1234">

</head>
<jsp:include page="../template/header.jsp"/>
<body class="text-center">

	<!--  html 전체 영역을 지정하는 container -->
	<div id="container" class="container rounded-5 shadow" style="width: 450px; height: 650px;">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">
		<!-- 로그인 페이지 타이틀 -->
		<img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;">
		<hr>
		<h4>아이디 찾기</h4>
	    <!-- 이하 생략 -->
		<br>
	    <form action="findIdPro" method="post" name="searchForm">
	    <c:set var="searchInfo" value="${requestScope.authCheck}"/>
	      <div class="form-group">
	        <label for="username">이름</label>
	        <input type="text" id="username" name="MEM_NAME" placeholder="이름을 입력해 주세요." value="${findId.MEM_NAME}" required>
	      </div>
	      <div class="form-group">
	        <label for="email">이메일</label>
	        <input type="email" id="email" name="MEM_EMAIL" placeholder="이메일 주소를 입력해 주세요." value="${findId.MEM_EMAIL}" required>
	      </div>
	      <div class="button-group">
	        <input type="submit" value="인증번호 받기" style="width: 100%;" class="test1" id="idNumber">
	      </div>
	       
			<hr>
		  <div class="form-group">
	        <label for="certify" style="width: 100%;">인증번호</label>
	        <input type="text" id="authCode" name="authCode">
	      </div>
	      <div class="button-group">
	        <input type="button" value="다음" style="width: 100%;" class="test1" id="authBtn">
	      </div>
	      <br>
	      <div style="text-align: right;" ><a href="login"><ion-icon name="arrow-back-outline"></ion-icon></a></div>
	      
	      <!-- 	<!-- 아이디 찾기 결과 모달 -->
	<div id="IdResultModal" class="modal" style="padding-top: 15%;">
	  <div class="modal-content" style="width: 25%;">
	    <div class="center-align">		
		  <span class="closeIdResult">&times;</span>
		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;">
		</div>
		<hr>
	    <h4>아이디 찾기 결과</h4>
		<hr>
		 <h6><b>${findId.MEM_NAME}</b>님의 아이디는 <b><big>[ ${findId.MEM_ID} ]</big></b> 입니다.</h6>
		<hr>
		<div style="align-items: center;">
			<input type="button" value="확인" style="width: 100px;" class="test1" id="authOk">
		</div>
	  </div>
	</div>
	   </form>

		</div>
	</div>
	<br>
	
	
	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
	


</body>
<script>
	var AuthNumber = '<%=(String)session.getAttribute("AuthNumber")%>';
</script>
<%
	session.removeAttribute("AuthNumber");
	session.removeAttribute("authCheck");
%>
<script src="${pageContext.request.contextPath}/resources/js/member/find.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>