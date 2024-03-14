<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>다모임 | 로그인</title>
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
	<div id="container" class="container rounded-5 shadow" style="width: 400px; height: 500px;">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">
		<form action="loginPro" method="post" id="loginForm">
			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle"><img src="../resources/img/member/logo.jpg" alt="로고" style="width: 150px; height: 70px;"></div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<div id="inputBox" style="height: 330px;">
				<div class="input-form-box">
					<input type="text" placeholder="아이디" name="MEM_ID" class="form-control">
				</div>
				<div class="input-form-box">
					<input type="password" placeholder="비밀번호" name="MEM_PW"
						class="form-control">
				</div>
				<!-- 테스트 계정 로그인 -->
<!-- 				<div class="button-login-box"> -->
<!-- 					<button type="submit" class="btn btn-primary btn-xs" -->
<!-- 						style="width: 100%">테스트 계정 로그인</button> -->
<!-- 				</div> -->
				<div class="button-login-box">
					<button type="submit" id="loginBtn" class="btn btn-secondary btn-xs"
						style="width: 100%">로그인</button>
				</div>
				<div class="button-login-box">
					<button type="button" class="btn btn-primary btn-xs" id="signupButton"
						style="width: 100%">이메일로 가입하기</button>  <!-- 회원가입 페이지 이동 -->
				</div>
				<!-- 카카오버튼 --> 	
				<a id="kakao-login-btn" href="javascript:kakaoLogin()" class="w-100 py-2 mb-2 btn btn-warning rounded-3">
						<img src="../resources/img/member/kakao.png" id="image" width="24" height="24"/><span id="span">Kakao로 시작하기</span></a>
				<!-- 네이버 버튼 -->
				<a id="naverIdLogin_loginButton" href="javascript:void(0)" class="w-100 py-2 mb-2 btn btn-success rounded-3">
						<img src="../resources/img/member/naver.png" id="image" width="24" height="24"/><span id="span">Naver로 시작하기</span></a>
				<ion-icon name="lock-closed-outline"></ion-icon>
				<a class="icon-link icon-link-hover mt-2" href="findId">아이디찾기</a> | <!-- 아이디찾기 페이지 이동 id="find_id"-->
				<a class="icon-link icon-link-hover mt-2" href="findPw">비밀번호찾기</a>	 <!-- 비밀번호찾기 페이지 이동 --> 
				<hr>
				<!-- 관리자 로그인 -->
<!-- 				<div style="text-align: right; padding-bottom: 3%;"><a href="adminLogin" id="adminLogin"><small>관리자 <ion-icon name="settings-outline"></ion-icon></small></a></div> -->
				
			</div>
			</form>

		</div>
	</div>
	<!-- 	<button id="signupButton">회원가입</button> -->
	
	<!-- 회원가입 모달 -->
	<div id="signupModal" class="modal">
	  <div class="modal-content" style="width: 30%;">
	    <div class="center-align">		
		  <span class="close">&times;</span>
		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;">
		</div>
	    <h4>회원가입</h4> 
	    <!-- 이하 생략 -->
		<br>
	    <form action="">
	      <div class="form-group" style="float: left; box-sizing: border-box; width: 80%;">
	        <label for="id">아이디</label>
	        <input type="text" id="id" name="id" placeholder="6~12자의 영문, 숫자로만 입력" required>
	      </div>
	      <div class="form-group" style="float: right; box-sizing: border-box; width: 20%;">
	      	<label></label>
	      	<small id="idCheckDiv" style="float: right;"></small>
	        <input type="button" value="중복확인" class="btn btn-outline-secondary btn-xs" id="dup">
	        
	      </div>
	      <div class="form-group">
	        <label for="password">비밀번호</label><small id="pwResult" style="text-align: right; float: right;"></small>
			<input type="password" id="pw" name="pw" placeholder="(영문, 숫자, 특수 문자 포함) 6~14자 입력" onchange="checkPasswdLength()" required>
	      </div>
	      <div class="form-group">
			<label for="confirmPassword">비밀번호 확인</label><small id="pwCheck" style="text-align: right; float: right;"></small>
			<input type="password" id="confirmPw" name="confirmPw" placeholder="비밀번호를 다시 입력해주세요." required>
	      </div>
	      <div class="form-group">
			  <label for="gender">성별</label>
			  <div class="input-group">
			    <select id="gender" name="gender" class="form-control" required>
			      <option value="" selected disabled style="font-size: 14px;">성별 선택</option>
			      <option value="M">남성</option>
			      <option value="F">여성</option>
			      <option value="O">기타</option>
			    </select>
			  </div>
			</div>
	      <div class="form-group" style="width: 47%; float: left; box-sizing: border-box;">
	        <label for="username">이름</label>
	        <input type="text" id="username" name="username" placeholder="이름을 입력해 주세요." required>
	      </div>
	      <div class="form-group" style="width: 47%; float: right; box-sizing: border-box;">
	        <label for="nickname">닉네임</label><small id="nickCheck" style="text-align: right; float: right;"></small>
	        <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해 주세요." required>
      	  </div>
	      <div class="form-group">
	        <label for="birth">생년월일</label>
	        <input type="text" id="birth" name="birth" placeholder="생년월일 8자리" required>
	      </div>
	       <div class="form-group">
	        <label for="email">이메일</label><small id="emailCheck" style="text-align: right; float: right;"></small>
	        <input type="email" id="email" name="email" placeholder="이메일 주소 (비밀번호 찾기 등 본인 확인용)">
	      </div>
	      <div class="form-group">
	        <label for="phone">전화번호</label>
	        <input type="text" id="phone" name="phone" placeholder="(하이픈(-) 제외 입력)">
	      </div>
	     
