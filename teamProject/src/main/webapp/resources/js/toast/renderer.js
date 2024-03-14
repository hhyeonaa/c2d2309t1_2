class DeleteButton {
	constructor(props) {
		const el = document.createElement('button');
		el.type = 'button';
		el.className  = 'deleteBtn border border-0';
		el.style = 'padding: 0; background-color:transparent; padding-top:5px';
		$(el).append('<ion-icon name="remove-circle-outline" style="width:30px; height:30px"></ion-icon>');
		
		$(el).on("click", function(){
			debugger;
			props.grid.removeRow(props.rowKey);
			props.grid.request('deleteData');
			props.grid.reloadData();
		});
		
		this.el = el;
//		this.render(props);
	}
    getElement() { return this.el; }
    render(props) {}
}

class ToggleButton {
	constructor(props) {
		const el = document.createElement('div');
		el.className  = 'form-check form-switch justify-content-center';
		el.style = 'position: relative';
		var flag = '';
		var value = '0'
		if(props.value == '1'){
			flag = 'checked';
			value = '1';
		}
		$(el).append('<input class="form-check-input mvca" type="checkbox" id="active" ' 
									+ 'style="width:35px; height:20px"' 
									+ flag + ' value="' + value + '">');
									
		$(el).on("change", function(e){
			debugger;
			props.grid.setValue(props.rowKey, props.columnInfo.name, e.target.checked ? "1" : "0");
		});
		
		this.el = el;
//		this.render(props);
	}
	getElement() { return this.el; }
	render(props) {}
}
