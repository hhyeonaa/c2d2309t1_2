document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
 
$(()=>{
	targetColor($("#data_upload"));
	
	$("#tableSelect").on("change", function(){
		$("#excelFormBtn").remove();
		$("#tableSelect").after('<button id="excelFormBtn" class="btn btn-success"><img class="excel_icon" src="resources/img/excel/file_excel_icon.png"alt="excel_icon">양식 다운로드</button>');
		var selected = $(this).val();		
		switch(selected){
			case "MEMBERS":
				console.log("MEMBERS")
				break;
			case "MEMBER_MANAGE":
				console.log("MEMBER_MANAGE")
				break;
			case "ADMIN":
				console.log("ADMIN")
				break;
			case "CODE":
				console.log("CODE")
				break;
			default:
				$("#excelFormBtn").remove();
				break;
		}
	})
	
})

function excelUploadProcess(){
	var f = new FormData(document.getElementById('form1'));
	$.ajax({
		url: "uploadExcel",
		data: f,
		processData: false,
		contentType: false,
		type: "POST",
		success: function(data){
			console.log(data);
			document.getElementById('result').innerHTML = JSON.stringify(data);
		}
	});
}
	
$(()=>{
	$("#eulTest").on("click", function(){
		$("#result").append('')
		var columns = [
			{
				name:"cell0",
				header:"아이디",
			}, 
			{
				name:"cell1",
				header:"이름",
			}, 
			{
				name:"cell2",
				header:"생년월일",
			},
			{
				name:"cell3",
				header:"전화번호",
			},
			{
				name:"cell4",
				header:"이메일",
			},
			{
				name:"cell5",
				header:"성별"
			}
		]
		grid("eultest", 3, columns);
		
		console.log("들어옴?")
	})
})