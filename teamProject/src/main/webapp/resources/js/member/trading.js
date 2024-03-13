$(function(){ /*alert 공통코드*/
    // 버튼 클릭 이벤트 핸들러
    $("#confirmButton").click(function() {
        var confirmMessage = "구매를 확정하시겠습니까?";
        if (confirm(confirmMessage)) {
            $("#transactionForm").submit();
            alert("구매가 확정되었습니다.")
        }
    });
});