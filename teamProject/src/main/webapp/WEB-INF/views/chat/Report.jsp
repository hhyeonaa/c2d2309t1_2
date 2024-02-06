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
</style>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal">모달</button>

			<!-- ChattingRoomModal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div
					class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					<div class="modal-content" style="height: 800px;">
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



		</div>
	</div>
</body>

<jsp:include page="../template/Footer.jsp" />
</html>

