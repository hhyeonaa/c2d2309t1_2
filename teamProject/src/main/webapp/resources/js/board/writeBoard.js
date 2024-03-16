/**
 * 글쓰기 페이지 자바스크립트
 */
 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');

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
	customSelect2($("#category1"));
	
    var proTcValue = $('#proTc').val();
    
    if (proTcValue == 'MM4') {
        $('#noDivide').show();
        $('#auctionOnly').show();
        $('#saleBuy').hide();
        $('#divideOnly').hide();
        $('#tempSave').attr('id', 'aTempSave');
    } else if (proTcValue == 'MM1' || proTcValue == 'MM2' || proTcValue == 'MM3') {
        $('#noDivide').show();
        $('#saleBuy').show();
        $('#auctionOnly').hide();
        $('#divideOnly').hide();
        $('#aTempSave').attr('id', 'tempSave');
    }
    
    $('#proTc').on('change', function() {
        $('#noDivide').show();
        
        if ($(this).val() == 'MM4') {
            $('#auctionOnly').show();
            $('#saleBuy').hide();
            $('#divideOnly').hide();
            $('#tempSave').attr('id', 'aTempSave');
        } else if ($(this).val() == 'MM1' || $(this).val() == 'MM2' || $(this).val() == 'MM3') {
            $('#saleBuy').show();
            $('#auctionOnly').hide();
            $('#divideOnly').hide();
            $('#aTempSave').attr('id', 'tempSave');
        }
    });
	
	//<br> => enter
//	var text = $('#itemPay').val();
//	text = text.split('<br>').join("\r\n");
//	$('#itemPay').val(text);
	
	var IsOldImgs = $('#oldImgs').val();
	var arr = [];
	var fArr = [];
	if(IsOldImgs != ''){
		var imgs = IsOldImgs.split('|');
		imgs.forEach(function(imgUrl) {
        	displayImageFromUrl(imgUrl, imgUrl);
//        	checkFileList[0].push(imgUrl)
			arr.push(imgUrl);
        });
		//aert(imgs);
		checkFileList[0] = arr;
		
	    // img src를 파일로 
		async function fetchImageAndCreateFiles(arr) {
		    let files = []; // 파일 객체들을 저장할 배열 초기화
		    for (var i in arr) {
		        try {
		            const response = await fetch('../resources/img/uploads/' + arr[i]); // 이미지 파일 데이터를 로드
		            const blob = await response.blob(); // 로드된 데이터를 Blob 객체로 변환
		
		            const filename = arr[i]; // 파일 이름 지정
		            const file = new File([blob], filename, {type: "image/png"}); // 파일 객체 생성
		  
		            // 파일 객체 정보 출력 (예시)
		            console.log("File name: " + file.name);
		            console.log("File type: " + file.type);
		            console.log("File size: " + file.size + " bytes");
		
		            files.push(file); // 생성된 파일 객체를 배열에 추가
		        } catch (error) {
		            console.error("Error fetching image and creating file:", error);
		        }
		    }
		
		    return files; // 모든 파일 객체가 포함된 배열 반환
		}
		
		// 함수 실행 및 결과 처리
		fetchImageAndCreateFiles(arr).then(files => {
		    files.forEach(file => {
		        // 여기서 각 파일 객체를 다룰 수 있습니다.
		        console.log(file);
		        fArr.push(file);
		    });
		    checkFileList[0] = fArr;
		});


	}
