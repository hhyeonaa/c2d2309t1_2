<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<title>글쓰기 입력폼 TEST</title>
<style>
span {
	font-weight: bold;
}


.input-file-button, #att_zone {
/*     display: inline-block; */
}
#att_zone {
/*   width: 660px; */
  width: auto;
  min-height: 150px;
  padding: 10px;
  border: 1px dotted #00f;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}

#input-file-button{
  padding: 10px 25px;
  background-color: white;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<form action="${pageContext.request.contextPath}/board/writeBoardPro" method="post" enctype="multipart/form-data">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="width: 100%;">
			<div class="container">
			  <div class="row">
			    <div class="col-12 d-flex justify-content-between mt-4">
   			      <select id="proTc" name="proTc" style="width: 100px;">
			      	<option id="sale" value="판매" selected>판매</option>
			      	<option id="buy" value="구매">구매</option>
			      	<option id="divide" value="나눔">나눔</option>
			      	<option id="auction" value="경매">경매</option>
			      </select>
			      <input type="hidden" id="proWr" name="proWr" value="${sessionScope.MEM_ID}">
			      <h2>상품 등록</h2>
			      <select id="selectPreBoard">
			      	<option value="" selected>임시저장글</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      </select>
			    </div>
			  </div>
			  
			 <hr>
			  
			  
			 <!-- -----------------test용 ------------------------- --> 
			  
			<div>
				<text-input name="상품명" id="subject" />
				<text-input name="작성자" id="name" />
				<text-input name="가격" id="price" />
				<textarea-input name="상세설명" id="content" />
				<radio-input name="상품 상태" id="state" />
				<select-input name="카테고리 선택" id="category" />
				<address-input name="거래 지역" id="address" />
				<image-input name="상품 이미지 등록" id="image" />
			</div>		
			
			<!-- ---------------------------------------------------------------- -->
			
			
			
			
			<div class="row p-3" style="position: sticky; bottom: 0; z-index: 99999; background-color: black;">
			    <div class="d-flex justify-content-evenly">
					<button class="btn btn-light" id="tempSave">임시저장</button>
					<button class="btn btn-warning" id="submitBtn">등록하기</button>
		    	</div>
		  	</div>

			</div>
		</div>
	</div>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/writeBoard.js"></script>

<script defer>
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
                { id: 'item1', value: '새상품', label: '사용하지 않은 상품' },
                { id: 'item2', value: '사용감 없음', label: '사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음' },
                { id: 'item3', value: '사용감 적음', label: '눈에 띄는 흔적이나 얼룩이 약간 있음' },
                { id: 'item4', value: '사용감 많음', label: '눈에 띄는 흔적이나 얼룩이 많이 있음' },
                { id: 'item5', value: '고장/파손 상품', label: '기능 이상이나 외관 손상 등으로 수리/수선필요' }
            ];

            radioData.forEach(data => {
                let radioDiv = document.createElement('div');
                let radioInput = document.createElement('input');
                radioInput.type = 'radio';
                radioInput.id = data.id;
                radioInput.value = data.value;

                let radioLabel = document.createElement('label');
                radioLabel.innerHTML = data.value + '<small>(' + data.label + ')</small>';

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
                '여성의류', '남성의류', '신발', '가방/지갑', '악세서리',
                '뷰티/미용', '식품', '가전제품', '음반/악기', '도서/티켓/문구',
                '가구/인테리어', '생활/주방용품', '반려동물용품', '잡화', '기타'
            ];

            options.forEach(optionText => {
                let option = document.createElement('option');
                option.text = optionText;
                select.add(option);
            });

            selectDiv.append(select);
            row.append(span, selectDiv);

            this.prepend(row, hr);
        }
    }
    
    class AddressInput extends HTMLElement {
        connectedCallback() {
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
            
            let locationSpan = document.createElement('label');
            locationSpan.innerHTML = '검색 결과: 부산 > 부전동';

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

			let span = document.createElement('span');
			span.innerHTML = this.getAttribute('name');
			// 첫줄
// 	      <label class="btn btn-warning input-file-button" for="btnAtt" id="input-file-button">
// 	      	<img src="${pageContext.request.contextPath}/resources/img/board/addPhoto.png">
// 	      </label>
// 	      <input type='file' id='btnAtt' multiple style="display: none;"/>
// 	      <button id="resetImg"><i class="bi bi-trash"></i></button>


//			<div class="col-12 d-flex justify-content-center">
			let addDiv = document.createElement('div');
			addDiv.style.justifyContent = 'center';
			
			
			
			let img = document.createElement('img');
// 			img.src = '${pageContext.request.contextPath}/resources/img/board/addPhoto.png';
			let input = document.createElement('input');
			input.type = 'file';
			let button = document.createElement('button');
			button.style.backgroundColor = 'white';
            button.style.borderRadius = '10px';
			button.innerHTML = '<i class="bi bi-trash"></i>';


			// 이미지 미리보기
//	 	    <div class="col-12 d-flex justify-content-center">
//	 	      <div id='att_zone' class="mt-3" data-placeholder="파일을 첨부 하려면 이미지등록 버튼을 클릭하거나 드래그앤드롭 하세요 이미지 총 6장까지 하나당 5mb까지"></div>
//	 	    </div>
			let preDiv = document.createElement('div');
			preDiv.style.justifyContent = 'center';
			
			addDiv.append(span, img, input, button);
// 			preDiv.append(span, addDiv, preDiv);
			row.append(span, addDiv, preDiv);
			this.prepend(row, hr);
		}
	}
    
    
	customElements.define('text-input', TextInput);
	customElements.define('textarea-input', TextareaInput);
	customElements.define('radio-input', RadioInput);
	customElements.define('select-input', SelectInput);
	customElements.define('address-input', AddressInput);
	customElements.define('image-input', ImageInput);
	
	
// div(2) - (input - checkbox)
//		let checkboxDiv = document.createElement('div');
//     checkboxDiv.classList.add('mt-3');
//     let check = document.createElement('input');
//     check.type = 'checkbox';
//     let label = document.createElement('label');
//     label.innerHTML = this.getAttribute('name') + ' 제안 받기';
//     checkboxDiv.appendChild(check);
//     checkboxDiv.appendChild(label);
</script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>