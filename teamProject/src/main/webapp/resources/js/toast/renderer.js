class DeleteButton {
	constructor(props) {
		const el = document.createElement('button');
		el.type = 'button';
		el.className  = 'deleteBtn border border-0';
		el.style = 'padding: 0; background-color:transparent; padding-top:5px';
		$(el).append('<ion-icon name="remove-circle-outline" style="width:30px; height:30px"></ion-icon>');
		
		// 버튼 클릭 이벤트 처리
		var colName = props.columnInfo.header;
		el.addEventListener('click', (e) => {
		    alert(colName + ' 하시겠습니까?');
		});
		
		this.el = el;
		this.render(props);
	}
    getElement() { return this.el; }
    render(props) {  }
}

class ToggleButton {
	constructor(props) {
		debugger;
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
									
		// 버튼 클릭 이벤트 처리
		el.addEventListener('change', (e) => {
			debugger;
//			if (typeof props.columnInfo.renderer.onchange === 'function') {
//			    props.columnInfo.renderer.onchange(e.target.checked ? "1" : "0");
//			} else {
//			    console.error('props.onChange is not a function');
//			}
			
			
			props.value = e.target.checked ? "1" : "0";
			this.render(props, 1);
		});
		
		this.el = el;
		this.render(props);
		debugger
	}
	getElement() { return this.el; }
	render(props, flag) {
		debugger;
		this.el.value = props.value;
		if(flag == 1)
			props.grid.setValue(props.rowKey, props.columnInfo.name, props.value == "1" ? "1" : "0");
//		if (props.value === '1') {
//			this.el.querySelector('.form-check-input').checked = true;
//		} else {
//			this.el.querySelector('.form-check-input').checked = false;
//		}
	}
}