// 	$("#boardSelect").select2();
// 	$("#selectPreBoard").select2();
	// 글 수정 시 이미지 미리보기
	function displayImageFromUrl(imageUrl, fileName) {
	    var img = $('<img/>', {
	        'src': "../resources/img/uploads/"+imageUrl, // 기존의 이미지 URL을 사용
	        'style': 'width:100%;height:100%;'
	    });
	
	    var div = $('<div/>', {
	        'style': 'display:inline-block;position:relative;width:150px;height:120px;margin:5px;border:1px solid #00f;'
	    }).append(img);
	
	    var btn = $('<input/>', {
	        'type': 'button',
	        'value': 'x',
	        'style': 'width:30px;height:30px;position:absolute;font-size:24px;right:0px;bottom:90px;background-color:rgba(255,255,255,0.1);color:#f00;font:icon;' // 버튼 스타일을 설정합니다.
	    }).click(function() {
	        $(this).parent().remove();
		    $('#att_zone').find($("input[type=hidden]")).remove();
		    for(var i = 0; i < checkFileList.length; i++){
		    	if(checkFileList[i] === undefined || checkFileList[i].length === 0) continue;
		    	for(var j = 0; j < checkFileList[i].length; j++){
		    		if(checkFileList[i][j].name === fileName){
		    			checkFileList[i].splice(j,1);
		    		}
		    	}
		    }
		    $("#btnAtt").val("");// 임시추가?
	    });
	
	    div.append(btn);
	    $('#att_zone').append(div);
	    $('#att_zone').append('<input type="hidden" value="' + fileName + '"/>');

//	    $('#att_zone input[type="hidden"]')
//	    .each(function() {
//			var value = $(this).val();
//			console.log('기존이미지: '+value); // 콘솔에 각 숨김 입력의 값을 출력
//		});

	}

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
// 		      return f.name !== file.name;
// 		    });
		    $("#btnAtt").val("");// 임시추가?
		  });
		
		  div.append(btn); // 생성된 버튼을 div에 추가합니다.
		  $('#att_zone').append(div); // 완성된 div를 페이지의 'att_zone'에 추가합니다.
		  $('#att_zone').append('<input type="hidden" id="image-in" value="' + fileName + '"/>');
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
			alertMsg("AM10", ["최대 6개"]);
//		  alert("최대 6개의 이미지만 업로드할 수 있습니다.");
		  return false; // 파일 추가 작업 중단
		}
		return true; // 파일 추가 작업 계속
	}// checkFileLimit() 함수 끝
	
	// 이미지 파일 크기를 체크하고, 5MB를 초과할 경우 경고합니다.
	function checkFileSize(file) {
		var maxSize = 1 * 1024 * 1024; // 5MB를 바이트 단위로 변환
		if (file.size > maxSize) {
		  //alert(file.name + " 파일의 크기가 5MB를 초과합니다.");
		  alertMsg("AM10",[file.name, "1MB"]);
		  return false; // 파일 추가 작업 중단
		}
//		$(document).on("click", "#btn", function(){})
		
		return true; // 파일 추가 작업 계속
	}// checkFileSize() 함수 끝
	
	// 이미지 이름 중복 체크
