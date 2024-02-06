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

			<!-- ChattingModal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					<div class="modal-content" style="height: 800px;">
						<div class="modal-header">
							<img src="https://source.unsplash.com/random/?car" alt="random"
								width="100" height="100">
								상품이름 : 123 <hr> 상품가격 : 123 
							<button class="btn btn-primary" data-bs-target="name" data-bs-toggle="modal">신고하기</button>
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
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>



		</div>
	</div>
</body>

<jsp:include page="../template/Footer.jsp" />
</html>

<script type="text/javascript">
	
    function show_name(e){
       var word = document.getElementById("word");
       var txt = document.getElementById("txt").value;
       if(e.keyCode == 13){
           word.innerHTML = "닉네임: " + txt;
       }
    };
	
</script>