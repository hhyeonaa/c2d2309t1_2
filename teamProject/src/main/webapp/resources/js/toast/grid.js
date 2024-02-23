var grid = (url, perPage, columns) => {
	const dataSource = {
		api: {
			readData: { url: url, method: 'GET' }
		}
	};
	
	const Grid = tui.Grid;
	const grid = new Grid({
		el: document.getElementById('grid'),
		columns: columns,
		data: dataSource,
		rowHeaders: ['rowNum'],
		pageOptions: {
	    	useClient: true,
	    	perPage: perPage
		}
	});
}