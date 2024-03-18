/**
 * 
 */
function alertMsg(msg = "AM0", arr = ["error"], type = false){
	
	if(typeof(msg) != 'string'){
		console.log("첫번째 인수(메세지 코드타입)은 String형 이어야 합니다.");
		return;	
	} else if(typeof(arr) != 'object'){
		console.log("두번째 인수(원하는 메세지 데이터)는 배열로 전달받아야 합니다.");
		return;
	} else if(typeof(type) != 'boolean'){
		console.log("세번째 인수을 사용할 경우 boolean형 이어야 합니다.");
		return;
	} 
	
	for(const arrList of arr){
		if(typeof(arrList) != 'string'){
			console.log("전달 받은 배열의 인수가 string형이 아닙니다.");
			return;
		}
	}
	
	var msgReturn = "";

	$.ajax({
		type: "get",
		url: "alert",
		data: {
			msgArr : arr,
			msgText : msg,
			msgIsTrue : type
		},
		async: false
	})
	.done(function(data){
		if(JSON.parse(data.isConfirm)){
			msgReturn = confirm(data.CODE);						
		} else {
			msgReturn = alert(data.CODE);
		}
	})
	
	return msgReturn;
}

const codeName = {
	메세지: "AM",
	카테고리항목: "CM", 
	신고항목: "DCM", 
	가격범위: "PM", 
	거래상태: "TM", 
	배송안내문구: "DLM",
	메뉴항목: "MM",
	상품상태: "PS",
	상세설명: "DD"
}
Object.freeze(codeName);

const columnTitle = {
	타입 : "CO_TYPE",
	번호 : "CO_NO",
	내용 : "CODE",
	순서 : "SEQ",
	속성 : "CO_DETAIL",
	권한 : "ROLE_NO",
	활성여부_관리자 : "HIDE",
	활성여부_사용자 : "ACTIVE",
}
Object.freeze(columnTitle);

