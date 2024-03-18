<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#muchangCustomColor {
  font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
  font-size: 18px;
  letter-spacing: 1px;
  text-align: center;
  color: #f35626;
  background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -webkit-animation: hue 10s infinite linear;
}

@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }
  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}
</style>
</div>
<div class="sidebar222 text-center fw-bold  d-flex  flex-column" style="width: 21.8%;">
<!--   	<div id="muchangCustomColor" class="border border-dark-subtle mb-2 p-1"> -->
<!--   		<div id="isNotEmpty"> -->
<!-- 	  		<div >찜한상품</div> -->
<%-- 	  		<div ><a id="likeItemsCount" class="text-danger" href="${pageContext.request.contextPath}/member/likeList"><img src="${pageContext.request.contextPath}/resources/img/common/heart.png">&nbsp;</a></div> --%>
<!--   		</div> -->
<!--   		<div id="isEmpty">	 -->
<%--   			<div><a href="${pageContext.request.contextPath}/member/login">로그인</a></div> --%>
<!--   		</div>	 -->
<!--   	</div> -->
  	
<!--   	<div class="border border-dark-subtle mb-2 p-1"> -->
<!--   		<div>최근본상품</div> -->
<!--   		<div class="text-danger mb-3" style="width:38px; border-bottom: 2px dotted rgb(136, 136, 136); margin: 0 auto;">1</div> -->
<%--   		<div><img src="${pageContext.request.contextPath}/resources/img/common/noImage.png"></div> --%>
<!--   		<div style="color: rgb(204, 204, 204);">최근본 상품이<br>없습니다.</div> -->
<!--   	</div> -->
  		
<!-- 	  	<div class="border border-dark-subtle mb-2"> -->
<!-- 			<button id="nickNameCheck" type="button" class="btn btn-light rounded-0 fw-bold" style="color:salmon; font-size:12px; width:100%; height:100%;">환영합니다:)</button> -->
<!-- 	  	</div> -->
  	
  	<div id="chatBtn"  class="mt-auto" style="margin-bottom: 100px;">
  		<img src="${pageContext.request.contextPath}/resources/img/common/chat.png" style="width:100px; height:100px;"></a>
  	</div>
</div>
</div>

<footer id="footer" class="footer mt-auto ">
    <div class="footer-legal">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
            <div class="copyright">
              <strong>다모임</strong>
            </div>
            <div class="copyright">
              회사소개&nbsp;|&nbsp;이용약관&nbsp;|&nbsp;개인정보처리방침 <br>
              이메일무단수집거부&nbsp;|&nbsp;채용안내&nbsp;|&nbsp;광고문의
            </div>
            <div class="credits">
              (47246) 부산광역시 부산진구 부전동 동천로 109 삼한골든게이트 7층&nbsp;|&nbsp;051-803-0909<br>
              Copyright © GGULDANGGEUNJANGTEO Cultureworks All Right Reserved.
            </div>
          </div>
          <div class="col-md-6">
            <div class="social-links mb-3 mb-lg-0 text-center text-md-end">
              <a href="#" class="twitter"><i class="bi bi-twitter mt-3"></i></a>
              <a href="#" class="facebook"><i class="bi bi-facebook pt-3"></i></a>
              <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
              <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
<!-- 채팅 모달 -->
<div id="chatModal">
	<div id="chatContainer">
		<div id="exit">X</div>
		<div id="chatListContainer">
			<div id="chatListTit">
				<span id="yourPostChat" class="on">내가 건 채팅</span> / 
				<span id="myPostChat">내 게시물 채팅</span>
			</div>
			<div id="chatList">
<!-- 				<div class="chatRoom myPost" id="PR23"> -->
<!-- 					<div> -->
<%-- 						<img alt="프로필 사진" src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg"> --%>
<!-- 					</div> -->
<!-- 					<div class="chatRoomContents"> -->
<!-- 						<div class="userNick">[닉네임]</div> -->
<!-- 						<div class="postTit">내 게시물 제목</div> -->
<!-- 						<div class="lastChat">마지막 채팅 내용</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="chatRoom notMyPost" id="PR25"> -->
<!-- 					<div>이미지</div> -->
<!-- 					<div class="chatRoomContents"> -->
<!-- 						<div class="userNick">[jaewon]</div> -->
<!-- 						<div class="postTit">노트북</div> -->
<!-- <!-- 						<div class="lastChat">마지막 채팅 내용</div> --> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
		
		<div id="chatContentsContainer">
			<div id="chatHead">
<!-- 				<div class="chatRoomContents"> -->
<!-- 					<div class="userNick">[닉네임]</div> -->
<!-- 					<div class="postTit">다른 게시물 제목</div> -->
<!-- 				</div> -->
<!-- 				<div id="systemContainer"> -->
<!-- 					<div class="reportBtn"> -->
<!-- 							<a style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#exampleModalReport"> -->
<!-- 								<span class="material-symbols-outlined reportIcon">notifications_active</span> -->
<!-- 							</a> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<select class="form-select"> -->
<!-- 							<option>거래가능</option> -->
<!-- 							<option>거래중</option> -->
<!-- 							<option>거래완료</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<span style="margin-bottom: 5px; font-size: 12px;">게시판 작성자만 사용 가능합니다</span> -->
<!-- 				</div> -->
			</div>
			<div id="chatBody">
				<span id="chatChoicePlease">채팅을 선택해주세요</span>
<!-- 				<div class="my Chat"> -->
<!-- 					<div class="flexBox"> -->
<!-- 						<div class="chatTime">오후 6:48</div> -->
<!-- 						<div class="chatContent">안녕하세요. 아직 판매하나요?</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="your Chat"> -->
<!-- 					<div>[닉네임]</div> -->
<!-- 					<div class="flexBox"> -->
<!-- 						<div class="chatContent">안녕하세요</div> -->
<!-- 						<div class="chatTime">오후 6:50</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="your Chat"> -->
<!-- 					<div>[닉네임]</div> -->
<!-- 					<div class="flexBox"> -->
<!-- 						<div class="chatContent">아직 판매중이에요!</div> -->
<!-- 						<div class="chatTime">오후 6:51</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div id="chatBar"> -->
<!-- 					<input id="sendText" class="form-control" type="text" placeholder="메시지를 입력해주세요."> -->
<!-- 					<button id="sendBtn" class="btn">전송</button> -->
<!-- 				</div> -->

			</div>
		</div>
	</div>
</div>
<!-- 신고하기 모달 -->
		<div class="modal fade" id="exampleModalReport" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h2>신고목록</h2>
					<div>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				</div>
				<div class="modal-body">
					<div id="container">
						<aside>
							<header>
								<p class="radioBox fs-5">
								
							    </p>
							</header>
						</aside>
					</div>
				</div>
<!-- 				<button type="button" class="btn btn-primary" id="reportBtn">신고하기</button> -->
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/common/footerLikeBar.js"></script>
<!--   <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a> -->