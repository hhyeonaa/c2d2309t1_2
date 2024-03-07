/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>'); 
 
$(() => {
	
	let columns = [
		{
			name: columnTitle.번호,
			header:"번호",
//			filter:"number",
		    sortable: true
		},
		{
			name: columnTitle.내용,
			header:"코드내용",
			filter:"text",
		    sortable: true
		},  
		{
			name: columnTitle.활성여부_관리자,
			header:"숨김 여부",
			filter:"select",
		    sortable: false,
			renderer: {
	            type: ToggleButton
	        }
		},
		{
			name:"",
			header:"삭제",
			renderer: {
	            type: DeleteButton
	        }
		}
	]
	
	targetColor($("#code_manage"));

	$(document).on("click", "#selectCodeBtn button", function(){
		$("#selectCodeBtn button").attr("class", "btn btn-outline-primary");
		$(this).attr("class", "btn btn-primary");
		debugger;
		let keys = Object.keys(codeName);
		var str = $(this).text();
		let param = keys.includes(str) ? codeName[str] : alertMsg("AM12", ["해당 항목", "현재 사용"]);
		
		$("#excel").remove();
		$("#grid").empty();
		grid("codePro", 5, columns, false, param);
		excel('updownload', 'CODE'); 
	})

	$("#selectCodeBtn :first").trigger("click");
	 
	var modal = $('#addModal');
	
	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});	 
})

function formatPrice(price) {
    // 숫자에 1000원 단위로 쉼표 추가
    const formattedPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // 최종적으로 "원" 기호 추가
    return formattedPrice + '원';
}


