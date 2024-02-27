// 페이징 처리 부분
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
$(() => {
	paging("#tbody tr", 5, 0);
});


// alert
 document.write('<script type="text/javascript"' + 
                    'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');

$(function(){
	class ButtonRenderer {
	    constructor() {
			debugger;
	        this.element = document.createElement('button');
	        this.element.setAttribute('type', 'button');
	        this.element.setAttribute('class', 'deleteBtn border border-0');
	        $(this.element).append('<ion-icon name="remove-circle-outline"></ion-icon>');
			debugger;
	
	        // 버튼 클릭 이벤트 처리
	        this.element.addEventListener('click', () => {
	            alert('Button clicked');
	        });
	    }
	
	    getElement() {
	        return this.element;
	    }
	
	    render(props) {
	        this.element.style.display = 'block';
	    }
	}
	class ToggleRenderer {
	    constructor() {
			debugger;
	        this.element = document.createElement('div');
	        this.element.setAttribute('class', 'form-check form-switch justify-content-center');
	        $(this.element).append('<input class="form-check-input" type="checkbox" id="active" checked>');
			debugger;
	//        this.element.style.display = 'none'; // 초기에는 숨김
	
	        // 버튼 클릭 이벤트 처리
	        this.element.addEventListener('click', () => {
//	            alert('Button clicked');
	        });
	    }
	
	    getElement() {
	        return this.element;
	    }
	
	    render(props) {
	        this.element.style.display = 'block';
	    }
	}
	var columns = [
		{
			name:"AD_NO",
			header:"번호",
			filter:"number",
		    sortable: true,
			sortingType: 'asc'
		}, 
		{
			name:"AD_ID",
			header:"ID",
			filter:"text",
		    sortable: true,
			sortingType: 'asc'
		},
		{
			name:"AD_NAME",
			header:"이름",
			filter:"text",
		    sortable: true,
			sortingType: 'asc'
		},
		{
			name:"AD_ACTIVE",
			header:"활성 상태",
			filter:"select",
		    sortable: true,
			sortingType: 'asc',
			renderer: {
                type: ToggleRenderer
            }
		},
		{
			name:"",
			header:"삭제",
			renderer: {
                type: ButtonRenderer
            }
		}
	]
	
	grid("managerList", 3, columns);
	
	
	
	
	let adminList = document.getElementById('adminList');
	
	// 삭제 버튼
	$(document).on("click", "#deleteBtn", function () {
		var rowIndex = $(this).closest('tr').index();
		let AD_NO= "AD" + adminList.rows[rowIndex+1].cells[0].innerText;
		var result =
			confirm(AD_NO + '을 정말로 삭제하시겠습니까?');
//			alertMsg(AD_NO, 'CO_TYPE+CO_NO', true);
		if(result){
			$.ajax({
				type: "post"
				, url: "deletePro"
				, data: {AD_NO: AD_NO }
			})
			alert(AD_NO + '가 삭제되었습니다.');
// 			alertMsg(AD_NO, 'CO_TYPE+CO_NO');
			$('#adminDiv').load(location.href+' #adminDiv');
//			location.reload();
		} else {
			alert('삭제가 취소되었습니다.');
// 			alertMsg("삭제", 'CO_TYPE+CO_NO');
		}
	});

	// 저장 버튼
	$(document).on("click", "#saveBtn", function () {
		for (let i = 1; i < adminList.rows.length; i++) {
			$.ajax({
				type: "post"
				, url: "updatePro"
				, data: {AD_NO: "AD" + adminList.rows[i].cells[0].innerText,
						 AD_ACTIVE: adminList.rows[i].cells[3].querySelector('input[type="checkbox"]').checked ? 1 : 0 }
			});
		}
		$('#adminDiv').load(location.href+' #adminDiv');
//		location.reload();
	});
	
		
	// 모달창 관련	
	var modal = $('#addModal');
	
	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});
	

	// 엔터키 & 버튼 연결	
	$('#AD_ID, #AD_PW, #AD_NAME').on('keydown', function(key){
        if (key.keyCode == 13) {
            $('#insertBtn').click();
        }
	});	
	
	
	// 생성버튼 이벤트 
	$(document).on("click", "#insertBtn", function () {
		if($('#AD_ID').val() == ""){
			alert("아이디를 입력하세요.");
//			alertMsg("아이디", 'CO_TYPE+CO_NO');
			$('#AD_ID').focus();
			return;
		}
		if($('#AD_PW').val() == ""){
			alert("비밀번호를 입력하세요.");
//			alertMsg("비밀번호", 'CO_TYPE+CO_NO');
			$('#AD_PW').focus();
			return;
		}
		if($('#AD_NAME').val() == ""){
			alert("이름을 입력하세요.");
//			alertMsg("이름", 'CO_TYPE+CO_NO');
			$('#AD_NAME').focus();
			return;
		}
		$.ajax({
			type: "post"
			, url: "insertPro"
			, data: {AD_ID: $('#AD_ID').val(),
					 AD_PW: $('#AD_PW').val(),
					 AD_NAME: $('#AD_NAME').val() }
		})
		.done(function(data) {
			alert('새로운 관리자 계정이 생성되었습니다.');
//			alertMsg("새로운 관리자 계정", 'CO_TYPE+CO_NO');
			modal.css('display', 'none');
			$('#adminDiv').load(location.href+' #adminDiv');
//			$('#testDiv').load(location.href+' #testDiv');
//			location.reload();
		 })
		.fail(function() {
			alert('입력 정보를 다시 확인해 주십시오.');
//			alertMsg("입력 정보", 'CO_TYPE+CO_NO');
		});
	});
	
});