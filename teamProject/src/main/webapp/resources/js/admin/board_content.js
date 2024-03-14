document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

// 페이징 처리
$(() => {
	
	let columns = [
		{
			name: "PRO_NO",
			header:"번호",
		    sortable: true
		},
		{
			name: "PRO_NAME",
			header:"글제목",
			filter:"text",
			sortable: true
		},
		{
			name: "PRO_WR",
			header:"닉네임",
			filter:"text",
		    sortable: true
		},
		{
			name: "PRO_DATE",
			header:"글쓴시간",
			filter:"text",
		    sortable: true
		},  
		{
			name: "PRO_TC",
			header:"글종류",
			filter:"text",
		    sortable: true
		},
		{
			name:"DELETE",
			header:"삭제",
			renderer: { type: DeleteButton }
		}
	]
	
	targetColor($("#board_content"));
	fn_grid("board_contentPro", 5, columns);
	
	// 셀렉트 박스 체인지 이벤트	
	$("#boardCategory").on("change", function(){
		$.ajax({
			url: 'getBoardCategoryList',
			data:{
				category: $(this).val()
			}
		})
		
		// 테이블 그리기
		.done(function(data){
		$("#tbody").empty();
		for(content of data){
			var trTag = 
				'<tr>'
			    	+'<th class="proNo">'+content.PRO_NO+'</th>'
			        +'<td>'+content.PRO_NAME+'</td>'
			        +'<td>'+content.PRO_WR+'</td>'
			        +'<td>'+content.PRO_DATE+'</td>'
			        +'<th class="btnBox" scope="row">'
			        	+'<div>'
			        		+'<button type="button" class="btn-close delBtn"></button>'
						+'</div>'
			        +'</th>'
			    +'</tr>'
	    	$("#tbody").append(trTag);
		}
		
		// 카테고리 버튼 삭제
		$(".delBtn").on("click", function(){
				var curTr = $(this).parents("tr");
				$.ajax({
					url: 'cateContentDelete',
					data:{
						PRO_NO: $(this).parents(".btnBox").siblings(".proNo").text()
					}
				})
				.done(function(data){
					if(data.result == '1'){
						curTr.remove();	
					}
				})
			})
		})
		
	})	
	
})