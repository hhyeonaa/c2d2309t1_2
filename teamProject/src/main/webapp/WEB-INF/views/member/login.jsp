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
<title>000 | 로그인</title>
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
						style="width: 100%" onclick="loc'">이메일로 가입하기</button>  <!-- 회원가입 페이지 이동 -->
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
	<!-- 	<button id="signupButton">회원가입</button> -->
	
	<div id="signupModal" class="modal">
	  <div class="modal-content" style="width: 30%;">
	    <div class="center-align">		
		  <span class="close">&times;</span>
		  <img src="../resources/img/member/logo.ico" alt="로고">
		</div>
	    <h4>회원가입</h4>
	    <!-- 이하 생략 -->
		<br>
	    <form>
	      <div class="form-group">
	        <label for="id">아이디</label>
	        <input type="text" id="id" name="id" placeholder="아이디를 입력해 주세요." required>
	      </div>
	      <div class="form-group">
	        <label for="password">비밀번호</label>
			<input type="password" id="password" name="password" placeholder="(영문/숫자/특수 포함 8자리 이상)" required>
	      </div>
	      <div class="form-group">
			<label for="confirmPassword">비밀번호 확인</label>
			<input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호를 다시 입력해주세요" required>
	      </div>
	      <div class="form-group">
	        <label for="email">이메일</label>
	        <input type="email" id="email" name="email" placeholder="[선택] 이메일주소 (비밀번호 찾기 등 본인 확인용)">
	      </div>
	      <div class="row" style="width: 515px;">
	      <div class="form-group col-md-6">
	        <label for="username">이름</label>
	        <input type="text" id="username" name="username" placeholder="이름을 입력해 주세요." required>
	      </div>
	      <div class="form-group col-md-6">
	        <label for="nickname">닉네임</label>
	        <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해 주세요." required>
      	  </div>
      	  </div>
	      <div class="form-group">
	        <label for="birth">생년월일</label>
	        <input type="text" id="birth" name="birth" placeholder="생년월일 8자리" required>
	      </div>
	      <div class="form-group">
	        <label for="nickname">닉네임</label>
	        <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해 주세요." required>
	      </div>
	      <div class="form-group">
			  <label for="gender">성별</label>
			  <div class="input-group">
			    <select id="gender" name="gender" class="form-control" required>
			      <option value="" selected disabled style="font-size: 14px;">성별 선택</option>
			      <option value="male">남성</option>
			      <option value="female">여성</option>
			      <option value="other">기타</option>
			    </select>
			  </div>
			</div>
		  
			<div class="form-group">
			  <label for="address">주소</label>
			  <div class="input-group">
				  <input type="text" id="address" name="address" class="form-control" placeholder="주소를 입력해주세요" required>
				  <button type="button" id="search-address" class="btn btn-outline-secondary">주소찾기</button>
			  </div>
			  <div class="input-group">
			  	<input type="text" id="address-detail" name="address-detail" class="form-control" placeholder="상세주소를 입력해주세요">
			  </div>
			</div>
			<hr>
	      <div class="button-group">
	        <input type="submit" value="회원가입">
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

// 이메일로 가입하기 버튼 클릭 시 모달 열기
document.getElementById("signupButton").addEventListener("click", function() {
  document.getElementById("signupModal").style.display = "block";
});

// x버튼 클릭 시 모달 종료
$('.close').on('click', function(){
	signupModal.style.display = "none";	
});

</script>
<script>
// 주소찾기 버튼 클릭 시 이벤트 처리
document.getElementById('search-address').addEventListener('click', function() {
  // 다음 우편번호 서비스 실행
  daum.postcode.load(function() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 주소 정보를 가져와서 처리하는 로직 작성
        document.getElementById('address').value = data.address;
      }
    }).open();
  });
});
</script>

<script>

// 이메일로 가입하기 버튼 클릭 시 모달 열기
document.getElementById("signupButton").addEventListener("click", function() {
  document.getElementById("signupModal").style.display = "block";
});

// x버튼 클릭 시 모달 종료
$('.close').on('click', function(){
	signupModal.style.display = "none";	
});

</script>
<script>
// 주소찾기 버튼 클릭 시 이벤트 처리
document.getElementById('search-address').addEventListener('click', function() {
  // 다음 우편번호 서비스 실행
  daum.postcode.load(function() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 주소 정보를 가져와서 처리하는 로직 작성
        document.getElementById('address').value = data.address;
      }
    }).open();
  });
});
</script>
<%-- <jsp:include page="../template/Footer.jsp"/> --%>
</html>