//  	function checkDuplicateName(fileName){
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
	$('#insertBtn').on('click', function(e) { 
		e.preventDefault(); // 폼의 기본 제출 동작을 방지합니다.

		if($('#proName').val() === ''){
			alertMsg("AM6",["상품명"]);
			return;
		}
		if($('#inputRegion').val() === ''){
			alertMsg("AM6",["주소"]);
			return;
		}
		if($('#proPrice').val() === ''){
			alertMsg("AM6",["가격"]);
			return;
		}

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
		var proTsc = $('#proTsc').val();
		// 텍스트 데이터를 JSON 객체로 준비
		var textData = {
		    proName: $('#proName').val(),
		    proWr: $('#proWr').val(),
		    proPrice: $('#proPrice').val(),
		    proTc: $('#proTc').val(),
			proTsc: proTsc,
		    proCate: $('#category1').val(),
		    proStatus: $('input[name="itemStatus"]:checked').val(),
		    proContent: $('#proContent').val(),
//		    proAddress: $('#addNo').val(),
		    proAddress: $('#inputRegion').val(),
		    /* 경매일 때 추가로 들어가는 부분 */
		    aucSp: $('#aucSp').val(),
		    aucInp: $('#aucInp').val(),
		    aucBp: $('#aucBp').val()
		};
		
		// JSON 객체를 문자열로 변환하여 formData에 추가
		formData.append('textData', JSON.stringify(textData));
		
		/*이미지 없으면 막기*/
		if(checkFileList[0] == undefined){
			alertMsg("AM6", ["이미지"]);
			return;
		}
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
		var writer = '';
		var date = '';
		var tableName = '';
		var trade = '';
		$.ajax({
			url: contextPath+'/board/writeBoardPro', // 서버 엔드포인트 URL
			type: 'POST',
			data: formData,
			processData: false, // jQuery가 데이터를 처리하지 않도록 설정
			contentType: false // jQuery가 contentType을 설정하지 않도록 설정
		}).done(function(response) {
			// 파일 업로드 성공 시 처리
			console.log('Upload success:', response);
			/*임시이동*/
//			location.href = "/myapp/";

			$.ajax({
				url: 'selectMyBoard', // 서버 엔드포인트 URL
				type: 'GET',
				data: {
					writer : $('#proWr').val()
				},
			}).done(function(response) {
//				location.href = "/myapp/";
				// 배열을 순회하면서 각 객체의 값에 접근
				response.forEach(function(item) {
				writer = item.WRITER;
				date = item.POSTING_DATE;
				tableName = item.TABLENAME;
				trade = item.TRADE;

				console.log("writer: " + writer + ", date: " + date + ", tablename: " + tableName + ", trade: " + trade);
				//writer: jaewon, date: 20240313130011, tablename: PRODUCT, trade: MM3
				
				});
				if(tableName === 'AUCTION'){
					location.href = "auctionDetail?aucSeller=" + writer + "&aucDate=" + date;
					return;
				}
				if(trade === 'MM3') {
					location.href = "divideDetail?proWr=" + writer + "&proDate=" + date;
					return;
				}
				location.href = "boardDetail?proWr=" + writer + "&proDate=" + date;
			/*임시이동*/
			})
		});
	});
	//임시 제출 버튼 만들었을 때 제출을 할 경우 내가 미리보기에서 삭제한 파일들은 업로드 되지 않도록 하기 끝
	//테스트용 버튼 누르면 페이지 정보들 확인하기
	// 공통 기능을 수행하는 함수
	function handleTempBoard(e, btnId) {
		e.preventDefault(); // 폼의 기본 제출 동작을 방지
		var contextPath = getContextPath();
		var formData = new FormData(); // 새로운 FormData 객체를 생성합니다.
		
		// btnId에 따른 조건부 처리
		var textData = btnId === 'tempSave' ? {
		    preName: $('#proName').val(),
		    preMemid: $('#proWr').val(),
		    prePrice: $('#proPrice').val(),
		    preTc: $('#proTc').val(),
		    preCate: $('#category1').val(),
		    preContent: $('#proContent').val()
		} : {
		    praName: $('#proName').val(),
		    praMemid: $('#proWr').val(),
		    praTc: $('#proTc').val(),
		    praCate: $('#category1').val(),
		    praContent: $('#proContent').val(),
		    praSp: $('#aucSp').val(),
		    praInp: $('#aucInp').val(),
		    praBp: $('#aucBp').val()
		};
		
		// JSON 객체를 문자열로 변환하여 formData에 추가
		formData.append('textData', JSON.stringify(textData));
		
		// btnId에 따라 URL 설정
		var url = btnId === 'tempSave' ? contextPath+'/board/insertPreBoard' : contextPath+'/board/insertPreAuction';
		
		$.ajax({
		    url: url,
		    type: 'POST',
		    data: formData,
		    processData: false, // jQuery가 데이터를 처리하지 않도록 설정
		    contentType: false // jQuery가 contentType을 설정하지 않도록 설정
		}).done(function(response) {
		    console.log('Upload success:', response);
		}).fail(function(jqXHR, textStatus, errorThrown) {
		    console.log('Upload error:', textStatus, errorThrown);
		});
	}
	
	// 이벤트 위임을 사용하여 부모 요소에서 이벤트 처리
	$('body').on('click', '#tempSave', function(e) {
	    handleTempBoard(e, 'tempSave');
	});
	
	$('body').on('click', '#aTempSave', function(e) {
	    handleTempBoard(e, 'aTempSave');
	});

