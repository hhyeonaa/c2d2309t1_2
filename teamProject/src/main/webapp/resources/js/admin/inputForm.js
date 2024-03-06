class TextInput extends HTMLElement {
	connectedCallback(){
		// div - row
		let row = document.createElement('div');
		row.classList.add('row');
		let hr = document.createElement('hr');
		
		// 타입별 div(1) - (input - text)
		let textDiv = document.createElement('div');
		textDiv.classList.add('input-group');
		let span = document.createElement('span');
		span.classList.add('input-group-text');
		span.innerHTML = this.getAttribute('name');
		let input = document.createElement('input');
		input.classList.add('form-control');
		input.placeholder = this.getAttribute('name') + ' 입력';
		input.id = this.getAttribute('id-data');
		
        textDiv.append(span, input);
        row.appendChild(textDiv);

        this.prepend(row, hr);
	}
}	



class TextareaInput extends HTMLElement {
	connectedCallback(){
		// div - row
		let row = document.createElement('div');
		row.classList.add('row');
		let hr = document.createElement('hr');
		
		// (3) - (textarea)
		let label = document.createElement('span');
        label.innerHTML = this.getAttribute('name');
        let textarea = document.createElement('textarea');
        textarea.id = this.getAttribute('id-data');
        textarea.classList.add('form-control');
        textarea.rows = '5';
        textarea.cols = '200';
        textarea.placeholder = '구매시기, 브랜드/모델명, 제품의 상태 (사용감, 하자 유무) 등을 입력해 주세요.\n서로가 믿고 거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요.\n나눔일 경우 나눔 조건도 꼭 입력해주세요.';
		let span = document.createElement('span');
		span.innerHTML = '0/2000자';
		span.style.color = 'gray';
        
        row.append(label,textarea, span);

        this.prepend(row, hr);
	}
}	



class RadioInput extends HTMLElement {
    connectedCallback() {
    	// div - row
        let row = document.createElement('div');
        row.classList.add('row');
        let hr = document.createElement('hr');

        // span
        let textDiv = document.createElement('div');
        let span = document.createElement('span');
        span.innerHTML = this.getAttribute('name');
        
        // Radio buttons and labels
        let radioData = [
            { data: '1', value: '새상품(사용하지 않은 상품)' },
            { data: '2', value: '사용감 없음(사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음)' },
            { data: '3', value: '사용감 적음(눈에 띄는 흔적이나 얼룩이 약간 있음)' },
            { data: '4', value: '사용감 많음(눈에 띄는 흔적이나 얼룩이 많이 있음)' },
            { data: '5', value: '고장/파손 상품(기능 이상이나 외관 손상 등으로 수리/수선 필요)' }
        ];

        radioData.forEach(data => {
            let radioDiv = document.createElement('div');
            let radioInput = document.createElement('input');
            radioInput.type = 'radio';
            radioInput.name = this.getAttribute('name');
            radioInput.id = this.getAttribute('id-data');
            radioInput.value = data.data;

            let radioLabel = document.createElement('label');
            radioLabel.innerHTML = data.value;

            radioDiv.append(radioInput, radioLabel);
            textDiv.appendChild(radioDiv);
        });

        textDiv.prepend(span);
        row.appendChild(textDiv);
        this.prepend(row, hr);
    }
}



class SelectInput extends HTMLElement {
    connectedCallback() {
    	// div - row
        let row = document.createElement('div');
        row.classList.add('row');
        let hr = document.createElement('hr');

        // span
        let span = document.createElement('span');
        span.innerHTML = this.getAttribute('name');
		
        let selectDiv = document.createElement('div');
        selectDiv.style.border = '1px';
        
        let select = document.createElement('select');
        select.name = this.getAttribute('name');
        select.id = this.getAttribute('id');
        select.style.width = '20%';
        select.style.height = '100%';

        let options = [
            { value: '1', label: '의류'},
            { value: '2', label: '식품'},
            { value: '3', label: '전자'},
            { value: '4', label: '잡화'},
            { value: '5', label: '기타'}
        ];

        options.forEach(optionData => {
            let option = document.createElement('option');
            option.text = optionData.label;
            option.value = optionData.value;
            select.add(option);
        });

        selectDiv.append(select);
        row.append(span, selectDiv);

        this.prepend(row, hr);
    }
}

class AddressInput extends HTMLElement {
    connectedCallback() {
		document.write('<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>');
		
    	// div - row
        let row = document.createElement('div');
        row.classList.add('row');
        let hr = document.createElement('hr');

        // span
        let span = document.createElement('span');
        span.innerHTML = this.getAttribute('name');

        let addressDiv = document.createElement('div');
        let button = document.createElement('button');
        button.innerHTML = '주소 검색';
        button.style.width = '10%';
        button.style.backgroundColor = 'white';
        button.style.borderRadius = '10px';
        button.id = 'search-address';
        button.type = 'button';
        button.onclick = execDaumPostcode;
        
        let locationSpan = document.createElement('label');
        locationSpan.id = this.getAttribute('id-data');
        locationSpan.innerHTML = '설정된 주소 없음';
        
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					locationSpan.innerHTML = data.address;
				}
			}).open();
		}

        addressDiv.append(button, locationSpan);
        row.append(span, addressDiv);

        this.prepend(row, hr);
    }
}


	class ImageInput extends HTMLElement {
		connectedCallback() {
			// div - row
			let row = document.createElement('div');
			row.classList.add('row');
			let hr = document.createElement('hr');

	        // input - file
	        let fileDiv = document.createElement('div');
	        fileDiv.classList.add('col-12', 'd-flex', 'justify-content-center');

	        let label = document.createElement('label');
	        label.classList.add('btn', 'btn-warning', 'input-file-button');
	        label.htmlFor = 'btnAtt';
	        label.id = 'input-file-button';

	        let img = document.createElement('img');
	        img.src = '${pageContext.request.contextPath}/resources/img/board/addPhoto.png';

	        label.appendChild(img);

	        let fileInput = document.createElement('input');
	        fileInput.type = 'file';
	        fileInput.multiple = 'multiple';
	        fileInput.id = 'btnAtt';
	        fileInput.multiple = true;
	        fileInput.style.display = 'none';

	        fileDiv.append(label, fileInput);

	        // 미리보기 공간
	        let fileUploadZoneDiv = document.createElement('div');
	        fileUploadZoneDiv.classList.add('col-12', 'd-flex', 'justify-content-center');
	        fileUploadZoneDiv.id = 'att_zone';
	        fileUploadZoneDiv.dataset.placeholder = '파일을 첨부 하려면 이미지등록 버튼을 클릭하거나 드래그앤드롭 하세요 이미지 총 6장까지 하나당 5mb까지';

	        row.append(fileDiv, fileUploadZoneDiv);
	        this.prepend(row, hr);
		}
	}



class CheckboxInput extends HTMLElement {
	connectedCallback(){
		// div - row
		let row = document.createElement('div');
		row.classList.add('row');
		let hr = document.createElement('hr');
		
		let checkboxDiv = document.createElement('div');
	    checkboxDiv.classList.add('mt-3');
	    let check = document.createElement('input');
	    check.type = 'checkbox';
	    let label = document.createElement('label');
	    label.innerHTML = this.getAttribute('name');
	    checkboxDiv.appendChild(check);
	    checkboxDiv.appendChild(label);
		
        row.appendChild(checkboxDiv);

        this.prepend(row, hr);
	}
}
