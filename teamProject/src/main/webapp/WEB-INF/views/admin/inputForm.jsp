<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   			      <select id="proTc" name="proTc" style="width: 100px;">
			      	<option id="sale" value="판매" selected>판매</option>
			      	<option id="buy" value="구매">구매</option>
			      	<option id="divide" value="나눔">나눔</option>
			      	<option id="auction" value="경매">경매</option>
			      </select>
			      <input type="hidden" id="proWr" name="proWr" value="${sessionScope.MEM_ID}">
			      <h2>상품 등록</h2>
			      <select id="selectPreBoard">
			      	<option value="" selected>임시저장글</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      </select>
			    </div>
			  </div>
			  
			 <hr>

			 <!-- -----------------test용 ------------------------- --> 
			  
			<div>
				<text-input name="상품명" id="subject" />
				<text-input name="가격" id="price" />
				<textarea-input name="상세설명" id="content" />
				<radio-input name="상품 상태" id="state" />
				<select-input name="카테고리 선택" id="category" />
				<address-input name="거래 지역" id="address" />
				<image-input name="상품 이미지 등록" id="image" />
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin/inputForm.js"></script>
<script>
	customElements.define('text-input', TextInput);
	customElements.define('textarea-input', TextareaInput);
	customElements.define('radio-input', RadioInput);
	customElements.define('select-input', SelectInput);
	customElements.define('address-input', AddressInput);
	customElements.define('image-input', ImageInput);

	
	
$(function(){
	$('#insertBtn').on('click', function() {
		console.log($('#subject').val());
		console.log($('#price').val());
		console.log($('#content').val());
		console.log($('input[id="state"]:checked').val());
		console.log($('select[id=category]').val());
		console.log($('#address').val());
		debugger;
// 		$.ajax({
// 			type: "post"
// 			, url: "insertFormPro"
// 			, data: {PRO_NAME: $('#subject').val(),
// 					 PRO_PRICE: $('#price').val(),
// 					 PRO_CONTENT: $('#content').val(),
// 					 PRO_STATUS: $('input[id="state"]:checked').val(),
// 					 PRO_CATE: $('select[id=category]').val(),
// 					 PRO_ADDRESS: $('#address').val() }
// 		})
// 		.done(function(data){
// 			debugger;
// 		});
	});
});
	
</script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>