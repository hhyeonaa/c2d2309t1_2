<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Excel 업로드</title>
	<link href="${pageContext.request.contextPath}/resources/css/excel/excelUpload.css" rel="stylesheet">
</head>
<body>
<jsp:include page="template/store_sidebar_open.jsp"/>
<jsp:include page="template/store_sidevar_close.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/excel/excelUpload.js"></script>

	<div class="container">
	    <div class="row align-items-center">
	        <div><h4 class="card-title mb-5"  style="padding-top: 100px;"><b>데이터 업로드</b></h4></div>
	        <div id="selectContainer">
		        <select id="tableSelect" class="form-select">
		        	<option value="NOT TABLE" selected>데이터를 삽입할 테이블을 선택하세요</option>
					<option value="MEMBERS">회원 테이블 (MEMBERS)</option>
					<option value="MEMBER_MANAGE">회원 관리(MEMBER_MANAGE)</option>
					<option value="ADMIN">관리자 테이블(ADMIN)</option>
					<option value="CODE">공통 코드 테이블 (CODE)</option>
				</select>
	        	<div style="font-weight: bold;">테이블을 선택한 후 해당 테이블에 해당하는 양식에 맞춰 올려주세요.</div>
	        </div>
			<div id="uploadContainer">
		        <form id="fileForm" class="" name="fileForm" method="post" enctype="multipart/form-data" onsubmit="return false">
					<input type="file" id="fileInput" class="form-control" name="fileInput">
					<div class="btnBox">
						<button class="btn btn-primary">엑셀 업로드</button>
						<button class="btn btn-danger">초기화</button>	
					</div>
				</form>
			</div>
			<a href=# id="eulTest">테스트</a>
			<div id="contentContainer">
				<div class="noFile">업로드된 파일이 없습니다.</div>
				<div id="grid"></div>
			</div>
		</div>
	</div>
</body>
</html>
