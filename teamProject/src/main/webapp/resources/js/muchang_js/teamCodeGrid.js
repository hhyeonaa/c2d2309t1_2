/**
 * 
 */

 var columns = [
		{
			name:"CO_TYPE",
			header:"코드타입",
			filter:"text"
		}, 
		{
			name:"CODE_NO",
			header:"ID",
			filter: {
		        type: 'number',
		        showApplyBtn: true,
		        showClearBtn: true
		    }
		},
		{
			name:"AD_NAME",
			header:"이름",
			filter:"text"
		},
		{
			name:"AD_ACTIVE",
			header:"활성 상태",
			filter:"select"
		},
		{
			name:"CI_OC",
			header:"삭제"
		}
	]
	grid("managerList", 5, columns);