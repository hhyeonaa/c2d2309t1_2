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
<title>다모임 | 회원탈퇴</title>
<link href="${pageContext.request.contextPath}/resources/css/member/delete.css" rel="stylesheet">
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
	<div id="container" class="container rounded-5 shadow" style="width: 500px; height: 650px;">
		<!--  login 폼 영역을 : loginBox -->
		<div id="deleteBox">
		<!-- 로그인 페이지 타이틀 -->
		<img src="../resources/img/member/logo.jpg" alt="로고" style="width: 110px; height: 50px;">
		<hr>
		<h4>회원탈퇴</h4>
	    <!-- 이하 생략 -->
		<br>
	    <form action="memberDeletePro" method="post" name="searchForm">
	        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
			  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
			    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			  </symbol>
			</svg>
		     <div class="alert alert-danger d-flex align-items-center" role="alert" style="font-size: 15px;">
				  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
				  	   aria-label="Danger:">
				  <use xlink:href="#exclamation-triangle-fill"/></svg>
		     &nbsp; '회원탈퇴'를 클릭하시면 모든 정보가 삭제됩니다.
		     </div>
		     <div class="form-outline mt-5 mb-3 text-left">
			  	<p><label style="float: left;">본인 계정 확인을 위해 이메일을 입력해 주십시오.</label></p>
			    <p style="padding-top: 2%;"><input type="email" id="MEM_EMAIL" name="MEM_EMAIL" class="form-control" placeholder="이메일 입력" required="required"></p>
			 </div>
		     <div class="form-outline mt-5 mb-3 text-left">
		        <label style="float: left;">서비스를 이용하면서 불편함이 있으셨나요?</label>
				<select name="CUS_REASON" id="MEM_REASON" class="form-select">
					<option selected hidden disabled>회원탈퇴 이유</option>
					<option value="0">다른 계정 이용</option>
					<option value="1">서비스 이용 불편</option>
					<option value="2">사용빈도 적음</option>
					<option value="3">기타</option>
				</select>
			 </div>
			 <div class="modal-footer" id="quit-modal-footer">
		       <button type="submit" id="deleteBtn" class="btn btn-outline-danger">회원탈퇴</button> &nbsp;
		       <button type="button" id="cancelBtn" class="btn btn-outline-secondary">취소</button>     
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