<!-- 		 <div class="form-group"> -->
<!-- 		   <label for="address">주소</label> -->
<!-- 		   <div class="input-group"> -->
<!-- 			   <input type="text" id="address" name="address" class="form-control" placeholder="주소를 입력해주세요" required> -->
<!-- 			   <button type="button" id="search-address" class="btn btn-outline-secondary">주소찾기</button> -->
<!-- 		   </div> -->
<!-- 		    <div class="input-group"> -->
<!-- 		  	 <input type="text" id="address-detail" name="address-detail" class="form-control" placeholder="상세주소를 입력해주세요"> -->
<!-- 		   </div> -->
<!-- 		 </div> -->
			<hr>
	      <div class="button-group">
	        <input id="insertBtn" type="button" value="회원가입">
	      </div>
	    </form>
	  </div>
	</div>
	
	<!-- 아이디 찾기 모달 -->
<!-- 	<div id="idModal" class="modal" style="padding-top: 5%;"> -->
<!-- 	  <div class="modal-content" style="width: 25%;"> -->
<!-- 	    <div class="center-align">		 -->
<!-- 		  <span class="closeId">&times;</span> -->
<!-- 		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;"> -->
<!-- 		  <hr> -->
<!-- 		</div> -->
<!-- 	    <h4>아이디 찾기</h4> -->
<!-- 	    이하 생략 -->
<!-- 		<br> -->
<!-- 	    <form> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="username">이름</label> -->
<!-- 	        <input type="text" id="username_id" name="username" placeholder="이름을 입력해 주세요." required> -->
<!-- 	      </div> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="birth">생년월일</label> -->
<!-- 	        <input type="text" id="birth_id" name="birth" placeholder="생년월일 8자리" required> -->
<!-- 	      </div> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="email">이메일</label> -->
<!-- 	        <input type="email" id="email_id" name="email" placeholder="이메일 주소를 입력해 주세요." required> -->
<!-- 	      </div> -->
<!-- 	      <div class="button-group"> -->
<!-- 	        <input type="button" value="인증번호 받기" style="width: 100%;" class="test1" id="idNumber"> -->
<!-- 	      </div> -->
<!-- 			<hr> -->
<!-- 		  <div class="form-group"> -->
<!-- 	        <label for="certify" style="width: 100%;">인증번호</label> -->
<!-- 	        <input type="text" id="certify" name="certify" required> -->
<!-- 	      </div> -->
<!-- 	      <div class="button-group"> -->
<!-- 	        <input type="button" value="다음" style="width: 100%;" class="test1" id="idNext"> -->
<!-- 	      </div> -->
<!-- 	    </form> -->
<!-- 	  </div> -->
<!-- 	</div> -->
	
<!-- <!-- 	아이디 찾기 결과 모달 -->
<!-- 	<div id="IdResultModal" class="modal" style="padding-top: 15%;"> -->
<!-- 	  <div class="modal-content" style="width: 25%;"> -->
<!-- 	    <div class="center-align">		 -->
<!-- 		  <span class="closeIdResult">&times;</span> -->
<!-- 		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;"> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<!-- 	    <h4>아이디 찾기 결과</h4> -->
<!-- 	    이하 생략 -->
<!-- 		<hr> -->
<!-- 	    <form> -->
<%-- 		  <h6><b>${findId.MEM_NAME}</b>님의 아이디는 <b><big>[${findId.MEM_ID}]</big></b> 입니다.</h6> --%>
<!-- 		<hr> -->
<!-- 	    </form> -->
<!-- 	  </div> -->
<!-- 	</div> -->
	
		<!-- 비밀번호 찾기 모달 -->
