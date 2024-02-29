class ToggleEditor {
	constructor(props) {
		const el = document.createElement('div');
		el.className  = 'form-check form-switch justify-content-center';
		el.style = 'position: relative';
		var flag = (props.value == '1') ? 'checked' : '';
		$(el).append('<input class="form-check-input mvca" type="checkbox" id="active" ' 
									+ 'style="width:35px; height:20px"' + flag + '>');
									
		// 버튼 클릭 이벤트 처리
//		el.addEventListener('change', (e) => {
//			props.value = e.target.checked ? 1 : 0;
//			this.render(props);
//		});
		el.value = String(props.value);
		this.el = el;
	}
	getElement() {
		return this.el;
	}
	getValue() {
    	return this.el.value;
	}
	mounted() {
		this.el.select();
	}
}