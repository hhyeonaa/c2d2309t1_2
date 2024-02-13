// ------------------이메일로 가입하기------------------
// 이메일로 가입하기 버튼 클릭 시 모달 열기
document.getElementById("signupButton").addEventListener("click", function() {
  document.getElementById("signupModal").style.display = "block";
});

// x버튼 클릭 시 모달 종료
$('.close').on('click', function(){
	signupModal.style.display = "none";	
});


// -----------------다음 주소찾기 API------------------
// 주소찾기 버튼 클릭 시 이벤트 처리
$('#search-address').on('click', function() {
	
});
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


// -----------------아이디 찾기------------------
// 아이디 찾기 버튼 클릭 시 모달 열기
function findId(){
	document.getElementById("idModal").style.display = "block";
}

// x버튼 클릭 시 모달 종료
$('.closeId').on('click', function closeId(){
	idModal.style.display = "none";	
});


// -----------------아이디 찾기 결과------------------
// 다음 버튼 클릭 시 모달 열기
document.getElementById("idNext").addEventListener("click", function() {
  idModal.style.display = "none";
  document.getElementById("IdResultModal").style.display = "block";
});

// x버튼 클릭 시 모달 종료
$('.closeIdResult').on('click', function(){
	IdResultModal.style.display = "none";	
});


// -----------------비밀번호 찾기------------------
// 비밀번호 찾기 버튼 클릭 시 모달 열기
function findPw(){
	document.getElementById("pwModal").style.display = "block";
}

// x버튼 클릭 시 모달 종료
$('.closePw').on('click', function closePw(){
	pwModal.style.display = "none";	
});


// -----------------비밀번호 찾기 결과------------------
// 다음 버튼 클릭 시 모달 열기
document.getElementById("pwNext").addEventListener("click", function() {
  pwModal.style.display = "none";
  document.getElementById("pwResultModal").style.display = "block";
});

// x버튼 클릭 시 모달 종료
$('.closePwResult').on('click', function(){
	pwResultModal.style.display = "none";	
});


