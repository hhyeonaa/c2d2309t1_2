document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');
			   
// 페이징 처리
$(() => {

	let columns = [
		{
			name: "MEM_NO",
			header:"번호",
		    sortable: true
		},
		{
			name: "MEM_ID",
			header:"아이디",
			filter:"text",
			sortable: true,
			width: "auto"
		},
		{
			name: "MEM_NICK",
			header:"닉네임",
			filter:"text",
		    sortable: true,
			width: "auto"
		},  
		{
			name: "MEM_NAME",
			header:"이름",
			filter:"text",
			sortable: true
		},
		{
			name: "MEM_EMAIL",
			header:"이메일",
			filter:"text",
		    sortable: true,
			width: "auto"
		},
		{
			name: "MEM_DATE",
			header:"가입일",
			sortable: true,
		    filter:"text"
		},
		{
			name: "RPT_USER_NO",
			header:"누적신고",
		    filter:"text",
		    sortable: true
		},
		{
			// 셀렉트 박스 설명!!!!!!!!!!!!!!!!!!!!!  (숫자 순서대로 볼 것)
			name:"MEM_CAT", // 5. (중요!!) 이 부분 name 원래 JOIN 해서 들고온 데이터에 맞춰서 ROL_NAME 컬럼이었는데 
						   //    , 3번 설명처럼 text 속성에 join으로 들고 올 데이터("총괄", "운영", ..) 하드 코딩했으므로 걍 fk인 ROL_NO 컬럼 사용 
						   //    (adminMapper.xml id=getAdminList 주석 봐바)
			header:"회원상태",
			filter:"text",
		    sortable: true,
			formatter: "listItemText", // 4. 이거 없이 하면 셀렉트 박스로 값 변경할 때, 그리드에 text 속성들이 표시되는게 아니라 value 속성들이 표시됨.
		    editor: { // 1. 셀렉트 박스 쓰려면 editor 속성을 아래와 같은 형식으로.
				type: "select", // 2. type: "select" 이것도 고정.
				options: {
					listItems: [ // 3. 이 배열 안에 하드코딩으로 적으면 됨. (text: 그리드에 보여줄 부분, value: 실제 admin 테이블에서 변경될 값) 
						{text: "정상", value: "0"},
						{text: "정지", value: "1"},
						{text: "탈퇴", value: "2"}
					]
				}
			}
			// 셀렉트 박스 설명!!!!!!!!!!!!!!!!!!!!!
		},
	]
	
	targetColor($("#member_manage"));
	fn_grid("member_managePro", 5, columns);
	excel('download', 'MEMBERS');
})
