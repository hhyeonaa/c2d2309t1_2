var excel = (upload, download) => {
	var check = [];
	if (upload == "upload") check.push("upload");
	if (download == "download") check.push("download");
	
	if(check.includes("download")){
		var excelDownloadTag = '<div class="excelBox">'
							    	+'<button class="btn btn-success excelDownloadModalBtn btnSize"><img class="excel_icon" src="/myapp/resources/img/excel/download_icon.png"alt="excel_icon">엑셀 다운로드</button>'
								    +'<div class="excelDownloadModalBox">'
								    	+'<div class="mb_5px">'
									    	+'<span class="font_blod_13px">※필터 나중에 생기면 추가</span>'
								    	+'</div>'
								    	+'<div class="btnBox">'
									    	+'<button class="btn btn-primary uLBtn btnSize">다운로드</button>'
								    	+'</div>'
								    +'</div>'
							    +'</div>';
		$("#excel").append(excelDownloadTag);
		
		// 모달 on/off
		$(".excelDownloadModalBtn").on("click", function(){
			var display = $(".excelDownloadModalBox").css("display");
			if(display == 'none')	{
				$(".excelDownloadModalBox").css("display", "block");
				$(".excelUploadModalBox").css("display", "none");
			}
			else {
				$(".excelDownloadModalBox").css("display", "none");
			}
		})							    
	}
	
	if(check.includes("upload")){
		var exceluploadTag = '<div class="excelBox">'
					    	+'<button class="btn btn-primary excelUploadModalBtn btnSize"><img class="excel_icon" src="/myapp/resources/img/excel/upload_icon.png"alt="excel_icon">데이터 업로드</button>'
						    +'<div class="excelUploadModalBox">'
						    	+'<div class="mb_5px">'
							    	+'<span class="font_blod_13px">※양식을 다운로드 후 양식에 맞춰 올려주세요</span>'
							    	+'<button class="btn btn-success excelDLBtn btnSize"><img class="excel_icon" src="/myapp/resources/img/excel/file_excel_icon.png"alt="excel_icon">양식 다운로드</button>'
						    	+'</div>'
						    	+'<form>'
							    	+'<input type="file" id="fileInput" class="form-control" name="fileInput">'
							    	+'<div class="btnBox">'
								    	+'<button class="btn btn-primary uLBtn btnSize">업로드</button>'
										+'<input type="reset" class="btn btn-danger btnSize" value="초기화" />'
							    	+'</div>'
						    	+'</form>'
						    +'</div>'
					    +'</div>';	
		
		$("#excel").append(exceluploadTag);
		// 모달 on/off
		$(".excelUploadModalBtn").on("click", function(){
			var display = $(".excelUploadModalBox").css("display");
			if(display == 'none')	{
				$(".excelUploadModalBox").css("display", "block");
				$(".excelDownloadModalBox").css("display", "none");
			}
			else {
				$(".excelUploadModalBox").css("display", "none");
			} 					
		})
		
		// 양식 다운로드
		$(".excelDLBtn").on("click", function(){
			var startNum = 2;
			var endNum = undefined;
			
			if ($("#grid").find("th").eq(2).text() == '번호'){
				startNum = 3;
			}
			if ($("#grid").find("th").eq(-1).text() == '삭제'){
				endNum = -1;
			}
			
			var th = $("#grid").find("th").slice(startNum, endNum)
			var title = [];
			
			for(var i=0; i<th.length; i++){
				// title.push(th.eq(i).attr('data-column-name'));
				title.push(th.eq(i).text());
			}
			
			location.href=encodeURI('/' + window.location.pathname.split("/")[1] + "/excel/edl?head="+title);
		})
	}
}