//	$('#searchRegion').on('click',function(){
//		alert('dd');
//	})
	
	//셀렉트 박스 변경 시 화면 살짝 변경
//	$('#proTc').on('change',function(){
//		$('#noDivide').show();
//		if($(this).val() == '경매'){
//			$('#auctionOnly').show();
//			$('#saleBuy').hide();
//			$('#divideOnly').hide();
//		} else if($(this).val() == '판매' || $(this).val() == '구매') {
//			$('#saleBuy').show();
//			$('#auctionOnly').hide();
//			$('#divideOnly').hide();
//		} else if($(this).val() == '나눔'){
//			$('#divideOnly').show();
//			$('#auctionOnly').hide();
//			$('#saleBuy').hide();
//			$('#noDivide').hide();
//		} 
//	});
//	$('#proTc').on('change',function(){
//		$('#noDivide').show();
//		if($(this).val() == 'MM4'){
//			$('#auctionOnly').show();
//			$('#saleBuy').hide();
//			$('#divideOnly').hide();
//			$('#tempSave').attr('id','aTempSave');
//		} else if($(this).val() == 'MM1' || $(this).val() == 'MM2' || $(this).val() == 'MM3') {
//			$('#saleBuy').show();
//			$('#auctionOnly').hide();
//			$('#divideOnly').hide();
//			$('#aTempSave').attr('id','tempSave');
//		} 
//	});

	$('input[name="deliveryCharge"]').on('change', function(e) {
	    e.preventDefault(); // 폼의 기본 제출 동작을 방지
	
	    var checkedRadioId = $('input[name="deliveryCharge"]:checked').attr('id');
	    var aucSpValue = parseInt($('#aucSp').val()); // 현재 값을 정수로 변환하여 가져옴
	    var proPriceValue = parseInt($('#proPrice').val());
	
	    if ($('#proTc').val() === 'MM4') {
	        if (aucSpValue) { // aucSp 값이 존재하는 경우에만 실행
	            if (checkedRadioId === 'includeDeliCharge') {
	                $('#aucSp').val(aucSpValue + 3000); // 현재 값에 3000을 더함
	            } else {
	                $('#aucSp').val(aucSpValue - 3000); // 현재 값에서 3000을 뺌
	            }
	        }
	    } else {
	        if (proPriceValue) { // proPrice 값이 존재하는 경우에만 실행
	            if (checkedRadioId === 'includeDeliCharge') {
	                $('#proPrice').val(proPriceValue + 3000); // 현재 값에 3000을 더함
	            } else {
	                $('#proPrice').val(proPriceValue - 3000); // 현재 값에서 3000을 뺌
	            }
	        }
	    }
	});
	$('#proContent').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0');
	    } else {
	    	$('.textCount').text(content.length);
	    }
	    
	    // 글자수 제한
	    if (content.length > 2000) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 2000));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 2000자까지 입력 가능합니다.');
	    };
	});
	
	$('#noRegion').on('click',function(e){
		e.preventDefault();
		$('#inputRegion').val('전국');
	})
	$("#searchRegion").on('click', function() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	console.log(data);
		            
		        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            var fullAddr= '';
		            var extraAddr='';
		            
		            if(data.userSelectoredType === 'R'){
		            	fullAddr = data.roadAddress;
		            } else{
		            	fullAddr = data.jibunAddress;
		            }
		            
		            // extraAddr 
		            if(data.userSelectedType === 'R'){
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraAddr += data.bname;
		                }
		            }
		            // 건물명이 있고, 공동주택일 경우 추가한다.
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }	                    
		            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		            if(extraAddr !== ''){
		                extraAddr = ' (' + extraAddr + ')';
		            }		            
		            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		            if(fullAddr !== ''){
		                fullAddr += extraAddr;
		            }                    
		            
		            //$("#address-zipcode").val(data.zonecode); 
		            $("#inputRegion").val(fullAddr);
		            //$("#address-detail").focus();
		            
		        }
		    }).open();
		});
	
	$('#selectAddress').on('change',function(e){
//		e.preventDefault(); // 폼의 기본 제출 동작을 방지
		var fullAdd = $('#selectAddress').val();
		var addList = fullAdd.split(',');
		console.log(addList);
		$('#regionNick').val($('#selectAddress option:checked').text());
		$('#addNo').val(addList[0].trim());
		$('#regionCode').val(addList[1].trim());
		$('#inputRegion').val(addList[2].trim());
		$('#detailRegion').val(addList[3].trim());
		
	})
	
	$('#updateBtn').on('click',function(e){
		e.preventDefault();
		var contextPath = getContextPath();
		var formData = new FormData(); // 새로운 FormData 객체를 생성합니다.
		var resultList = []; // 결과를 저장할 배열입니다.
		var proTsc = $('#proTsc').val();
		// 텍스트 데이터를 JSON 객체로 준비
		var textData = {
		    proName: $('#proName').val(),
		    proWr: $('#proWr').val(),
		    proDate: $('#proDate').val(),
		    proPrice: $('#proPrice').val(),
		    proTc: $('#proTc').val(),
			proTsc: proTsc,
		    proCate: $('#category1').val(),
		    proStatus: $('input[name="itemStatus"]:checked').val(),
		    proContent: $('#proContent').val(),
//		    proAddress: $('#addNo').val(),
		    proAddress: $('#inputRegion').val(),
		    /* 경매일 때 추가로 들어가는 부분 */
		    aucSp: $('#aucSp').val(),
		    aucInp: $('#aucInp').val(),
		    aucBp: $('#aucBp').val()
		};
		
		// JSON 객체를 문자열로 변환하여 formData에 추가
		formData.append('textData', JSON.stringify(textData));
		console.log('txtData: ' + textData);
		/*이미지 없으면 막기*/
		if(checkFileList[0] == undefined){
			alertMsg("AM6", ["이미지"]);
			return;
		}
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
		for (let value of formData.values()) {
			console.log(value);
		}
		$.ajax({
			url: contextPath+'/board/updateBoardPro', // 서버 엔드포인트 URL
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
	})
	
	$('#updateAuction').on('click',function(e){
		e.preventDefault();
		var contextPath = getContextPath();
		var formData = new FormData(); // 새로운 FormData 객체를 생성합니다.
		var resultList = []; // 결과를 저장할 배열입니다.
		var aucTsc = $('#proTsc').val();
		// 텍스트 데이터를 JSON 객체로 준비
		var textData = {
		    aucName: $('#proName').val(),
		    aucSeller: $('#aucSeller').val(),
		    aucDate: $('#aucDate').val(),
		    //proPrice: $('#proPrice').val(),
		    aucTc: $('#proTc').val(),
			aucTsc: aucTsc,
		    aucCate: $('#category1').val(),
		    aucStatus: $('input[name="itemStatus"]:checked').val(),
		    aucContent: $('#proContent').val(),
		    aucAddress: $('#addNo').val(),
		    /* 경매일 때 추가로 들어가는 부분 */
		    aucSp: $('#aucSp').val(),
		    aucInp: $('#aucInp').val(),
		    aucMinp: $('#aucBp').val()
		};
		
		// JSON 객체를 문자열로 변환하여 formData에 추가
		formData.append('textData', JSON.stringify(textData));
		console.log('txtData: ' + textData);
		/*이미지 없으면 막기*/
		if(checkFileList[0] == undefined){
			alertMsg("AM6", ["이미지"]);
			return;
		}
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
		for (let value of formData.values()) {
			console.log(value);
		}
		$.ajax({
			url: contextPath+'/board/updateAuction', // 서버 엔드포인트 URL
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
	})
	
});//document ready 끝


function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};