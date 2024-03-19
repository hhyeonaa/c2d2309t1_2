document.write('<script type="text/javascript"' + 
               'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/alertMessage.js">' +
               '</script>');

$(function(){ /*alert 공통코드*/
    // 버튼 클릭 이벤트 핸들러
    $("#confirmButton").click(function() {
        if(alertMsg("AM20", ["구매"], true)){
			$("#transactionForm").submit();
        	alertMsg("AM3", ["구매확정"]);
		}
    });
});