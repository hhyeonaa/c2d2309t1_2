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
<title>000 | 로그인</title>
<link href="../css/member/login.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="css/login.css?v=1234">
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

html, body {
	height: 100%;
	background: #ffffff;
}

#container {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	height: 100%;
}

#loginBox {
	width: 300px;
	text-align: center;
	background-color: #ffffff;
}

.input-form-box {
	border: 0px solid #ff0000;
	display: flex;
	margin-bottom: 5px;
}

.input-form-box>span {
	display: block;
	text-align: left;
	padding-top: 5px;
	min-width: 65px;
}

.button-login-box {
	margin: 10px 0;
}

#loginBoxTitle {
	color: #000000;
	font-weight: bold;
	font-size: 32px;
	text-transform: uppercase;
	padding: 5px;
	margin-bottom: 20px;
	background: linear-gradient(to right, #270a09, #8ca6ce);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

#inputBox {
	margin: 10px;
}

#inputBox button {
	padding: 3px 5px;
}

header {
	background-color: white; 
	padding:0; 
	display: flex; 
	justify-content: center;  
	box-shadow: 0 3px 3px -3px #d8d8d8; 
	height: 100px; 
	z-index:500; 
	height: auto;

}

body {
	padding-top: 15%;
}

.row {
	width: 1080px;
}

.category {
	width: 30px;
	border-radius: 10%;
	font-size: 10pt;
    padding: 1px;
}

#category-ul {
	display: none;
}

#search {
	width: 350px;
}
ul {
 list-style: none;
}
#category:hover ~ #category-ul { 
display: block; 
} 

.menu{
	width: 60px;
}

li {
	width: auto;
	float:left;
}

#button{
	border-color: gray;
	border: none;
}

p {
	margin-bottom: 0;
}

#main {
	width: 1080px;
}

body {
	margin-top: 200px;
	margin: 150px 200px 100px 200px;
	align-items: center;
}

.card {
	width: 250px;
}

#image {
	width: 24px;
	height: 24px;
}

img {
	border: 1px; 
	height: 250px; 
	width: 250px;
}

.card-body {
	height: 100px; 
	width: 250px;
}
.state1 {
	background-color:gray;
	size: 8px;
	color: white;
	border-radius: 10%;
	font-size: 10pt;
    padding-right: 3px;
    padding-left: 3px;
}
.state2 {
	background-color:#EAB2A1;
	size: 8px;
	border-radius: 10%;
	font-size: 10pt;
    padding-right: 3px;
    padding-left: 3px;
}
</style>
</head>
<jsp:include page="../template/header.jsp"/>
<body class="text-center">

	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">
		<form action="loginPro.cu" method="post" id="form">
			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle">꿀중고장터</div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<div id="inputBox" style="height: 200px;">
				<div class="input-form-box">
					<input type="text" placeholder="아이디" name="uid" class="form-control">
				</div>
				<div class="input-form-box">
					<input type="password" placeholder="비밀번호" name="upw"
						class="form-control">
				</div>
				<div class="button-login-box">
					<button type="submit" class="btn btn-secondary btn-xs"
						style="width: 100%">로그인</button>
				</div>
				<div class="button-login-box">
					<button type="button" class="btn btn-primary btn-xs" id="signupButton"
						style="width: 100%" onclick="location.href='join'">이메일로 가입하기</button>  <!-- 회원가입 페이지 이동 -->
				</div>
				<!-- 카카오버튼 --> 
				<a id="kakao-login-btn" href="javascript:loginWithKakao()" class="w-100 py-2 mb-2 btn btn-warning rounded-3">
						<img src="../resources/img/member/kakao.png" id="image" width="24" height="24"/><span id="span">Kakao로 시작하기</span></a>
				<!-- 네이버 버튼 -->
				<a id="naverIdLogin_loginButton" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-success rounded-3">
						<img src="../resources/img/member/naver.png" id="image" width="24" height="24"/><span id="span">Naver로 시작하기</span></a>
						<ion-icon name="lock-closed-outline"></ion-icon>
				<a class="icon-link icon-link-hover mt-2" href="owner_login.ow">아이디찾기</a> | <!-- 아이디찾기 페이지 이동 -->
				<a class="icon-link icon-link-hover mt-2" href="owner_login.ow">비밀번호찾기</a>	 <!-- 비밀번호찾기 페이지 이동 --> 
				
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
<%-- <jsp:include page="../template/Footer.jsp"/> --%>
</html>