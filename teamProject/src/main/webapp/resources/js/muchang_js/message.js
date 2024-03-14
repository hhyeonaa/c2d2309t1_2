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
			name:"DELETE",
			header:"삭제",
			renderer: {
	            type: DeleteButton
	        }
		}
	]
	
	$("#grid").empty();
	
	fn_grid("message_managePro", 5, columns, false);
	excel('updownload', 'MESSAGE'); 
 	
 	$(document).on("click", "#beforeInsertBtn", function(){

		let isInValid = $("#selectMessage").val().trim() != '';
		if(!isInValid){
			alertMsg("AM5", ["내용 및 금액란"]);
			return;
		}

		let message = msgFormatting($("#selectMessage").val())		
		let isHide = $("#activeCheck").prop("checked") ? '1' : '0';
		let data_ = {
			HIDE: isHide,
			CO_TYPE: codeName.메세지,
			CODE: message
		}		  
				  	
		$.ajax({
			type: "post",
			url: "codeInsertPro",
			data: data_
		})	
		.done(function(data){
			if(data){
//				alertMsg("", []);
				console.log("성공");
				$("#resetBtn").trigger("click");
			} else {
				console.log("실패");
			}
		})	  
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
	const particles = ['부터','까지', '에서', '께서', '에게', '은', '는', '이', '가', '의', '와', '과', '후', '을', '를'];
	const multiParticles = ['은(는)', '이(가)', '을(를)', '와(과)'];
	let sliceText = msg.trim().split(" ");
	let index = 0;
	
	for (let i = 0; i < sliceText.length; i++) {
	    const lastTwoChars = sliceText[i].slice(-2);
	    const lastChar = sliceText[i].slice(-1);
	
	    let particleIndex = particles.indexOf(lastTwoChars);
	    if (particleIndex !== -1) {
	        sliceText[i] = "{" + index + "}" + particles[particleIndex];
	        index++;
	        continue;
	    }
	
	    particleIndex = particles.indexOf(lastChar);
	    if (particleIndex !== -1) {
	        const particle = multiParticles.find(p => p.includes(particles[particleIndex]));
	        sliceText[i] = "{" + index + "}" + (particle ? particle : particles[particleIndex]);
	        index++;
	    }
	}
	
	return sliceText.join(" ").trim();
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

//	for(var i = 0; i < sliceText.length; i++){
//		for(var j = 0; j < particles.length; j++){
//			if(particles[j].length === 2 && sliceText[i].slice(-2) === particles[j]){
//				sliceText[i] = "{" + index + "}" + particles[j];
//				index++;
//				continue;				
//			} 
//			
//			if(particles[j].length === 1 && sliceText[i].slice(-1) === particles[j]){
//				for(var k = 0; k < multiParticles.length; k++){
//					if(multiParticles[k].includes(particles[j])){
//						sliceText[i] = "{" + index + "}" + multiParticles[k];
//						break;
//					} else {
//						sliceText[i] = "{" + index + "}" + particles[j];
//					}
//				}
//				index++;
//				continue;
//			}
//		}
//	}