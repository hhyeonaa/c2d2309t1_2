document.write('<script type="text/javascript"' + 
               'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');

//$(function(){ /*alert 공통코드*/
//    // 버튼 클릭 이벤트 핸들러
//    $("#deleteBtn").click(function() {
//        if(alertMsg("AM4", ["모든 정보가 삭제됩니다.\n 계정"], true)){
//			$("#deleteForm").submit();
//        	alertMsg("AM18", ["회원"]);
//		}
//    });
//});