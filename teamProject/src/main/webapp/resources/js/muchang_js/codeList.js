/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>'); 

// ajax 호출 및 grid 호출
$(() => {
//	columnTitle.번호
	let columns = [
		{
			name: columnTitle.번호,
			header:"코드번호",
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
	
	targetColor($("#code_manage"));
	customSelect2($("#selectCodeList"));

	$(document).on("click", "#beforeInsertBtn", function(){
		let isInValid = validCheck($("#selectCodeList").val());
		isInValid ? $("#insertBtn").trigger("click") 
				  : alertMsg("AM5", ["내용 및 금액란"]);
	})

	$(document).on("click", "#selectCodeBtn button", function(){
		$("#selectCodeBtn button").attr("class", "btn btn-outline-primary");
		$(this).attr("class", "btn btn-primary");

		let keys = Object.keys(codeName);
		var str = $(this).text();
		let param = keys.includes(str) ? codeName[str] : alertMsg("AM12", ["해당 항목", "현재 사용"]);
		
		$("#excel").remove();
		$("#grid").empty();
		fn_grid("codePro", 5, columns, false, param);
		excel('updownload', 'CODE'); 
	})

	$("#selectCodeBtn :first").trigger("click");
	 
})

// 모달 이벤트
$(() => {
	var modal = $('#addModal');
	
	$(document).on('click', '#btnAdd', function(){
		modal.css('display', 'block');
		
		$("#header-modal").prepend('<h3 class="' + 'modal-title"' + 'id="'+ 'modal-title"' + '><b style="color: red;">＊항목 선택(필)＊</b></h3>');
		$('#selectCodeList').val("true").trigger('change');
	});
	
	$(document).on('click', '#close', function(){
		modal.css('display', 'none');
		
		$('#selectCodeList').val("true").trigger('change');
		$("#modal-body").empty();
		$("#modal-title").remove();
	})
	
	$(document).on('click', '#cancelBtn', function(){
		modal.css('display', 'none');
		
		$('#selectCodeList').val("true").trigger('change');
		$("#modal-body").empty();
		$("#modal-title").remove();
	})
	
	$(document).on("change", "#selectCodeList", function () {
		if($(this).val() === 'true') return;
		
		$("#modal-title").remove();
		$("#modal-body").empty();
		
		changeModalHeader($(this).val());		
	})
})

function changeModalHeader(title){
	$("#modal-body").empty();
	$("#modal-title").remove();

	const jsonKey = Object.keys(codeName).find(key => codeName[key] === title) || null;
	
	$("#header-modal").prepend('<h3 class="' + 'modal-title"' + 'id="'+ 'modal-title"' + '><b>＊' + jsonKey +'</b></h3>');
	$("#modal-body").append(changeModalBody(title === "PM"));
}

function changeModalBody(isTypePM){
	
	const amountInputs = isTypePM 
		? 
			'<div id="priceTag">' +
				'<div class="input-group mb-3">' +
					'<span class="input-group-text" id="min">최소금액</span>' +
					'<input type="text" class="form-control" placeholder="기본값 0원" aria-label="min" aria-describedby="min"' +
					'oninput="this.value = this.value.replace(/[^0-9.]/g, \'\')">' +
				'</div>' +
				'<div class="input-group mb-3">' +
					'<span class="input-group-text" id="max">최대금액</span>' +
					'<input type="text" class="form-control" placeholder="최대 금액 ＊필수입력" aria-label="max" aria-describedby="max"' +
					'oninput="this.value = this.value.replace(/[^0-9.]/g, \'\')">' +
				'</div>' +
			'</div>' 
		:	'<div style="text-align: left;"> <label>내용</label> </div>' +
			'<textarea cols="33" rows="5" style="resize: none;" placeholder="*선택한 목록에 맞는 코드내용을 입력해주세요."></textarea>'
		;
	
	return '<div class="form-outline mb-4">' +
				 amountInputs +
		   '</div>'+
		   '<div class="form-outline mb-4">' +
				'<div class="form-check form-switch">' +
					'<label class="form-check-label" for="activeCheck">숨김 여부</label>' +
					'<input class="form-check-input" type="checkbox" id="activeCheck">' +
				'</div>' +
			'</div>'
		;
}

const validCheck = function(selectList){
	let data = {};
	const isHide = $("#activeCheck").prop("checked") ? "1" : "0";
	const isPM = selectList === "PM";
  	const codeList = isPM
    	? $("#priceTag input").map((index, input) => `${formatPrice($(input).val())} ${index ? "이상 ~ " : "이하"}`).get().join(' ')
    	: $("#modal-body textarea").val();

  	return typeof codeList === 'string' && codeList.trim() !== '';
}		

function formatPrice(price) {
    // 숫자에 1000원 단위로 쉼표 추가
    const formattedPrice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // 최종적으로 "원" 기호 추가
    return formattedPrice + '원';
}		

var customSelect2 = function(tag){
	tag.select2({
		placeholder: '항목을 선택헤주세요 :)',
  		"language": {
    		"noResults": function (params) {
      			return "<b style='color:rgb(220, 20, 60, 0.5);'>찾을 수 없어요 :(</b>";
    		}
  		},
  		escapeMarkup: function (markup) {
        	return markup;
    	},
    	templateResult: function (data) {
            if (data.id === 'true') {
                return null;
            }
            return data.text;
		}
	})		
}