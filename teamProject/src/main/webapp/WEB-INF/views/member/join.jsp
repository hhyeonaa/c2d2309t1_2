<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀중고장터 | 회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

</style>
</head>
<jsp:include page="../template/header.jsp"/>
<body>
<!-- 	<button id="signupButton">회원가입</button> -->
	
	<div id="signupModal" class="modal">
	  <div class="modal-content" style="width: 30%;">
	    <div class="center-align">		
		  <span class="close">&times;</span>
		  <img src="../resources/img/member/logo.ico" alt="로고">
		</div>
	    <h2>회원가입</h2>
	    <!-- 이하 생략 -->
	
	    <form>
	      <div class="form-group">
	        <label for="username">이름</label>
	        <input type="text" id="username" name="username" placeholder="이름을 입력해 주세요." required>
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
	        <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요">
	      </div>
	      <div class="form-group">
			  <label for="gender">성별</label>
			  <div class="input-group">
			    <select id="gender" name="gender" class="form-control" required>
			      <option value="" selected disabled hidden>성별 선택</option>
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
			</div>
			<div class="form-group">
			  <label for="address">상세주소</label>
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
</body>
<script>
// var signupButton = document.getElementById("signupButton");
// var cancelButton = document.getElementById("cancelButton");
var signupModal = document.getElementById("signupModal");
var closeBtn = document.getElementsByClassName("close")[0];

// signupButton.onclick = function() {
//   signupModal.style.display = "block";
// }

// cancelButton.onclick = function() {
//   signupModal.style.display = "none";
// }

closeBtn.onclick = function() {
  signupModal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == signupModal) {
    return false; // 모달 외부를 클릭해도 모달이 닫히지 않도록 함
  }
}
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
</html>