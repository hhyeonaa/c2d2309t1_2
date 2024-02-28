class DeleteButton {
	constructor(props) {
		debugger;
		this.element = document.createElement('button');
		this.element.setAttribute('type', 'button');
		this.element.setAttribute('class', 'deleteBtn border border-0');
		$(this.element).append('<ion-icon name="remove-circle-outline"></ion-icon>');
		var colName = props.columnInfo.header;
		// 버튼 클릭 이벤트 처리
		this.element.addEventListener('click', (e, props) => {
			debugger;
		    alert(colName + ' 하시겠습니까?');
		});
	}
    getElement() { return this.element; }
    render(props) { this.element.style.display = 'block'; }
}

class ToggleButton {
	constructor(props) {
		this.element = document.createElement('div');
		this.element.setAttribute('class', 'form-check form-switch justify-content-center align-middle');
		this.element.setAttribute('style', 'position: relative');
		var flag = ''
		if(props.value == '1') flag = 'checked'; 
		$(this.element).append('<input class="form-check-input mvca" type="checkbox" id="active" ' + flag + '>');
		debugger;
		
		// 버튼 클릭 이벤트 처리
		this.element.addEventListener('click', () => {
		});
	}
	getElement() { return this.element; }
	render(props) { this.element.style.display = 'block'; }
}