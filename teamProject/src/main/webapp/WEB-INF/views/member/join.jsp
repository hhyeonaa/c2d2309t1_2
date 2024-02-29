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
<title>다모임 | 관리자로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/member/join.css" rel="stylesheet">
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
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="/*border: 1px solid black;*/ width: 100%; height: 100%; align-items: center;">
			<!--  -->
        	<div class="container rounded-5 shadow" style="height: 830px; width: 600px; padding: 0, 20%, 0, 20%; text-align: center;">
        <div class="center-align">		
		  <span class="close">&times;</span>
		  <img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;">
		</div>
	    <h4>회원가입</h4>
	    <!-- 이하 생략 -->
		<br>
	    <form action="insertPro" method="post">
	      <div class="form-group">
	        <label for="id">아이디</label>
	        <input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디를 입력해 주세요." required>
	      </div>
	      <div class="form-group">
	        <label for="password">비밀번호</label>
			<input type="password" id="MEM_PW" name="MEM_PW" placeholder="(영문/숫자/특수 포함 8자리 이상)" required>
	      </div>
	      <div class="form-group">
			<label for="confirmPassword">비밀번호 확인</label>
			<input type="password" id="confirmPw" name="confirmPw" placeholder="비밀번호를 다시 입력해주세요." required>
	      </div>
	      <div class="form-group">
			  <label for="gender">성별</label>
			  <div class="input-group">
			    <select id="MEM_GENDER" name="MEM_GENDER" class="form-control" required>
			      <option value="" selected disabled style="font-size: 14px;">성별 선택</option>
			      <option value="M">남성</option>
			      <option value="F">여성</option>
			      <option value="O">기타</option>
			    </select>
			  </div>
			</div>
	      <div class="form-group" style="width: 47%; float: left; box-sizing: border-box;">
	        <label for="username">이름</label>
	        <input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="이름을 입력해 주세요." required>
	      </div>
	      <div class="form-group" style="width: 47%; float: right; box-sizing: border-box;">
	        <label for="nickname">닉네임</label>
	        <input type="text" id="MEM_NICK" name="MEM_NICK" placeholder="닉네임을 입력해 주세요." required>
      	  </div>
	      <div class="form-group">
	        <label for="birth">생년월일</label>
	        <input type="text" id="MEM_BIRTH" name="MEM_BIRTH" placeholder="생년월일 8자리" required>
	      </div>
	      <div class="form-group">
	        <label for="phone">전화번호</label>
	        <input type="text" id="MEM_TEL" name="MEM_TEL" placeholder="(하이픈(-) 제외 입력)">
	      </div>
	      <div class="form-group">
	        <label for="email">이메일</label>
	        <input type="email" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="[선택] 이메일주소 (비밀번호 찾기 등 본인 확인용)">
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
	        <input id="insertBtn" type="submit" value="회원가입">
	      </div>
	    </form>
	  </div>
	</div>
			<!--  -->
		</div>
		</div>
	</div>
</div>
</body>

<script src="${pageContext.request.contextPath}/resources/js/member/login.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/member/login.js"></script> --%>
<%-- <jsp:include page="../template/Footer.jsp"/> --%>
</html>