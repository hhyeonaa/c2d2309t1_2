/*
<parameter 설명>
 url(String)	    : ajax로 데이터 가져오는 주소
 
 perPage(int)       : 한 페이지 당 보여질 row 수 (페이징 처리 필요없으면 0)
 
 columns(Json Array) 
  - name(String)		: 자바 단에서 Map에 담아올 때 Key 값
  - header(String)		: 그리드에 나타낼 컬럼명
  - filter(String)		: text, number, select, date (필터 기능 필요 시)
  - sortable(boolean)	: true (정렬 기능 필요 시)
  - sortingType(String) : asc, desc (생략 가능, default : asc)
  - renderer(json)      : 토글 버튼, 삭제 버튼 등 필요 시 
     * type(Object) : resources/js/toast/renderer.js 에서 필요한 클래스 이름
 
 draggable(boolean) : 순서 바꾸는 기능 필요 시 (ex. 게시판 관리 페이지) (!!! draggable 사용 시 perPage 는 무조건 0)
**/

var appendRows = [];
var defaultPerPage;

var grid = (url, perPage, columns, draggable) => {
	defaultPerPage = perPage;
	var pageOptions = {
		useClient: true,
		perPage: perPage
	};
	if(perPage === 0) {
		pageOptions = {};
		$("#setPerpage").remove();
	}
	
	const dataSource = {
		api: {
			readData: { url: url, method: 'GET' },
			updateData: { url: url + "U", method: 'PUT' }
		},
  		contentType: 'application/json'
	};
	const Grid = tui.Grid;
	const grid = new Grid({
		rowHeight: 60,
		draggable: draggable,
		el: document.getElementById('grid'),
		columns: columns,
		data: dataSource,
		rowHeaders: ['rowNum', 'checkbox'],
		pageOptions: pageOptions
	});
	
	const appendBtn = document.getElementById('appendBtn');
	const appendedData = {};
    columns.forEach(item => appendedData[item.name] = '')
	appendBtn.addEventListener('click', () => {
		var rowCount = grid.getRowCount();
		appendRows.push(rowCount);
		if($("#setPerpage").val() == '0') grid.setPerPage(rowCount + 1, dataSource);
		grid.appendRow(appendedData);
    });
    
    const removeBtn = document.getElementById('removeBtn');
	removeBtn.addEventListener('click', () => {
		debugger;
		grid.removeRows(appendRows);
		appendRows = [];
    });
    
    const resetBtn = document.getElementById('resetBtn');
    resetBtn.addEventListener('click', () =>{
		debugger;
		grid.reloadData();
		debugger;	
	});
	
	const updateBtn = document.getElementById('updateBtn');
	debugger;
	updateBtn.addEventListener('click', function(){
		debugger;
		grid.request('updateData');
	});
	
	const setPerpage = document.getElementById('setPerpage');
	setPerpage.addEventListener('change', function(e){
		var _perPage = Number(e.target.value);
		if(_perPage === 0) _perPage = grid.getRowCount();
		if(e.target.value === "-1") {
			debugger;
			_perPage = defaultPerPage;
		}
		grid.setPerPage(_perPage, dataSource);
	});
	
}