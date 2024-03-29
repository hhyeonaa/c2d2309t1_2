document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');

var excel = (state, tableName) => {
	
	$("#grid").before('<div id="excel"></div>');
	
	if(state == 'download' || state == 'both'){
		var excelDownloadTag = '<div class="excelBox">'
							 +   	'<button class="btn btn-success excelDownloadModalBtn btnSize"><img class="excel_icon" src="'+'/'+ window.location.pathname.split("/")[1] +'/resources/img/excel/download_icon.png"alt="excel_icon">엑셀 다운로드</button>'
							 +	    '<div class="excelDownloadModalBox">'
							 +	    	'<div class="mb_5px">'
							 +		    	'<span class="font_blod_13px">※현재 보이는 표를 엑셀로 다운로드 합니다.</span>'
							 +	    	'</div>'
							 +	    	'<div class="btnBox">'
							 +		    	'<button class="btn btn-primary dLBtn btnSize">다운로드</button>'
							 +	    	'</div>'
							 +	    '</div>'
							 +   '</div>';
		$("#excel").append(excelDownloadTag);
		
		// 모달 on/off
		$(".excelDownloadModalBtn").on("click", function(){
			var display = $(".excelDownloadModalBox").css("display");
			if(display == 'none') {
				$(".excelDownloadModalBox").css("display", "block");
				$(".excelUploadModalBox").css("display", "none");
			} else {
				$(".excelDownloadModalBox").css("display", "none");
			}
		})
		
		$(".dLBtn").on("click", function(){
			var startNum = 2;
			var endNum = undefined;
			
			if ($("#grid").find("th").eq(-1).text() == '삭제'){
				endNum = -1;
			}
			
			// 헤더
			var th = $("#grid").find("th").slice(startNum, endNum)
			var title = [];
			var colName = [];
			
			for(var i=0; i<th.length; i++){
				colName.push(th.eq(i).attr('data-column-name'));
				title.push(th.eq(i).text());
			}
			var header = {
				title: title,
				colName: colName
			};
			
			// 바디
			var bodyContents = $(".tui-grid-body-area").eq(1).find(".tui-grid-row-odd, .tui-grid-row-even");
			
			var body = {};
			for(var i = 0 ; i < bodyContents.length ; i++){
				
				var cellContent = bodyContents.eq(i).find("td");	
				var cellDatas =[];
				for(var j = 0 ; j < cellContent.length ; j++){
					var cell = cellContent.eq(j);
					var data;
					if (cell.attr("data-column-name") == "DELETE") {
						continue;
					} else if(cell.find("input").length) { 
						data = cell.find("input").val();
					} else{
						data = cell.children("div").text();
					}
					cellDatas.push(data);
				}
				body["row" + i] = cellDatas;
			}
			
			dlData = {
				header: header,
				body: body
			};
			
			location.href=encodeURI('/' + window.location.pathname.split("/")[1] + "/excel/formExcelDL?dlData="+JSON.stringify(dlData));
			
		})							    
	}
	
	if(state == 'upload' || state == 'both'){
		var exceluploadTag = '<div class="excelBox">'
				    	   + 	'<button class="btn btn-primary excelUploadModalBtn btnSize"><img class="excel_icon" src="'+'/' + window.location.pathname.split("/")[1] +'/resources/img/excel/upload_icon.png"alt="excel_icon">데이터 업로드</button>'
						   + 	'<div class="excelUploadModalBox">'
						   + 		'<div class="mb_5px">'
						   +			'<span class="font_blod_13px">※양식을 다운로드 후 양식에 맞춰 올려주세요</span>'
						   +			'<button class="btn btn-success excelDLBtn btnSize"><img class="excel_icon" src="'+'/' + window.location.pathname.split("/")[1] +'/resources/img/excel/file_excel_icon.png"alt="excel_icon">양식 다운로드</button>'
						   +		'</div>'
						   +		'<form id="uploadForm" method="post" enctype="multipart/form-data" onsubmit="return false">'
						   +			'<input type="file" id="fileInput" class="form-control" name="fileInput" accept=".xlsx">'
						   +			'<div class="btnBox">'
						   +				'<button class="btn btn-primary uLBtn btnSize">업로드</button>'
						   +				'<input type="reset" class="btn btn-danger btnSize" value="초기화" />'
						   +			'</div>'
						   +		'</form>'
						   +	'</div>'
					       +'</div>';	
		
		$("#excel").append(exceluploadTag);
		
		// 모달 on/off
		$(".excelUploadModalBtn").on("click", function(){
			var display = $(".excelUploadModalBox").css("display");
			if(display == 'none') {
				$(".excelUploadModalBox").css("display", "block");
				$(".excelDownloadModalBox").css("display", "none");
			} else {
				$(".excelUploadModalBox").css("display", "none");
			} 					
		})
		
		// 양식 다운로드
		$(".excelDLBtn").on("click", function(){
			location.href=encodeURI('/' + window.location.pathname.split("/")[1] + "/excel/formExcelDL?tableName="+tableName);
		})
		
		// 엑셀 업로드 버튼
		$(".uLBtn").on("click", function(){
			var formData = new FormData($("#uploadForm")[0]);
			formData.append("tableName", tableName)
			
			$.ajax({
				enctype: 'multipart/form-data',
				type: 'POST',
				url: '/' + window.location.pathname.split("/")[1] + '/excel/excelUpload',
				processData: false,
				contentType: false,
				cache: false,
				data: formData,
			})
			.done(function(data){
				if(Boolean(data)){
					alertMsg("AM14", ["데이터"]);
					location.reload();
				}
			})
		})
	}
	
	
}
