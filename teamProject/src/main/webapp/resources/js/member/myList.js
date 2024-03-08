$(function(){
	$('label').click(function(){
	$('label').removeClass('on');
	$(this).addClass('on');
	var idx=$(this).index()+1;

	$('.tab_content').css('display','none');
	$('.tab_content'+idx).css('display','block');
});	
})