/**
 * 
 */
$(() => {
	
	$.ajax({
		url:"mainSideBar"
	})
	.done(function(data){
		debugger;
		if(data[0].isTrue){
			$("#isEmpty").show();
			$("#nickNameCheck").hide();
			$("#isNotEmpty").hide();
		} else {
			$("#isEmpty").hide();
			$("#nickNameCheck").show();
			$("#isNotEmpty").show();
		}
		$("#likeItemsCount").append(data[1].count);
	})
})