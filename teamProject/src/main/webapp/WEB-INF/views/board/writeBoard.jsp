<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.input-file-button, #att_zone {
/*     display: inline-block; */
}
#att_zone {
/*   width: 660px; */
  width: auto;
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
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="width: 100%;">
			<div class="container">
			  <div class="row">
			    <div class="col-12 d-flex justify-content-between mt-4">
   			      <select id="boardSelect" name="boardSelect" style="width: 100px;">
			      	<option id="sale" value="sale" selected>판매</option>
			      	<option id="buy" value="buy">구매</option>
			      	<option id="divide" value="divide">나눔</option>
			      	<option id="auction" value="auction">경매</option>
			      </select>
			      <h2>상품 등록</h2>
			      <select id="selectPreBoard">
			      	<option value="" selected>임시저장글</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      	<option>[판매] 이거 팜팜팜 24.02.08</option>
			      	<option>[판매] 이거 팜팜팜 24.02.08</option>
			      	<option>[나눔] 이거 눔눔눔 24.02.08</option>
			      	<option>[나눔] 이거 눔눔눔 24.02.08</option>
			      	<option>[경매] 이거 경경경 24.02.08</option>
			      	<option>[경매] 이거 경경경 24.02.08</option>
			      </select>
			    </div>
			  </div>
			  <hr>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <!-- input 요소는 숨겨져 있으므로, label 요소를 중앙 정렬합니다. -->
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
			  <hr>
			<!--   <div class="row"> -->
			<!--     <div class="col-12 d-flex justify-content-center"> -->
			<!--       <input type="text" id="itemNm" name="itemNm" placeholder="상품명을 입력"> -->
			<!--     </div> -->
			<!--   </div> -->
			<div class="row">
