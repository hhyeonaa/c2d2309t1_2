<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<title>글쓰기 입력폼 TEST</title>
<style>
span {
	font-weight: bold;
}


.input-file-button, #att_zone {
/*     display: inline-block; */
}
#att_zone {
/*   width: 660px; */
/*   width: auto; */
  min-height: 150px;
  padding: 10px;
  border: 1px dotted #00f;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}

#input-file-button{
  padding: 10px 25px;
  background-color: white;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

</style>
</head>
<jsp:include page="../template/header.jsp"/>s
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

<!-- 	<form action="" method="post" enctype="multipart/form-data"> -->
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="width: 100%;">
			<div class="container">
			  <div class="row">
			    <div class="col-12 d-flex justify-content-between mt-4">
				<select id="proTc" class="form-select" name="proTc" style="width: 100px;">
				    <c:forEach var="menu" items="${menu}">
				    <c:set var="menuCode" value="${menu.CO_TYPE}${menu.CO_NO}" />
				        <c:choose>
				            <c:when test="${menuCode eq resultMap.PRO_TC}">
				                <option value="${menu.CO_TYPE}${menu.CO_NO}" selected>${menu.CODE}</option>
				            </c:when>
				            <c:otherwise>
				                <option value="${menu.CO_TYPE}${menu.CO_NO}">${menu.CODE}</option>
				            </c:otherwise>
				        </c:choose>
				    </c:forEach>
				</select>
			      <c:if test="${empty resultMap.PRO_DATE}">
				  <input type="hidden" id="proTsc" name="proTsc" value="">
				  <h2>상품 등록</h2>					
			      </c:if>
			      <c:if test="${!empty resultMap.PRO_DATE}">
				  <input type="hidden" id="proTsc" name="proTsc" value="${resultMap.PRO_TSC}">					
			      <h2>상품 수정</h2>
			      </c:if>
			      <input type="hidden" id="proWr" name="proWr" value="${sessionScope.MEM_ID}">
			      <select id="selectPreBoard">
			      	<option value="" selected>임시저장글</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      </select>
			    </div>
			  </div>
			  
			 <hr>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <label class="btn btn-warning input-file-button" for="btnAtt" id="input-file-button"><img src="${pageContext.request.contextPath}/resources/img/board/addPhoto.png"></label>
			      <input type='file' id='btnAtt' multiple style="display: none;"/>
			      <button id="resetImg"><i class="bi bi-trash"></i></button>
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <div id='att_zone' class="mt-3" data-placeholder="파일을 첨부 하려면 이미지등록 버튼을 클릭하거나 드래그앤드롭 하세요 이미지 총 6장까지 하나당 5mb까지"></div>
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center pt-3">
			      <p></p>
			    </div>
			  </div>
			  
			  
			 <!-- -----------------test용 ------------------------- --> 
			<div id='formDiv'>
			</div>  
			
			<!-- ---------------------------------------------------------------- -->
			
			
			
			
			<div class="row p-3" style="position: sticky; bottom: 0; z-index: 99999; background-color: black;">
			    <div class="d-flex justify-content-evenly">
					<button class="btn btn-light" id="tempSave">임시저장</button>
					<button class="btn btn-warning" id="insertBtn">등록하기</button>
		    	</div>
		  	</div>

			</div>
		</div>
	</div>
<!-- 	</form> -->
</div>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/writeBoard.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/inputForm.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var trade = '${trade}';
// 	var menu = '${menu}';
// 	var category = '${category}';
	
	customElements.define('text-input', TextInput);
	customElements.define('textarea-input', TextareaInput);
	customElements.define('radio-input', RadioInput);
	customElements.define('select-input', SelectInput);
	customElements.define('address-input', AddressInput);
// 	customElements.define('image-input', ImageInput);

	
	
$(function(){
	$.ajax({
		type: 'get'
		, url : 'getForm'
		, datatype : 'json'
	})
	.done(function(data){
		console.log(data);
		for(i = 0; i < data.length; i++){
			$('#formDiv').append('<' + data[i].CO_DETAIL + '-input name=' + data[i].formName + ' id-data=' + data[i].formID + ' />');
		}
	});
	
// 	$('#insertBtn').on('click', function() {
// 		console.log($("#content").attr("id-data"));
// 		$.ajax({
// 			type: 'post'
// 			, url: 'inputFormPro'
// 			, data: {
// 				PRO_TC: $('select[id=proTc]').val()
// 				, PRO_NAME: $('#subject').val()
// 				, PRO_PRICE: $('#price').val()
// 				, PRO_CONTENT: $('#content').val()
// 				, PRO_STATUS: 'PS' + $('input[id="state"]:checked').val()
// 				, PRO_CATE: 'CA' + $('select[id=category]').val()
// 				, PRO_ADDRESS: $('label[id="address"]').text()
// 				, PRO_IMAGE: $('#image-in').val()}
// 		})
// 		.done(function(data){
// 			location.replace('board/main');
// 		});
// 	});
});
	
</script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>