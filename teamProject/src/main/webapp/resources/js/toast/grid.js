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

var grid = (url, perPage, columns, draggable, parameter) => {
	var pageOptions = {
		useClient: true,
		perPage: perPage
	};
	if(perPage === 0) pageOptions = {};
	
	const dataSource = {
		api: {
			readData: { url: url, method: 'GET', initParams: { param: parameter }}
		}
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
}