<!-- 	<div id="pwModal" class="modal" style="padding-top: 5%;"> -->
<!-- 	  <div class="modal-content" style="width: 25%;"> -->
<!-- 	    <div class="center-align">		 -->
<!-- 		  <span class="closePw">&times;</span> -->
<!-- 		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;"> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<!-- 	    <h4>비밀번호 찾기</h4> -->
<!-- 	    이하 생략 -->
<!-- 		<br> -->
<!-- 	    <form> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="id">아이디</label> -->
<!-- 	        <input type="text" id="id" name="id" placeholder="아이디를 입력해 주세요." required> -->
<!-- 	      </div> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="username">이름</label> -->
<!-- 	        <input type="text" id="username" name="username" placeholder="이름을 입력해 주세요." required> -->
<!-- 	      </div> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="birth">생년월일</label> -->
<!-- 	        <input type="text" id="birth" name="birth" placeholder="생년월일 8자리" required> -->
<!-- 	      </div> -->
<!-- 	      <div class="form-group"> -->
<!-- 	        <label for="email">이메일</label> -->
<!-- 	        <input type="email" id="email" name="email" placeholder="이메일 주소를 입력해 주세요." required> -->
<!-- 	      </div> -->
<!-- 	      <div class="button-group"> -->
<!-- 	        <input type="button" value="인증번호 받기" style="width: 100%;" class="test2" id="pwNumber"> -->
<!-- 	      </div> -->
<!-- 			<hr> -->
<!-- 		  <div class="form-group"> -->
<!-- 	        <label for="certify" style="width: 100%;">인증번호</label> -->
<!-- 	        <input type="text" id="certify" name="certify" required> -->
<!-- 	      </div> -->
<!-- 	      <div class="button-group"> -->
<!-- 	        <input type="button" value="다음" style="width: 100%;" class="test2" id="pwNext"> -->
<!-- 	      </div> -->
<!-- 	    </form> -->
<!-- 	  </div> -->
<!-- 	</div> -->
	
		<!-- 비밀번호 찾기 결과 모달 -->
<!-- 	<div id="pwResultModal" class="modal" style="padding-top: 10%;"> -->
<!-- 	  <div class="modal-content" style="width: 25%;"> -->
<!-- 	    <div class="center-align">		 -->
<!-- 		  <span class="closePwResult">&times;</span> -->
<!-- 		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;"> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<!-- 	    <h4>새 비밀번호 설정</h4> -->
<!-- 	    이하 생략 -->
<!-- 	    <form> -->
<!-- 		  <div class="modal-body" id="auth-modal-body"> -->
<!-- 			<h6>인증이 정상적으로 완료되었습니다. <br> 새롭게 변경할 비밀번호를 입력해주세요.</h6>&nbsp; -->
<!-- 			<hr> -->
<!-- 		    <div class="form-outline mb-4"> -->
<!-- 				<div style="text-align: left;"><label>새 비밀번호</label></div> -->
<!-- 		    	<input type="password" name="OWN_PW" id="pw" onchange="check_pw()" -->
<!-- 		  		       class="form-control" placeholder="(영문/숫자/특수 포함 8자리 이상)"> -->
<!-- 	        </div> -->
<!-- 			<div class="form-outline mb-4"> -->
<!-- 			    <div style="text-align: left;"><label>새 비밀번호 확인</label> </div> -->
<!-- 			    <input type="password" name="OWN_PWCHECK" id="pw2" onchange="check_pw()" -->
<!-- 			    	   class="form-control" placeholder="비밀번호를 다시 입력해주세요.">&nbsp; -->
<!-- 			    <span id="check"></span> -->
<!-- 			</div> -->
			
<!-- 			<div class="button-group"> -->
<!-- 	        <input type="button" value="변경" style="width: 100%;" class="test1" id="idNumber"> -->
<!-- 	      </div> -->
<!-- 		</div> -->
<!-- 		<hr> -->
<!-- 	    </form> -->
<!-- 	  </div> -->
<!-- 	</div> -->
<!-- 카카오 로그인 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
 	    integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" 
 	    crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 네이버 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
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