<!-- 			    <div class="col-12 d-flex justify-content-center"> -->
			    <div>
					<div class="input-group" style="width: 90%;">
					    <span class="input-group-text" id="basic-addon1">상품명</span>
					    <input type="text" class="form-control" placeholder="상품명 입력" aria-label="ItemName" aria-describedby="basic-addon1">
					</div>
		    	</div>
		  	</div>
		  	<hr>
		  	<div class="row justify-content-center">
			  	<div class="col-1 flex-fill text-center" style="border: 1px solid black; height: 200px;"><table><tr><th>카테고리<br>선택<th></tr></table></div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 200px; overflow: auto;">
					<table>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
						<tr><td><a href="#">남성의류</a></td></tr>
					</table>
				</div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 200px; overflow: auto;">
			  		<table>
			  			<tr><td><a href="#">아우터</a></td></tr>
			  			<tr><td><a href="#">아우터</a></td></tr>
			  			<tr><td><a href="#">아우터</a></td></tr>
			  			<tr><td><a href="#">아우터</a></td></tr>
			  			<tr><td><a href="#">아우터</a></td></tr>
						<tr><td><a href="#">아우터</a></td></tr>
						<tr><td><a href="#">아우터</a></td></tr>			  			
			  		</table>
			  	</div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 200px; overflow: auto;">
					<table>
						<tr><td><a href="#">패딩</a></td></tr>
						<tr><td><a href="#">패딩</a></td></tr>
						<tr><td><a href="#">패딩</a></td></tr>
						<tr><td><a href="#">패딩</a></td></tr>
						<tr><td><a href="#">패딩</a></td></tr>
						<tr><td><a href="#">패딩</a></td></tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
				   	<span>거래지역</span>
				   	<button class="btn btn-outline-secondary">내 위치</button>
				   	<button class="btn btn-outline-secondary">최근 지역</button>
				   	<button class="btn btn-outline-secondary">주소 검색</button>
				   	<button class="btn btn-outline-secondary">지역설정안함</button>
				   	</div>
				</div>
				<div class="col-12 d-flex justify-content-center pt-3">
				<input class="col-9 text-center" type="text" value="" placeholder="거래지역 선택하기" readonly>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
				   	<span>상품 상태</span>
				   	<div>
					   	<input name="itemStatus" id="item1" type="radio" value="새상품">
					   	<label for="item1">새상품<small>(사용하지 않은 상품)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item2" type="radio" value="사용감 없음">
					   	<label for="item2">사용감 없음<small>(사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item3" type="radio" value="사용감 적음">
					   	<label for="item3">사용감 적음<small>(눈에 띄는 흔적이나 얼룩이 약간 있음)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item4" type="radio" value="사용감 많음">
					   	<label for="item4">사용감 많음<small>(눈에 띄는 흔적이나 얼룩이 많이 있음)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item5" type="radio" value="고장/파손 상품">
					   	<label for="item5">고장/파손 상품<small>(기능 이상이나 외관 손상 등으로 수리/수선필요)</small></label>
				   	</div>
				   	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
					   	<span>교환</span>
					   	<div>
						   	<input name="changeItem" id="changeOk" type="radio" value="가능">
						   	<label for="changeOk">가능</label>
					   	</div>
					   	<div>
						   	<input name="changeItem" id="changeNot" type="radio" value="불가능" checked>
						   	<label for="changeNot">불가능</label>
					   	</div>
				   	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<!-- 판매 구매일 때만 보일 것들 시작 -->
				<div id="saleBuy">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">가격</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="ItemCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
		    	<div class="row">
					<div class="mt-3">
						<input name="offeredPrice" id="offeredPrice" type="checkbox" value="제안받기" checked>
					   	<label for="offeredPrice">가격 제안받기</label>
					</div>
		    	</div>
		    	</div>
		    	<!-- 판매 구매일 때만 보일 것들 끝 -->
		    	<!-- 경매일 때만 보일 것들 시작 -->
		    	<div id="auctionOnly" style="display: none;">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">시작가</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="startCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">즉시구매가</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="directCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">최소 입찰가</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="minCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
		    	<span>경매는 글 등록한 후 24시간 동안 진행됩니다.</span>
		    	</div>
		    	<!-- 경매일 때만 보일 것들 끝 -->
		    	<!-- 나눔일 때만 보일 것들 시작 -->
		    	<div id="divideOnly" style="display: none;">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">나눔 조건</span>
						    <input type="text" class="form-control" placeholder="조건 입력" aria-label="divideCondition" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
		    	<span>나눔은 글 작성자 분이 나눔하고 싶은 분에게 먼저 채팅을 거셔야 합니다.</span>
		    	</div>
		    	<!-- 나눔일 때만 보일 것들 끝 -->
		  	</div>
		  	<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
					   	<span>배송비</span>
					   	<div>
						   	<input name="deliveryCharge" id="includeDeliCharge" type="radio" value="포함" checked>
						   	<label for="includeDeliCharge">배송비 포함</label>
					   	</div>
					   	<div>
						   	<input name="deliveryCharge" id="separateDeliCharge" type="radio" value="별도">
						   	<label for="separateDeliCharge">배송비 별도</label>
					   	</div>
				   	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				<div class="mb-3">
					<label for="itemDetail" class="form-label">상세 설명</label>
					<textarea class="form-control" id="itemDetail" rows="5" cols="200" placeholder="구매시기, 브랜드/모델명, 제품의 상태 (사용감, 하자 유무) 등을 입력해 주세요.
서로가 믿고 거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요."></textarea>
				</div>
				<span>0/2000</span>
				</div>
			</div>
			<hr>
<!-- 			<div class="row"> -->
<!-- 				<div class="row"> -->
<!-- 				    <div> -->
<!-- 						<div class="input-group" style="width: 90%;" > -->
<!-- 						    <span class="input-group-text" id="basic-addon1">태그</span> -->
<!-- 						    <input type="text" class="form-control" placeholder="태그 입력" aria-label="InputTag" aria-describedby="basic-addon1"> -->
<!-- 						</div> -->
<!-- 			    	</div> -->
<!-- 		    	</div> -->
<!-- 		    	<div class="row"> -->
<!-- 					<div class="mt-3"> -->
<!-- 						<div><span>태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있어요.</span></div> -->
<!-- 						<div><span>내 상품을 다양한 태그로 표현해 보세요.</span></div> -->
<!-- 						<div><span>사람들이 내 상품을 더 잘 찾을 수 있어요.</span></div> -->
<!-- 						<div><span>상품과 관련 없는 태그를 입력할 경우, 판매에 제재를 받을 수 있어요.</span></div> -->
<!-- 					</div> -->
<!-- 		    	</div> -->
<!-- 		  	</div> -->
<!-- 		  	<hr> -->
			<div class="row">
			    <div>
					<div class="input-group" style="width: 90%;" >
					    <span class="input-group-text" id="basic-addon1">수량</span>
					    <input type="text" class="form-control" placeholder="숫자만 입력" aria-label="InputCount" aria-describedby="basic-addon1">
					</div>
		    	</div>
		  	</div>
		  	<hr>
		  	<div id="noDivide">
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div class="mb-3">
						<input type="checkbox" id="payOk" value="payOk">
						<label for="payOk">안전결제 환영</label>
						<textarea class="form-control" id="itemPay" rows="5" cols="100" readonly>안전결제(OO페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.
내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.
OO페이 배지로 더 많은 관심을 받을 수 있어요.
• 거절 시, 이용 제재가 있을 수 있으니 주의해 주세요.
• OO페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.</textarea>
					</div>
				</div>
			</div>
			</div>
			<div class="row p-3" style="position: sticky; bottom: 0; z-index: 99999; background-color: black;">
			    <div class="d-flex justify-content-evenly">
					<button class="btn btn-light">임시저장</button>
					<button class="btn btn-warning">등록하기</button>
		    	</div>
		  	</div>
						
			</div>
		</div> <!-- border안  -->
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script>
var customSelect2 = function(tag){
	tag.select2({
  		"language": {
    		"noResults": function (params) {
      			return "<b style='color:rgb(220, 20, 60, 0.5);'>찾을 수 없어요 :(</b>";
    		}
  		},
  		escapeMarkup: function (markup) {
        	return markup;
    	}
	});
}
var sel_files = []; // 선택된 파일들을 저장할 배열입니다. 전역변수 선언(배열 확인을 위해)
var checkFileList = [,,,,,,];
$(() => { // 문서가 완전히 로드되면 함수를 실행합니다.
// 	var sel_files = []; // 선택된 파일들을 저장할 배열입니다.
	customSelect2($("#boardSelect"));
	customSelect2($("#selectPreBoard"));
	
// 	$("#boardSelect").select2();
// 	$("#selectPreBoard").select2();
	// 이미지 미리보기를 생성하고 화면에 표시하는 함수입니다.
	function displayImagePreview(file, fileName) {
		var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체를 생성합니다.
		reader.onload = function(e) { // 파일 읽기가 완료되면 실행할 콜백 함수입니다.
		  var img = $('<img/>', { // 이미지 태그를 생성하고 속성을 설정합니다.
			'src': e.target.result, // FileReader가 읽은 파일의 결과(데이터 URL)를 이미지의 src 속성으로 설정합니다.
			'style': 'width:100%;height:100%;' // 이미지 스타일을 설정합니다.
		  });
		
		  var div = $('<div/>', { // 이미지를 담을 div 태그를 생성하고 속성을 설정합니다.
			'style': 'display:inline-block;position:relative;width:150px;height:120px;margin:5px;border:1px solid #00f;' // div 스타일을 설정합니다.
		  }).append(img); // 생성된 이미지 태그를 div에 추가합니다.
		
		  var btn = $('<input/>', { // 삭제 버튼을 위한 input 태그를 생성하고 속성을 설정합니다.
		    'type': 'button', // input 태그의 타입을 'button'으로 설정합니다.
		    'value': 'x', // 버튼에 표시될 텍스트를 'x'로 설정합니다.
		    'style': 'width:30px;height:30px;position:absolute;font-size:24px;right:0px;bottom:90px;background-color:rgba(255,255,255,0.1);color:#f00;font:icon;' // 버튼 스타일을 설정합니다.
		  }).click(function() { // 버튼 클릭 이벤트 핸들러를 설정합니다.  
			  
		    $(this).parent().remove(); // 버튼이 속한 부모 div를 DOM에서 제거합니다.
		    
		    $('#att_zone').find($("input[type=hidden]")).remove();
		    for(var i = 0; i < checkFileList.length; i++){
		    	if(checkFileList[i] === undefined || checkFileList[i].length === 0) continue;
		    	for(var j = 0; j < checkFileList[i].length; j++){
		    		if(checkFileList[i][j].name === fileName){
		    			checkFileList[i].splice(j,1);
		    		}
		    	}
		    }
// 		    sel_files.splice(sel_files.indexof(fileName),1);
// 		    for(var i = 0; i < checkFileList.length; i++){
// 		    	if((checkFileList[i])[0].lastModified === sel_files.lastModified){
// 		    		checkFileList[i] = sel_files;
// 		    	}
// 		    }
		    
// 		    sel_files = sel_files.filter(function() { // 선택된 파일 목록에서 현재 파일을 제거합니다.
// 		    	this;
// 		    	debugger;
// 		      return f.name !== file.name;
// 		    });
		    $("#btnAtt").val("");// 임시추가?
		  });
		
		  div.append(btn); // 생성된 버튼을 div에 추가합니다.
		  $('#att_zone').append(div); // 완성된 div를 페이지의 'att_zone'에 추가합니다.
		  $('#att_zone').append('<input type="hidden" value="' + fileName + '"/>');
		};
		reader.readAsDataURL(file); // FileReader 객체를 사용해 파일을 데이터 URL로 읽습니다.
	}// displayImagePreview()함수 끝
	
	// 이미지가 아닌 파일들을 걸러주는 필터 함수
	function filterNonImageFiles(files) {
		// `Array.prototype.filter` 메서드를 사용하여 이미지 파일만 필터링합니다.
		return Array.from(files).filter(function(file) {
		  // 파일의 `type` 속성을 확인하여 `image/`로 시작하는지 검사합니다.
		  return file.type.match('image.*');
		});
	}// filterNonImageFiles() 함수 끝
	
	// 이미지 파일 개수를 체크하고, 6개를 초과할 경우 경고합니다.(총6개?)
	function checkFileLimit(filesToAdd) {
		//----임시 추가 시작----
		var resultList = []; // 결과를 저장할 배열입니다.
		for (i = 0; i < checkFileList.length; i++) {
		    if (checkFileList[i] !== undefined) { // 'undefined'가 아닌 요소만 확인합니다.
		        for (j = 0; j < checkFileList[i].length; j++) {
		        	resultList.push(checkFileList[i][j]); // 'result' 배열에 요소를 추가합니다.
		        }
		    }
		}
		//----임시 추가 끝----
// 		var totalFiles = sel_files.length + filesToAdd.length; // 기존 파일과 추가될 파일의 총 개수
		var totalFiles = resultList.length + filesToAdd.length;
		if (totalFiles > 6) {
		  alert("최대 6개의 이미지만 업로드할 수 있습니다.");
		  return false; // 파일 추가 작업 중단
		}
		return true; // 파일 추가 작업 계속
	}// checkFileLimit() 함수 끝
	
	// 이미지 파일 크기를 체크하고, 5MB를 초과할 경우 경고합니다.
	function checkFileSize(file) {
		var maxSize = 5 * 1024 * 1024; // 5MB를 바이트 단위로 변환
		if (file.size > maxSize) {
		  alert(file.name + " 파일의 크기가 5MB를 초과합니다.");
		  return false; // 파일 추가 작업 중단
		}
		return true; // 파일 추가 작업 계속
	}// checkFileSize() 함수 끝
	
	// 이미지 이름 중복 체크
//  	function checkDuplicateName(fileName){
// 		debugger;
// 		for (i = 0; i < checkFileList.length; i++) {
// 		    if (checkFileList[i] !== undefined) { // 'undefined'가 아닌 요소만 확인합니다.
// 		        for (j = 0; j < checkFileList[i].length; j++) {
// 		        	if(checkFileList[i][j].name === fileName){
// 		        		//alert("중복된 파일 이름 입니다.");
// 		        		return true;
// 		        	}
// 		        }
// 		    }
// 		}		
// 	} 
 	function checkDuplicateName(fileName) {
 	    const isDuplicate = checkFileList.some(fileGroup => {
 	    	debugger;
 	        return fileGroup && fileGroup.some(file => file.name === fileName);
 	    });

 	    if (isDuplicate) {
 	        return true;
 	    }
 	    return false;
 	}

	
	$(document).on('change', '#btnAtt', function(e) { // 파일 입력 필드에 변화가 있을 때 실행될 이벤트 핸들러를 설정합니다.
		var files = e.target.files; // 사용자가 선택한 파일들을 가져옵니다.
		var imageFiles  = filterNonImageFiles(files);
		// 총 파일 개수를 체크해야겠지?  
		// 파일 개수 체크
		if (!checkFileLimit(imageFiles)) return; // 6개를 초과하면 추가 작업 중단
		   
		console.log("선택된 파일들:");
		sel_files = []; // 이전에 선택된 파일들을 리셋합니다.
		
		$.each(imageFiles , function(i, file) { // 선택된 각 파일에 대해 반복합니다.
			if (!checkFileSize(file)) return; // 5MB를 초과하면 추가 작업 중단
			console.log(file.name + " (" + file.type + ", " + file.size + " bytes)");
			//----- 임시 파일 이름 체크 -----
// 			for (i = 0; i < checkFileList.length; i++) {
// 			    if (checkFileList[i] !== undefined) { // 'undefined'가 아닌 요소만 확인합니다.
// 			        for (j = 0; j < checkFileList[i].length; j++) {
// 			        	if(checkFileList[i][j].name === file.name){
// 			        		return;
// 			        	}
// 			        }
// 			    }
// 			}
			if(checkDuplicateName(file.name)) return;
			//----- 임시 파일 이름 체크 끝-----
			sel_files.push(file); // 현재 파일을 선택된 파일 목록에 추가합니다.
			displayImagePreview(file, file.name); // 현재 파일에 대한 이미지 미리보기를 생성합니다.
		});
		//임시 실험 시작
		for(i = 0; i < checkFileList.length; i++){
			if(checkFileList[i] === undefined || checkFileList[i].length === 0){
				checkFileList[i] = sel_files; 
				break;	
			}
		}
		//임시 실험 끝
	});
	
	$('#att_zone').on('dragenter dragover', function(e) { // 'att_zone'에 파일이 드래그될 때 실행될 이벤트 핸들러를 설정합니다.
		e.stopPropagation(); // 이벤트 전파를 중단합니다.
		e.preventDefault(); // 기본 이벤트 처리를 방지합니다.
	});
	
	$('#att_zone').on('drop', function(e) { // 'att_zone'에 파일이 드롭될 때 실행될 이벤트 핸들러를 설정합니다.
		e.preventDefault(); // 기본 이벤트 처리를 방지합니다.
		var files = e.originalEvent.dataTransfer.files; // 드롭된 파일들을 가져옵니다.
		var imageFiles  = filterNonImageFiles(files);
		// 파일 개수 체크
	    if (!checkFileLimit(imageFiles)) return; // 6개를 초과하면 추가 작업 중단
	    
		console.log("드롭된 파일들:");

		sel_files = []; // 이전에 선택된 파일들을 리셋합니다.
		$('#btnAtt').prop('files', files); // 파일 입력 필드의 파일 목록을 드롭된 파일들로 설정합니다.
		$.each(imageFiles , function(i, file) { // 드롭된 각 파일에 대해 반복합니다.
			if (!checkFileSize(file)) return; // 5MB를 초과하면 추가 작업 중단
			console.log(file.name + " (" + file.type + ", " + file.size + " bytes)");
			//----- 임시 파일 이름 체크 -----
			if(checkDuplicateName(file.name)) return;
			//----- 임시 파일 이름 체크 끝-----
			sel_files.push(file); // 드롭된 파일을 선택된 파일 목록에 추가
			displayImagePreview(file, file.name); // 드롭된 파일에 대한 이미지 미리보기를 생성합니다.
		});
		//임시 실험 시작
		for(i = 0; i < checkFileList.length; i++){
			debugger;
			if(checkFileList[i] === undefined || checkFileList[i].length === 0){
				checkFileList[i] = sel_files; 
				break;	
			}
		}
		//임시 실험 끝
	});
	// 이중포문 달려서 배열 속의 배열의 파일들을 다시 배열에 담는다(임시) 시작
// 	var resultList = []; // 결과를 저장할 배열입니다.
// 	for (i = 0; i < checkFileList.length; i++) {
// 	    if (checkFileList[i] !== undefined) { // 'undefined'가 아닌 요소만 확인합니다.
// 	        for (j = 0; j < checkFileList[i].length; j++) {
// 	        	resultList.push(checkFileList[i][j]); // 'result' 배열에 요소를 추가합니다.
// 	        }
// 	    }
// 	}                           
	// 이중포문 달려서 배열 속의 배열의 파일들을 다시 배열에 담는다(임시) 끝
	
	// 임시 이미지 리셋 버튼
// 	$('#resetImg').on('click', function(){
// 		sel_files = [];
// 		checkFileList = [];
// 		$('#att_zone').find($("div")).remove();
// 		$('#att_zone').find($("input[type=hidden]")).remove();
// 	})
	//임시 제출 버튼 만들었을 때 제출을 할 경우 내가 미리보기에서 삭제한 파일들은 업로드 되지 않도록 하기
	$('#submitBtn').on('click', function(e) { 
		e.preventDefault(); // 폼의 기본 제출 동작을 방지합니다.
		var formData = new FormData(); // 새로운 FormData 객체를 생성합니다.
		
		// `sel_files` 배열에 남아 있는 파일들만 FormData 객체에 추가합니다.
		$.each(sel_files, function(i, file) {
			formData.append('files[]', file); // 'files[]'는 서버에서 파일 배열을 받을 때 사용할 이름입니다.
		});
// 		formData.append("id", $("input[name=id]").val());
		// Ajax를 사용하여 formData를 서버에 제출합니다.
		$.ajax({
			url: 'your-server-endpoint', // 서버 엔드포인트 URL
			type: 'POST',
			data: formData,
			processData: false, // jQuery가 데이터를 처리하지 않도록 설정
			contentType: false, // jQuery가 contentType을 설정하지 않도록 설정
			success: function(response) {
			  // 파일 업로드 성공 시 처리
			  console.log('Upload success:', response);
			},
			error: function(jqXHR, textStatus, errorThrown) {
			  // 파일 업로드 실패 시 처리
			  console.log('Upload error:', textStatus, errorThrown);
			}
		});
	});
	//임시 제출 버튼 만들었을 때 제출을 할 경우 내가 미리보기에서 삭제한 파일들은 업로드 되지 않도록 하기 끝
	
	//셀렉트 박스 변경 시 화면 살짝 변경
	$('#boardSelect').on('change',function(){
		$('#noDivide').show();
		if($(this).val() == 'auction'){
			$('#auctionOnly').show();
			$('#saleBuy').hide();
			$('#divideOnly').hide();
		} else if($(this).val() == 'sale' || $(this).val() == 'buy') {
			$('#saleBuy').show();
			$('#auctionOnly').hide();
			$('#divideOnly').hide();
		} else if($(this).val() == 'divide'){
			$('#divideOnly').show();
			$('#auctionOnly').hide();
			$('#saleBuy').hide();
			$('#noDivide').hide();
		} 
	});
	
});//document ready 끝

</script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>