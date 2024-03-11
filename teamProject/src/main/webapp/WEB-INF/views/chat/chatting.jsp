<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModal">신고하기</button>

<%-- <c:forEach var="dcm" items="${dcm}"> --%>
<%-- 	<p>${dcm.CODE}</p> --%>
<%-- </c:forEach> --%>

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
			
			
			
			

</body>
</html>