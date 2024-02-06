/**
 * 
 */

/**
 * 적용시킬 js 파일 상단에 아래 js 복붙 해주면됨
 *  document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
 */

/**
 * 함수 호출 방법
 * paging("table tr", 5);
 * 매개변수 2개 받음
 * 0번째 : 적용할 위치 문자열
 * 1번째 : 한 페이지 당 보여줄 행 개수
 * 2번째 : 0 => 데이터가 없어도 표시, 1 => 데이터가 있어야 표시 추가로 한페이지에 보여질 행이 꽉찼을 때 자동으로 다음페이지 페이징 숫자 추가됨
 * ex ) $(e.target).index() 
 */

/**
 * jsp 화면에 선언 하는 방법
 * <div class="demo">
	    <nav class="pagination-outer"  aria-label="Page navigation">
	        <ul class="pagination" id="pagination"></ul>
	    </nav>
	</div> 
 * 
 */


function paging(pgEvent, pageSize, oneOrZero){

	var totalCount = $(pgEvent).length + oneOrZero;
	if(totalCount === 0){
		totalCount++;
	} 

	let _pageSize = pageSize;
	
	let _totalPages = totalCount / _pageSize;
	let _startPage = 1;
	
	if(totalCount % _pageSize > 0){
		_totalPages++;
	}
	
	// $('#pagination').twbsPagination('destroy');
	
    window.pagObj = $('#pagination').twbsPagination({
    	totalPages: _totalPages,
    	pageSize: _pageSize,
        first:'<span sris-hidden="true"><span class="material-symbols-outlined">keyboard_double_arrow_left</span></span>' ,
	    last:'<span sris-hidden="true"><span class="material-symbols-outlined">keyboard_double_arrow_right</span></span>' ,
	    prev:"이전",
	    next:"다음",
        onPageClick: function (event, page) {
			if(_startPage != page){
				_startPage = page;
			}
			
			if(_startPage === 0){
				_startPage++;
			}
			
			var index = --_startPage * _pageSize;
			for(var i = 0; i < totalCount; i++){
				var pgChange = $($(pgEvent)[i]); 
				(i >= index && i < index + _pageSize) ? pgChange.show() 
											  	 	  : pgChange.hide();  
			}
        }
    })
}


/**
 * 로딩창 띄우기
 * 
 */
$(() => {
	$(window).ajaxStart(function(){   
		$("#loading").show();  
	}).ajaxStop(function(){   
	  	$("#loading").hide();  
	});
})	
	



function targetColor(currentPageTxt){
	$('.nav__link').css('background-color', 'transparent');
	currentPageTxt.css('background-color', 'salmon');
	
	$('.nav__link').hover(function(){
		$(this).css('background-color', 'salmon');
	}, function(){
		$(this).css('background-color', 'transparent');  
		currentPageTxt.css('background-color', 'salmon');  
	});
}

