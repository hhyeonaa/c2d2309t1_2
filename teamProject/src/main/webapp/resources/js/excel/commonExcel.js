var excel = () => {
	var excelTag = '<div class="excelBox">'
				    	+'<button class="btn btn-primary excelModalBtn btnSize"><img class="excel_icon" src="/myapp/resources/img/excel/upload_icon.png"alt="excel_icon">데이터 업로드</button>'
					    +'<div class="excelModalBox">'
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
	
	$("#grid").before(excelTag);
	
	// 모달 on/off
	$(".excelModalBtn").on("click", function(){
		var display = $(".excelModalBox").css("display");
		if(display == 'none')	$(".excelModalBox").css("display", "block")
		else 					$(".excelModalBox").css("display", "none")
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