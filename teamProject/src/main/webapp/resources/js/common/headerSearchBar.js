/**
 * 
 */

$(() => {
	
	headerSelect2($("#menu"));
	headerSelect2($("#category"));
	headerSelect2($("#trade"));
	headerSelect2($("#price"));
	
	$.ajax({
		url:"search",
		async: false
	})
	.done(function(data){
		for(var i = 0; i < data.MENU.length; i++){
			$("#hearderMenu").append(header(data.MENU[i].CODE, data.URL[i].url));
		}
		
		data.MENU.forEach(item => {
		 	$("#menu").append(selectBarData(item));
		});
		
		appendOptions("#category", data.CATEGORY);
		appendOptions("#trade", data.TRADE);
		appendOptions("#price", data.PRICE);
	})
	.fail(function(fail){
		alert(fail)
	})

	let slist = $("#selectedCodeList input");

	if(slist.length > 0){
//		$("#search").val('');
		let menu = $("#selectedCodeList .menu").val();
		let category = $("#selectedCodeList .category").val();
		let trade = $("#selectedCodeList .trade").val();
		let price = $("#selectedCodeList .price").val();
		let title = $("#selectedCodeList .title").val();
		
		$("#menu").val(menu).trigger('change');
		$("#category").val(category).trigger('change');
		$("#trade").val(trade).trigger('change');
		$("#price").val(price).trigger('change');
		$("#search").val(title);
	} 
	
	$(document).on("keydown", "#search", function(e){
		if(e.code === 'Enter') $('#searchButton').trigger("click");
	});
	$(document).on("click", "#searchButton", function(){
		let selectText = $("#menu option:selected").text();
		let aTagText = $("#hearderMenu a");
		for(var i = 0; i < aTagText.length; i++){
			if($(aTagText[i]).text() === selectText){
				$("#searchSubmit").attr("action", $(aTagText[i]).attr("href"));
				break;
			} 	
		}
		
		$("#submitBtn").trigger("click");
	})
})

function header(data, url){
	return  '<li class="menu">' +
				'<a class="nav-link ${fileName == saleBoard ? active : } pageLink" href="/' + window.location.pathname.split("/")[1] + url + '">' + data + '</a>' +
			'</li>'
}

function selectBarData(data){
	return '<option value="' + data.CO_TYPE + data.CO_NO + '">' + data.CODE + '</option>';
}

function appendOptions(selector, dataArray) {
  	$(selector).append('<option value="all">전체보기</option>');
  	dataArray.forEach(item => $(selector).append(selectBarData(item)));
}
//dataArray[0].CO_TYPE
var headerSelect2 = function(tag){
	tag.select2({
		placeholder: '전체 선택',
  		"language": {
    		"noResults": function (params) {
      			return "<b style='color:rgb(220, 20, 60, 0.5);'>찾을 수 없어요 :(</b>";
    		}
  		}
	})	
}

