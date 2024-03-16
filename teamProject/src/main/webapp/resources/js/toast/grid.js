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
var variablePerPage;
var fn_grid = (url, perPage, columns, draggable, parameter) => {
	defaultPerPage = perPage;
	variablePerPage = perPage;
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
			createData: { url: url, method: "POST",   initParams: { param: parameter }},
			readData:   { url: url, method: "GET",    initParams: { param: parameter }},
			updateData: { url: url, method: "PUT",    initParams: { param: parameter }},
		    deleteData: { url: url, method: "DELETE", initParams: { param: parameter }}
		},
  		contentType: "application/json"
	};
	const grid = new tui.Grid({
		rowHeight: 60,
		draggable: draggable,
		el: document.getElementById("grid"),
		columns: columns,
		data: dataSource,
		rowHeaders: ["rowNum", "checkbox"],
		pageOptions: pageOptions,
		rowHeight: "auto",
		minRowHeight: 60
	});
//	grid.hideColumn("SEQ");

	// 순서 변경
	grid.on("drop", () => {
		for(var i = 0; i < grid.getRowCount(); i++)
			grid.setValue(grid.getRowAt(i).rowKey, "SEQ", i+1);
		
		grid.request("updateData");
		grid.resetData(grid.getData());
	});
	
	// 수정
	grid.on("afterChange", (e) => {
		
		if(e.changes[0].columnName == "SEQ") return;

		grid.request("updateData");
		grid.resetData(grid.getData(), {
			pageState: {
				page: parseInt(e.changes[0].rowKey / variablePerPage + 1),
				totalCount: grid.getPaginationTotalCount(),
				perPage: variablePerPage
			}
		});
	});
	
	// 삭제
	$(document).on("click", "#ckDeleteBtn", function(e){
		grid.removeCheckedRows(true);
		grid.request("deleteData");
		grid.resetData(grid.getData());
	});
	
	// 새로고침 $(document)
    $(document).on("click", "#resetBtn", function(){ grid.reloadData(); });

	// 페이징 selectbox	
	$(document).on("change", "#setPerpage", function(e){
		var _perPage = Number(e.target.value);
		if(_perPage === 0) _perPage = grid.getRowCount();
		if(e.target.value === "-1")
			_perPage = defaultPerPage;
		variablePerPage = _perPage;
		grid.setPerPage(_perPage, dataSource);
	});
}