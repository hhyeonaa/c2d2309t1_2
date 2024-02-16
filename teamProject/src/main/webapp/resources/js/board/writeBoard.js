/**
 * 글쓰기 페이지 자바스크립트
 */

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
		var contextPath = getContextPath();
		var formData = new FormData(); // 새로운 FormData 객체를 생성합니다.
		var resultList = []; // 결과를 저장할 배열입니다.
//		formData.append('proName',$('#proName').val());
//		formData.append('proTc',$('#proTc').val());
//		formData.append('category1',$('#category1').val());
//		formData.append('category2',$('#category2').val());
//		formData.append('category3',$('#category3').val());
//		formData.append('itemStatus',$('input[name="itemStatus"]:checked').val());
//		formData.append('proContent',$('#proContent').val());
		// 텍스트 데이터를 JSON 객체로 준비
		var textData = {
		    proName: $('#proName').val(),
		    proTc: $('#proTc').val(),
		    category1: $('#category1').val(),
		    category2: $('#category2').val(),
		    category3: $('#category3').val(),
		    itemStatus: $('input[name="itemStatus"]:checked').val(),
		    proContent: $('#proContent').val()
		};
		
		// JSON 객체를 문자열로 변환하여 formData에 추가
		formData.append('textData', JSON.stringify(textData));
		
		/*파일담기*/
		for (i = 0; i < checkFileList.length; i++) {
		    if (checkFileList[i] !== undefined) { // 'undefined'가 아닌 요소만 확인합니다.
		        for (j = 0; j < checkFileList[i].length; j++) {
		        	resultList.push(checkFileList[i][j]); // 'result' 배열에 요소를 추가합니다.
		        }
		    }
		}
		// 파일 리스트 추가
		for (var i = 0; i < resultList.length; i++) {
			// 각 파일을 'imgs'라는 이름으로 개별적으로 추가합니다.
			// 서버 측에서는 'imgs'라는 이름으로 파일 리스트를 받을 수 있습니다.
			formData.append('imgs', resultList[i]);
		}
		
		for (let key of formData.keys()) {
			console.log(key);
		}
		debugger;
		for (let value of formData.values()) {
			console.log(value);
		}
		
		// `sel_files` 배열에 남아 있는 파일들만 FormData 객체에 추가합니다.
//		$.each(sel_files, function(i, file) {
//			formData.append('files[]', file); // 'files[]'는 서버에서 파일 배열을 받을 때 사용할 이름입니다.
//		});
// 		formData.append("id", $("input[name=id]").val());
		// Ajax를 사용하여 formData를 서버에 제출합니다.
/* 		$.ajax({
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
		}); */
		$.ajax({
			url: contextPath+'/board/writeBoardPro', // 서버 엔드포인트 URL
			type: 'POST',
			data: formData,
			processData: false, // jQuery가 데이터를 처리하지 않도록 설정
			contentType: false // jQuery가 contentType을 설정하지 않도록 설정
		}).done(function(response) {
			// 파일 업로드 성공 시 처리
			console.log('Upload success:', response);
		}).fail(function(jqXHR, textStatus, errorThrown) {
			// 파일 업로드 실패 시 처리
			console.log('Upload error:', textStatus, errorThrown);
		});
	});
	//임시 제출 버튼 만들었을 때 제출을 할 경우 내가 미리보기에서 삭제한 파일들은 업로드 되지 않도록 하기 끝
	//테스트용 버튼 누르면 페이지 정보들 확인하기
	$('#tempSave').on('click',function(){
		var proName = $('#proName').val(); //상품명
		var proTc = $('#proTc').val(); //판매,구매,나눔,경매
		var category1 = $('#category1').val(); //대분류
		var category2 = $('#category2').val(); //중분류
		var category3 = $('#category3').val(); //소분류
		var itemStatus = $('input[name="itemStatus"]:checked').val(); //상품상태
		var proContent = $('#proContent').val(); //상품상세설명
		var resultList = []; // 결과를 저장할 배열입니다.
		debugger;
		for (i = 0; i < checkFileList.length; i++) {
		    if (checkFileList[i] !== undefined) { // 'undefined'가 아닌 요소만 확인합니다.
		        for (j = 0; j < checkFileList[i].length; j++) {
		        	resultList.push(checkFileList[i][j]); // 'result' 배열에 요소를 추가합니다.
		        }
		    }
		}
		var str = '';
		for(i = 0; i < resultList.length; i++){
			str += ('/' + resultList[i].name);
		}
		console.log(str);
		
		alert('proName: ' + proName + ' proTc: ' + proTc + ' category1: ' + category1 + ' category2: ' + category2 + ' category3: ' + category3 +
			' itmeStatus: ' + itemStatus + ' proContent: ' + proContent
		);
	});
	
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

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};