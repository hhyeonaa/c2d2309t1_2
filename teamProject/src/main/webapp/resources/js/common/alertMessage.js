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

