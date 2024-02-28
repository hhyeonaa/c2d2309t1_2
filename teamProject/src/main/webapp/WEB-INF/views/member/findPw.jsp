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
<title>다모임 | 비밀번호찾기</title>
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
		<img src="../resources/img/member/logo.jpg" alt="로고" style="width: 150px; height: 70px;">
		<h4>비밀번호 찾기</h4>
	    <!-- 이하 생략 -->
		<br>
	    <form>
	      <div class="form-group">
	        <label for="id">아이디</label>
	        <input type="text" id="id" name="MEM_ID" placeholder="아이디를 입력해 주세요." required>
	      </div>
	      <div class="form-group">
	        <label for="username">이름</label>
	        <input type="text" id="username" name="MEM_NAME" placeholder="이름을 입력해 주세요." required>
	      </div>
	      <div class="form-group">
	        <label for="email">이메일</label>
	        <input type="email" id="email" name="MEM_EMAIL" placeholder="이메일 주소를 입력해 주세요." required>
	      </div>
	      <div class="button-group">
	        <input type="button" value="인증번호 받기" style="width: 100%;" class="test2" id="pwNumber">
	      </div>
			<hr>
		  <div class="form-group">
	        <label for="certify" style="width: 100%;">인증번호</label>
	        <input type="text" id="certify" name="certify" required>
	      </div>
	      <div class="button-group">
	        <input type="button" value="다음" style="width: 100%;" class="test2" id="pwNext">
	      </div>
	      <br>
	      <div style="text-align: right;"><a href="login"><ion-icon name="arrow-back-outline"></ion-icon></a></div>
	      
	      <!-- 비밀번호 찾기 결과 모달 -->
	<div id="pwResultModal" class="modal" style="padding-top: 10%;">
	  <div class="modal-content" style="width: 25%;">
	    <div class="center-align">		
		  <span class="closePwResult">&times;</span>
		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;">
		</div>
		<hr>
	    <h4>새 비밀번호 설정</h4>
	    <!-- 이하 생략 -->
		  <div class="modal-body" id="auth-modal-body">
			<h6>인증이 정상적으로 완료되었습니다. <br> 새롭게 변경할 비밀번호를 입력해주세요.</h6>&nbsp;
			<hr>
		    <div class="form-outline mb-4">
				<div style="text-align: left;"><label>새 비밀번호</label></div>
		    	<input type="password" name="OWN_PW" id="pw" onchange="check_pw()"
		  		       class="form-control" placeholder="(영문/숫자/특수 포함 8자리 이상)">
	        </div>
			<div class="form-outline mb-4">
			    <div style="text-align: left;"><label>새 비밀번호 확인</label> </div>
			    <input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()"
			    	   class="form-control" placeholder="비밀번호를 다시 입력해주세요.">&nbsp;
			    <span id="check"></span>
			</div>
			
			<div class="button-group">
	        <input type="button" value="변경" style="width: 100%;" class="test1" id="idNumber">
	      </div>
		</div>
	   </div>
	  </div>
	    </form>
	  </div>
	</div>
	
	
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