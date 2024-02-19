<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>다모임 | 관리자로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/member/login.css" rel="stylesheet">
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
	<div id="container" class="container rounded-5 shadow" style="padding-bottom: 5%; width: 400px; height: 350px;">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">
		<form action="adminLoginPro" method="post" id="form">
			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle"><img src="../resources/img/member/logo.jpg" alt="로고" style="width: 150px; height: 70px;"></div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<div id="inputBox" style="height: 50px;">
				<div class="input-form-box">
					<input type="text" placeholder="아이디" name="AD_ID" id="AD_ID" class="form-control">
				</div>
				<div class="input-form-box">
					<input type="password" placeholder="비밀번호" name="AD_PW" id="AD_PW"
						class="form-control">
				</div>
				<div class="button-login-box">
					<button type="submit" class="btn btn-dark btn-xs" id="adminLoginBtn"
						style="width: 100%">관리자 로그인</button>
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

<script src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>
<%-- <jsp:include page="../template/Footer.jsp"/> --%>
</html>