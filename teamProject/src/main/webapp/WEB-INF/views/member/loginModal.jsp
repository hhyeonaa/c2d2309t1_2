<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀중고장터 | 로그인</title>
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: #f1f1f1;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 300px;
  border-radius: 5px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.input-group {
  margin-bottom: 15px;
}

.input-group label {
  display: block;
  margin-bottom: 5px;
}

.input-group input {
  width: 100%;
  padding: 8px;
  border-radius: 3px;
  border: 1px solid #ccc;
}

.signup-link {
  text-align: center;
  margin-top: 10px;
}

.signup-link a {
  color: #007bff;
  text-decoration: none;
}

.signup-link a:hover {
  text-decoration: underline;
}

</style>
</head>
<body>
<button id="loginButton">로그인</button>

<div id="loginModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <!-- 로그인 폼 -->
    <form>
      <h2>로그인</h2>
      <div class="input-group">
        <label for="username">사용자명:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="input-group">
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <input type="submit" value="로그인">
    </form>
    <div class="signup-link">
      <p>아직 회원이 아니신가요? <a href="회원가입 페이지 링크">회원가입</a></p>
    </div>
  </div>
</div>
</body>

<script>
	// 로그인 버튼 클릭 시 모달 열기
document.getElementById("loginButton").addEventListener("click", function() {
  document.getElementById("loginModal").style.display = "block";
});

// 모달 닫기 버튼 클릭 시 모달 닫기
document.getElementsByClassName("close")[0].addEventListener("click", function() {
  document.getElementById("loginModal").style.display = "none";
});

</script>
</html>