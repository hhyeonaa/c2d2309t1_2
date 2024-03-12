$(function(){
	$('label').click(function(){
	$('label').removeClass('on');
	$(this).addClass('on');
	var idx=$(this).index()+1;

	$('.tab_content').css('display','none');
	$('.tab_content'+idx).css('display','block');
	
	});	
	
	
	$('#selectMenu').on('change', function(){
		var state = $('#selectMenu option:selected').val();
		switch(state){
			case "MM1" : 
				if($(".proType").val() != state){
					
				}
				break;
			case "MM2" : break;
			case "MM3" : break;
			case "MM4" : break;
			default :
		};
		
	})
})