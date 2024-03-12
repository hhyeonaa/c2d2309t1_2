$(()=>{
	$('#yesLike').on('click', function(){
		if(confirm('찜을 취소하시겠습니까?')) {
			$.ajax({
				type: 'post'
				, url: 'deleteLike'
				, data: {LIK_NO: $('#LIK_NO').val()}
			})
			.done(function(data){
				if(data == '1'){
					$('#yesLike').remove();
					$('#likeBtn').prepend('<ion-icon id="noLike" name="heart-outline"></ion-icon>');
					$('#likeDiv').load(location.href+' #likeDiv');
				}
			});
		}
		else return;
	});
});		