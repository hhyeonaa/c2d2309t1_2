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
 
 	targetColor($("#message_manage"));
 
	let columns = [
		{
			name: columnTitle.번호,
			header:"번호",
		    sortable: true
		},
		{
			name: columnTitle.타입,
			header:"코드타입"
		},
		{
			name: columnTitle.내용,
			header:"코드내용",
			filter:"text",
		    sortable: true,
		    editor: "text"
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
	
	let msg = "해당 이름은 사용이 불가능합니다. 다른 이름을 사용 해주세요.";
	msgFormatting(msg);
	$("#CODE_TYPE").val();

	$("#excel").remove();
	$("#grid").empty();
	grid("message_managePro", 5, columns, false);
	excel('updownload', 'MESSAGE'); 
 	
 	$(document).on("click", "#beforeInsertBtn", function(){
		debugger;
		let isInValid = $("#selectMessage").val().trim() != '';
		isInValid ? $("#insertBtn").trigger("click") 
				  : alertMsg("AM5", ["내용 및 금액란"]);
	})
 	
})

// 모달 실행
$(() => {
	
	var modal = $('#addModal');
 
 	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
		$("#modal-body").append(insertTag());
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
		$("#modal-body").empty();
	});
		
})

function msgFormatting(msg){
	const particles = ['은(는)', '이(가)', '을(를)', '의', '와(과)', '까지'];

	let result = msg.split(" ").map((word, index) => {
	  	let lastChar = word.slice(-1);
	  	let foundParticle = particles.find(p => lastChar === p[1] && lastChar === (p[3] || p[2]));
	  	return foundParticle ? `{${index}}${foundParticle.slice(2)}` : word;
	}).join(" ");
	
	return result;
}

function insertTag(){
	return '<div class="form-outline mb-4">' +
			   '<div style="text-align: left;"> <label>내용</label> </div>' +
			   '<textarea cols="33" rows="5" id="selectMessage" style="resize: none;" placeholder="*알림창 문구를 입력해주세요."></textarea>' +
		   '</div>' +
		   '<div class="form-outline mb-4">' +
			   '<div class="form-check form-switch">' +
				   '<label class="form-check-label" for="activeCheck">숨김 여부</label>' +
				   '<input class="form-check-input" type="checkbox" id="activeCheck" checked>' +
			   '</div>' +
		   '</div>';
	
}

