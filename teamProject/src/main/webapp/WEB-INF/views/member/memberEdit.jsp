<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다모임 | 프로필수정</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/member/memberEdit.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">
<!-- <form action="cus_editPro.cu" method="post" name="cus_edit" enctype="multipart/form-data"> -->
 <div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="/* border: 1px solid black; */ width: 100%; height: 100%; align-items: center;">
			<!--  -->
        	<div class="container rounded-5 shadow" style="height: 100%; width: 700px; padding: 0, 20%, 0, 20%;">
                <form action="memberEditPro" method="post">
                <section class="css-1dk9sr2" style="height: 100%;">
                    <div class="css-312egs">
                        <section class="css-2fvz7x">
                        <h4 style="padding-bottom: 6%; font-family: sans-serif;">프로필 수정</h4>
                        <div>
                        	<!-- 기본사진(프로필 삭제)버튼 -->
                        	<div style="padding-left: 80%;" class="close">&times;</div>
                            <div>
                            <img alt="유저 프로필" loading="lazy" width="130px" height="130px" decoding="async" data-nimg="1" class="css-pq603g" style="color:transparent;" src="${pageContext.request.contextPath}/resources/img/member/profile.png"/>
                            <br>
                       		<button type="button" id="inputBtn" class="btn btn-outline-secondary border px-3 p-1 add-experience shadow" style="font-size: 12px;" onclick="editImage()">
							<i class="fa fa-plus"></i>사진 변경</button>
							</div>
						</div>
						</section>
						<div class="container" style="padding-top: 3%;">
							<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="nick_ed"><b>아이디</b></label>
               					<input type="text" id="MEM_ID" name="MEM_ID" class="form-control" value="${profile.MEM_ID}" readonly="readonly" style="color: gray;"></div>
							<c:choose>
               					<c:when test="${profile.MEM_PW == null || profile.MEM_PW == ''}">
	               					<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="email_ed" hidden=""><b>이메일</b></label>
	               					<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" class="form-control" value="${profile.MEM_EMAIL}" hidden="" readonly="readonly" style="color: gray;"></div>
               					</c:when>
               					<c:otherwise>
	               					<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="email_ed"><b>이메일</b></label>
	               					<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" class="form-control" value="${profile.MEM_EMAIL}" readonly="readonly" style="color: gray;"></div>
               					</c:otherwise>
               				</c:choose>
							
                            <div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="nick_ed"><b>이름</b></label>
               					<input type="text" id="MEM_NAME" name="MEM_NAME" class="form-control" value="${profile.MEM_NAME}" value=""></div>
						
                            <div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="nick_ed"><b>닉네임</b></label><small id="nickCheck" style="text-align: right; float: right;"></small>
               					<input type="text" id="MEM_NICK" name="MEM_NICK" class="form-control" value="${profile.MEM_NICK}" value=""></div>
               				
               				<c:choose>
               					<c:when test="${profile.MEM_PW == null || profile.MEM_PW == ''}">
               						<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="pw_ed" hidden=""><b>비밀번호</b></label>
               						<input type="password" id="MEM_PW" name="MEM_PW" class="form-control" placeholder="변경할 비밀번호를 입력해 주세요." hidden=""></div>
               					</c:when>
               					<c:otherwise>
               						<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="pw_ed"><b>비밀번호</b></label><small id="pwCheck" style="text-align: right; float: right;"></small>
               						<input type="password" id="MEM_PW" name="MEM_PW" class="form-control" placeholder="변경할 비밀번호를 입력해 주세요." value="${profile.MEM_PW}"></div>
               					</c:otherwise>
               				</c:choose>
               				
               				<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="phone_ed"><b>전화번호</b></label>
               					<input type="text" id="MEM_TEL" name="MEM_TEL" class="form-control" value="${profile.MEM_TEL}"></div>
               				
               				<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px;"><label for="phone_ed"><b>생년월일</b></label>
               					<input type="date" id="MEM_BIRTH" name="MEM_BIRTH" class="form-control" value="${profile.MEM_BIRTH}"></div>
               				
               				
               				
<!--                				<div class="col-md-12 mb-4" style="text-align: left; font-size: 13px; padding-bottom: 3%;"><label for="address_ed">주소</label> -->
<!-- 								<div class="input-group"> -->
<!-- 									<input type="text" id="address_ed" name="address_ed" class="form-control" placeholder="주소를 입력해주세요" required> -->
<!-- 									<button type="button" id="search-address" class="btn btn-outline-secondary">주소찾기</button> -->
<!-- 								</div> -->
<!-- 								<div class="input-group"> -->
<!-- 									<input type="text" id="address-detail" name="address-detail" class="form-control" placeholder="상세주소를 입력해주세요"> -->
<!-- 								</div> -->
<!-- 			  				</div> -->
			  				
               			</div>
                           
                    </div>
                    <div class="container" style="padding-left: 6%; padding-right: 6%;">
                    <button type="submit" id="updateBtn" style="font-family: sans-serif;">수정하기</button> 
                    </div>
                    <br>
                    
                </section>
                </form>
			<!--  -->
		</div>
		</div>
	</div>
</div>
</body>

<script>
// //-----------------다음 주소찾기 API------------------
// //주소찾기 버튼 클릭 시 이벤트 처리
// document.getElementById('search-address').addEventListener('click', function() {
// // 다음 우편번호 서비스 실행
// daum.postcode.load(function() {
//  new daum.Postcode({
//    oncomplete: function(data) {
//      // 주소 정보를 가져와서 처리하는 로직 작성
//      document.getElementById('address').value = data.address;
//    }
//  }).open();
// });
// });
</script>
<script src="${pageContext.request.contextPath}/resources/js/member/memberEdit.js"></script>
<jsp:include page="../template/Footer.jsp"/>
</html>