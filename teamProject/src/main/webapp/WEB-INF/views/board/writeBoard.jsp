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
  background-color:rgb(245, 126, 0);
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
		<div style="border: 1px solid black; width: 100%; height: 1000px;">
			<div class="container">
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <h2>상품 등록</h2>
			    </div>
			  </div>
			  <hr style="background-color: black;">
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <!-- input 요소는 숨겨져 있으므로, label 요소를 중앙 정렬합니다. -->
			      <label class="btn btn-warning input-file-button" for="btnAtt" id="input-file-button">상품 이미지 등록</label>
			      <input type='file' id='btnAtt' multiple style="display: none;"/>
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <div id='att_zone' class="mt-3" data-placeholder="파일을 첨부 하려면 이미지등록 버튼을 클릭하거나 드래그앤드롭 하세요 이미지 총 8장까지 하나당 5mb까지"></div>
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <p></p>
			    </div>
			  </div>
			<!--   <div class="row"> -->
			<!--     <div class="col-12 d-flex justify-content-center"> -->
			<!--       <input type="text" id="itemNm" name="itemNm" placeholder="상품명을 입력"> -->
			<!--     </div> -->
			<!--   </div> -->
				<div class="row">
				    <div class="col-12 d-flex justify-content-center">
						<div class="input-group mb-3">
						    <span class="input-group-text" id="basic-addon1">상품명</span>
						    <input type="text" class="form-control" placeholder="상품명 입력" aria-label="ItemName" aria-describedby="basic-addon1">
						</div>
			    	</div>
			  	</div>
			
			
						<div class="container text-center">
							<div class="row border border-secondary">
							
								<!-- 젤 바깥 1번 --> 
								<div class="col-1 border border-secondary p-0">
									<ul class="list-group h-100 rounded-0">
										<li class="list-group-item h-100 ps-0 pe-0" aria-current="true" id="test1">
											<span class="position-absolute top-50 start-50 translate-middle w-100">카테고리 선택</span>
										</li>
									</ul>
								</div>
								
								<!-- 젤 바깥 2번 -->
								<div class="col">
									<div class="row">
										
										<!-- 지역 및 영화관 --> 
										<div class="col-2 border border-secondary hErrorP">  <!-- hErrorP --> 
											<div class="row" >
												<div class="col-1 p-2 bg-black text-white" id="selectedCinema">대분류</div> <!-- .selected -->
											</div>
											<div class="row hErrorC" style="">  <!-- hErrorC --> 
												<div class="col p-0 bg-body-secondary">
													<ul class="list-group text-start mb-0 ps-0 rounded-0">
													</ul>
												</div>
												<div class="col p-0">
													<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showLocations ">
													</ul>
												</div>
											</div>
										</div>
										
										<!-- 영화 -->
										<div class="col-3 border border-secondary hErrorP">
											<div class="row">
												<div class="col-1 p-2 bg-black text-white" id="selectedMovie">중분류</div>
											</div>
											<div class="row hErrorC" style="">
												<div class="col-8 p-0">
													<ul class="list-group border border-0 text-start mb-0 ps-0 rounded-0 showMovies scrollable" style="height: 450px; overflow: auto;">
													</ul>
												</div>
											</div>
										</div>
										
										<!-- 날짜 및 시간 -->
										<div class="col-4 border border-secondary">
											<div class="row">
												<div class="col-1 p-2 bg-black text-white" id="selectedDate">소분류</div>
											</div>
											<div class="row" >
												<div class="col" id="showTimeTable" style="height: 450px; overflow: auto;">								
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>  
			</div>
		</div> <!-- border안  -->
	</div>
</div>
<script>
$(document).ready(function() { // 문서가 완전히 로드되면 함수를 실행합니다.
	var sel_files = []; // 선택된 파일들을 저장할 배열입니다.
	
	// 이미지 미리보기를 생성하고 화면에 표시하는 함수입니다.
	function displayImagePreview(file) {
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
		    'style': 'width:30px;height:30px;position:absolute;font-size:24px;right:0px;bottom:90px;background-color:rgba(255,255,255,0.1);color:#f00;' // 버튼 스타일을 설정합니다.
		  }).click(function() { // 버튼 클릭 이벤트 핸들러를 설정합니다.
		    $(this).parent().remove(); // 버튼이 속한 부모 div를 DOM에서 제거합니다.
		    sel_files = sel_files.filter(function(f) { // 선택된 파일 목록에서 현재 파일을 제거합니다.
		      return f.name !== file.name;
		    });
		  });
		
		  div.append(btn); // 생성된 버튼을 div에 추가합니다.
		  $('#att_zone').append(div); // 완성된 div를 페이지의 'att_zone'에 추가합니다.
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
	
	// 이미지 파일 개수를 체크하고, 6개를 초과할 경우 경고합니다.
	function checkFileLimit(filesToAdd) {
		var totalFiles = sel_files.length + filesToAdd.length; // 기존 파일과 추가될 파일의 총 개수
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
	
	$(document).on('change', '#btnAtt', function(e) { // 파일 입력 필드에 변화가 있을 때 실행될 이벤트 핸들러를 설정합니다.
		var files = e.target.files; // 사용자가 선택한 파일들을 가져옵니다.
		var imageFiles  = filterNonImageFiles(files);
	   
		// 파일 개수 체크
	    if (!checkFileLimit(imageFiles)) return; // 6개를 초과하면 추가 작업 중단
	    
		console.log("선택된 파일들:");
		$.each(imageFiles , function(i, file) { // 선택된 각 파일에 대해 반복합니다.
			if (!checkFileSize(file)) return; // 5MB를 초과하면 추가 작업 중단
			console.log(file.name + " (" + file.type + ", " + file.size + " bytes)");
			sel_files.push(file); // 현재 파일을 선택된 파일 목록에 추가합니다.
			displayImagePreview(file); // 현재 파일에 대한 이미지 미리보기를 생성합니다.
		});
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
		$('#btnAtt').prop('files', files); // 파일 입력 필드의 파일 목록을 드롭된 파일들로 설정합니다.
		$.each(imageFiles , function(i, file) { // 드롭된 각 파일에 대해 반복합니다.
			if (!checkFileSize(file)) return; // 5MB를 초과하면 추가 작업 중단
			console.log(file.name + " (" + file.type + ", " + file.size + " bytes)");
			sel_files.push(file); // 드롭된 파일을 선택된 파일 목록에 추가
			displayImagePreview(file); // 드롭된 파일에 대한 이미지 미리보기를 생성합니다.
		});
	});
	
	//임시 제출 버튼 만들었을 때 제출을 할 경우 내가 미리보기에서 삭제한 파일들은 업로드 되지 않도록 하기
	$('#submitBtn').on('click', function(e) {
		e.preventDefault(); // 폼의 기본 제출 동작을 방지합니다.
		
		var formData = new FormData(); // 새로운 FormData 객체를 생성합니다.
		
		// `sel_files` 배열에 남아 있는 파일들만 FormData 객체에 추가합니다.
		$.each(sel_files, function(i, file) {
			formData.append('files[]', file); // 'files[]'는 서버에서 파일 배열을 받을 때 사용할 이름입니다.
		});
		
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
});

</script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>