/**
 * 
 */
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
			   '</script>');  
$(() => {
 
 	targetColor($("#message_manage"));
 
	let columns = [
		{
			name: columnTitle.번호,
			header:"번호",
		    sortable: true
		},
		{
			name: columnTitle.타입,
			header:"코드타입"
		},
		{
			name: columnTitle.내용,
			header:"코드내용",
			filter:"text",
		    sortable: true,
		    editor: "text"
		},  
		{
			name: columnTitle.활성여부_관리자,
			header:"숨김 여부",
			filter:"select",
		    sortable: false,
			renderer: {
	            type: ToggleButton
	        }
		},
		{
			name:"",
			header:"삭제",
			renderer: {
	            type: DeleteButton
	        }
		}
	]
	
	const msg = "해당 이름은 사용이 불가능합니다. 다른 이름을 사용 해주세요.";
	msgFormatting(msg);

	$("#excel").remove();
	$("#grid").empty();
	grid("message_managePro", 5, columns, false);
	excel('updownload', 'MESSAGE'); 
 
 	var modal = $('#addModal');
 
 	$('#btnAdd').on('click', function(){
		modal.css('display', 'block');
	});
	
	$('#close, #cancelBtn').on('click', function(){
		modal.css('display', 'none');
	});	 
 	
})

function msgFormatting(msg){
	const particles = ['은(는)', '이(가)', '을(를)', '의', '와(과)', '까지'];

	const result = msg.split(" ").map((word, index) => {
	  	const lastChar = word.slice(-1);
	  	const foundParticle = particles.find(p => lastChar === p[1] && lastChar === (p[3] || p[2]));
	  	return foundParticle ? `{${index}}${foundParticle.slice(2)}` : word;
	}).join(" ");
	
	return result;
}
