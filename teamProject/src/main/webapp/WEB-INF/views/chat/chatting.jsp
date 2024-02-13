<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<jsp:include page="../template/header.jsp" />

<body class="d-flex flex-column min-vh-100">

	<div
		style="display: flex; justify-content: center; align-items: center;">

		<div class="row row-cols-1 row-cols-md-4 g-4 mt-12"
			style="display: flex;" id="main">
			<div style="border: 1px solid black; width: 100%; height: 1000px;">

			</div>

<style>

.li_1 {
	display: flex;
	width: 100%;
	float: left;
	align-items: center;
}
.li_1 {border:#FFF 2px solid; padding: 10px;}
.li_1:hover {border:#F00 2px solid;}

#my-input {
	visibility: hidden;
}

.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}

</style>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal">채팅하기</button>

			<!-- ChattingRoomModal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					<div class="modal-content data-bs-target="chatRoom" style="height: 650px;">
						<div class="modal-header">
							<h2>대화목록</h2>
							<div>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
						</div>
						<div class="modal-body">
							<div id="container">
								<aside>
									<header>
										<ul>
											<li class="li_1 openModal2" data-bs-target="chat" data-bs-toggle="modal">
											<img src="https://source.unsplash.com/random/?car"
												alt="random" width="80" height="80"
												style="margin-left: 20px; margin-right: 30px;">
												<div class="content">
													<h4>거래자 닉네임</h4>
													<span class="preview">메시지 미리보기</span> <span class="meta"
														style="margin-left: 300px;"> 2024-02-06 12:32 </span>
												</div>
											</li>
											<li class="li_1">
											<img src="https://source.unsplash.com/random/?car"
												alt="random" width="80" height="80"
												style="margin-left: 20px; margin-right: 30px;">
												<div class="content">
													<h4>거래자 닉네임</h4>
													<span class="preview">메시지 미리보기</span> <span class="meta"
														style="margin-left: 300px;"> 2024-02-06 12:32 </span>
												</div>
											</li>
										</ul>
									</header>
								</aside>
							</div>
						</div>
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>


			<!-- ChattingModal -->
			<div class="modal fade" id="chat" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					<div class="modal-content" style="height: 650px;">
						<div class="modal-header">
							<img src="https://source.unsplash.com/random/?car" alt="random"
								width="100" height="100">
								상품이름 : {123} <hr> 상품가격 : {123} 
							<button class="btn btn-primary" data-bs-target="#report" data-bs-toggle="modal">신고하기</button>
							<select name="likeLanguage" class="pl">
					            <option>판매중</option>
								<option>예약중</option>
								<option>거래완료</option>
					        </select>
							<div>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
						</div>
						<div class="modal-body">
							<div id="container">
								<aside>
									<header style="justify-content: flex-end;">
										<p id="word"></p>
									</header>
								</aside>
							</div>
						</div>
						<input type="file" id="selectedFile" style="display: none;" />

						<div class="input-group">
							<button class="btn btn-outline-secondary btn-sm"
								onclick="document.getElementById('selectedFile').click();">
								<img
									src="${pageContext.request.contextPath}/resources/img/chat/사진첨부이미지.png"
									width="25" height="25" />
							</button>
							<input type="text" class="form-control" id="txt"
								onkeypress="show_name(event)" style="height: 50px;">
							<button class="btn btn-outline-secondary btn-sm">
								<img
									src="${pageContext.request.contextPath}/resources/img/chat/보내기.png"
									width="25" height="25" />
							</button>
						</div>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#exampleModal">뒤로가기</button>
					</div>
				</div>
			</div>
			
			<!-- ReportModal -->
			<div class="modal fade" id="report" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h2>신고하기</h2>
							<div>
								<button type="button" class="openModal2 btn btn-primary" data-bs-dismiss="modal">나가기</button>
							</div>
						</div>
						<div class="modal-body">
							<div id="container">
								<aside>
									<header>
										<p class="fs-5">
									     <label> <input type="radio" name="rd01" checked>욕설 및 도배 </label> <br>
									     <label> <input type="radio" name="rd01">도배 </label> <br>
									     <label> <input type="radio" name="rd01">도난물품 </label> <br>
									     <label> <input type="radio" name="rd01">불법정보 </label> <br>
									     <input type="radio" name="rd01" id="cs_channel_etc" value="" class="radio" />
									     <span class="ml_10">기타</span>
									    </p>
									</header>
								</aside>
								<div id="etc_view" style="display:none;">
											 
								  <textarea class="form-control" placeholder="신고할 내용을 입력해주세요." id="floatingTextarea"
								  style="width:765px; height: 100px;"></textarea>
								  
								</div>
							</div>
						</div>

						<button type="button" class="btn btn-primary">신고하기</button>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>

<jsp:include page="../template/Footer.jsp" />
</html>

<script type="text/javascript">
	
	// 채팅
    function show_name(e){
       var word = document.getElementById("word");
       var txt = document.getElementById("txt").value;
       if(e.keyCode == 13){
           word.innerHTML = "닉네임: " + txt;
       }
    };
    
    // 채팅방에서 채팅 이동
    $(() => {
    	$(".openModal2").on("click", function(){
    		$("#chat").modal("show");
    	})
    });
    
    // 기타 선택시 텍스트박스
    $(function (){
 
	$('input[type="radio"][id="cs_channel_etc"]').on('click', function(){
		  var chkValue = $('input[type=radio][id="cs_channel_etc"]:checked').val();
		  if(chkValue){
		             $('#etc_view').css('display','none');
		  }else{
		             $('#etc_view').css('display','block');
		  }
	 
		});
	 
	});
    
</script>
