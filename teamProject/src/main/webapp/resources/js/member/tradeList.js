$(function(){
	$('label').click(function(){
	$('label').removeClass('on');
	$(this).addClass('on');
	var idx=$(this).index()+1;

	$('.tab_content').css('display','none');
	$('.tab_content'+idx).css('display','block');
	
	});	
	
	
	$('#selectMenu').on('change', function(){
    var state = $(this).val(); // 선택된 옵션의 값

    // 모든 상품 숨기기
    $('.pro').hide();

    // 선택된 옵션에 따라 필터링
    switch(state){
        case "MM0": // 전체
            $('.pro').show();
            break;
        case "MM1": // 판매
            $('.proType[value="MM1"]').closest('.pro').show();
            break;
        case "MM2": // 구매
            $('.proType[value="MM2"]').closest('.pro').show();
            break;
        case "MM3": // 나눔
            $('.proType[value="MM3"]').closest('.pro').show();
            break;
        case "MM4": // 경매
            $('.proType[value="MM4"]').closest('.pro').show();
            break;
        default:
            break;
   	}
	});
	
	$('#selectMenu2').on('change', function(){
    var state2 = $(this).val(); // 선택된 옵션의 값
    // 모든 상품 숨기기
    $('.pro2').hide();

    // 선택된 옵션에 따라 필터링
    switch(state2){
        case "MM0": // 전체
            $('.pro2').show();
            break;
        case "MM1": // 판매
            $('.proType2[value="MM1"]').closest('.pro2').show();
            break;
        case "MM2": // 구매
            $('.proType2[value="MM2"]').closest('.pro2').show();
            break;
        case "MM3": // 나눔
            $('.proType2[value="MM3"]').closest('.pro2').show();
            break;
        case "MM4": // 경매
            $('.proType2[value="MM4"]').closest('.pro2').show();
            break;
        default:
            break;
   	}
	});
})