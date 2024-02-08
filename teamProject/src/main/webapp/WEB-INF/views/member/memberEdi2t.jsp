<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>꿀당근장터 |</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/member/memberEdit.css" rel="stylesheet">
<body id="body">
<form action="cus_editPro.cu" method="post" name="cus_edit" enctype="multipart/form-data">
<div class="container rounded bg-white mt-5 mb-5">
	<div class="row">
		<div class="col-md-3 border-right">
			<div class="d-flex flex-column align-items-center text-center p-3 py-5">
				<img class="rounded-circle mt-5 mb-3" id="profileImage" src="upload/${customerInfo.CUS_IMAGE}">
				<span class="font-weight-bold">${customerInfo.CUS_NICK}</span>
				<span class="text-black-50">${customerInfo.CUS_EMAIL}</span>
            </div>
		</div>
        <div class="col-md-5 border-right">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right mb-4">고객 정보 설정</h4>
				</div>
                <div class="row mt-3">
               		<div class="col-md-12 mb-4"><label class="labels"><b>이름</b></label>
               			<input type="text" name="CUS_NAME" class="form-control" value="${customerInfo.CUS_NAME}"></div>
               		<div class="col-md-12 mb-4"><label class="labels"><b>닉네임</b></label>
               			<input type="text" name="CUS_NICK" class="form-control" value="${customerInfo.CUS_NICK}"></div>
                    <div class="col-md-12 mb-4"><label class="labels"><b>전화번호</b></label>
                    	<input type="text" name="CUS_TEL" class="form-control" value="${customerInfo.CUS_TEL}"></div>
                    <div class="col-md-12 mb-4"><label class="labels"><b>이메일</b></label>
                    	<input type="text" name="CUS_EMAIL" class="form-control" value="${customerInfo.CUS_EMAIL}"></div>
                    <div class="col-md-12"><label class="labels"><b>생년월일</b></label>
                    	<input type="date" name="CUS_BIRTH" class="form-control" value="${customerInfo.CUS_BIRTH}"></div>
                </div>
			</div>
			<ul class="nav nav-pills nav-justified mb-3">
				<li class="nav-item">
					<a class="nav-link active" id="edit_success" onclick="edit()">저장</a>
				</li>			
				<li class="nav-item">
					<a class="nav-link" id="edit_fail" href="mypage.cu">취소</a>
				</li>
			</ul>
        </div>
        <div class="col-md-4">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center experience">
					<h4 class="text-right mb-4">프로필 이미지 설정</h4>
				</div><br>
				<div class="container-fluid align-items-center">
					<div class="card align-items-center">
						<button type="button" id="inputBtn" class="btn btn-secondary border px-3 p-1 add-experience" onclick="editImage()" >
							<i class="fa fa-plus"></i>&nbsp;사진 선택</button>
							<input type="file" name="CUS_IMAGE" id="CUS_IMAGE" onchange="setThumbnail(event);" hidden=""/>
							<div class="align-items-center text-center" id="image_container">
								<img class="rounded-circle mb-3"name="CUS_IMAGE" id="newImage" src="upload/${customerInfo.CUS_IMAGE}">
							</div><br>
						<button type="button" id="resetBtn" class="btn btn-secondary border px-3 p-1 add-experience"
								onclick="resetImage()">기본 이미지로 변경</button>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
</form>
</body>
<script type="text/javascript">
function edit() {
	document.cus_edit.submit();
}

function editImage() {
	let CUS_IMAGE = document.getElementById("CUS_IMAGE");
	CUS_IMAGE.click();
}

function setThumbnail(event){
	var reader = new FileReader();
	reader.onload = function(event){
		document.getElementById("newImage").src = event.target.result;
	};
	reader.readAsDataURL(event.target.files[0]);
}

function resetImage() {
	// document.getElementById("newImage").src = "upload/profile.png";
	if(confirm("현재 프로필이미지를 삭제하고 기본으로 변경하시겠습니까?")) document.location = 'resetImage.cu';
}
</script>
</html>