<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/board/divideDetail.css" rel="stylesheet">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div class="d-flex flex-wrap" style="width: 100%;">
			<div class="pe-2" style="width: 40%;height: 400px;">
		 	 <div id="carouselExampleIndicators" class="carousel slide">
			  <div class="carousel-indicators">
   			  	<c:forEach var="img" items="${imgList}" varStatus="status">
			  		<c:if test="${status.index eq 0}">
			  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" class="active" aria-current="true" aria-label="Slide ${status.count }"></button>
			  		</c:if>
			  		<c:if test="${status.index ne 0}">
			  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" aria-label="Slide ${status.count }"></button>
			  		</c:if>
			  	</c:forEach>
			  </div>
			  <div class="carousel-inner">
			  	<c:forEach var="img" items="${imgList}" varStatus="status">
			  		<c:if test="${status.index eq 0}">
			  			<div class="carousel-item active">
					      <img src="${pageContext.request.contextPath}/resources/img/uploads/${img}" class="d-block" style="width: 414px;height: 385px;" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
					    </div>
			  		</c:if>
			  		<c:if test="${status.index ne 0}">
			  			<div class="carousel-item">
					      <img src="${pageContext.request.contextPath}/resources/img/uploads/${img}" class="d-block" style="width: 414px;height: 385px;" alt="..." onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
					    </div>
			  		</c:if>
			  	</c:forEach>
			  </div>
			  	<div class="imgModal">
				    <div class="modalBox"></div>
				</div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			 </div>
			</div>
		 	<div style="width: 60%; height: 400px;">
		 	<input type="hidden" id="memId" value="${sessionScope.MEM_ID}">
		 	<input type="hidden" id="proNo" value="${resultMap.PRO_NO}">
		 	<input type="hidden" id="proTc" value="${resultMap.PRO_TC}">
		 	<input type="hidden" id="proWr" value="${resultMap.PRO_WR}">
		 	<input type="hidden" id="proDate" value="${resultMap.PRO_DATE}">
		 		<table>
		 			<tr><th>${resultMap.PRO_NAME}</th>
		 				<c:if test="${sessionScope.MEM_ID eq resultMap.PRO_WR}">
		 					<th><button id="deleteBoard" class="btn btn-secondary">삭제</button></th>
		 				</c:if>
		 			</tr>
		 			<tr><th>${resultMap.PRO_PRICE}원</th></tr>
		 		</table>
		 	<hr><fmt:parseDate var="parsedDate" value="${resultMap.PRO_DATE}" pattern="yyyyMMddHHmmss"/>
		 		<table class="table"><!--  table-borderless -->
		 			<tr>
			 			<td><img src="${pageContext.request.contextPath}/resources/img/common/heart.png">  ${resultMap.LIKES_COUNT}</td>
			 			<td><i class="bi bi-eye"></i>${resultMap.PRO_HITS}</td>
			 			<td><i class="bi bi-calendar3"></i><fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss "/>${newFormattedDateString }</td>
			 			<!-- 로그인 후 신고하기 버튼 보이기 -->
						<c:choose> 
						    <c:when test="${empty sessionScope.MEM_ID}">
						        <!-- 사용자가 로그인하지 않은 경우 -->
						        <td></td>
						    </c:when>
						    <c:when test="${sessionScope.MEM_ID ne resultMap.PRO_WR}">
						        <!-- 사용자가 로그인했지만, 게시물 작성자와 다른 경우 -->
						        <td><a id="pageReport" style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#exampleModalReport">
						            <img src="${pageContext.request.contextPath}/resources/img/board/report.png">신고하기</a></td>
						    </c:when>
						    <c:otherwise>
						    	<td></td>
						    </c:otherwise>
						</c:choose>
		 			</tr>
		 			<tr>
		 				<td>상품상태:</td>
		 				<c:set var="statusValue" value="${resultMap.PRO_STATUS_CODE}" />
		 				<c:choose>
						    <c:when test="${fn:contains(statusValue, '(')}">
						        <td>${fn:substringBefore(statusValue, '(')}</td>
						    </c:when>
						    <c:otherwise>
						        <td>${statusValue}</td>
						    </c:otherwise>
						</c:choose>
		 			</tr>
		 			<tr>
		 				<td>카테고리:</td>
		 				<td><a href="#">${resultMap.PRO_CATE_CODE}</a></td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>배송비:</td>
		 				<td>배송비 포함</td>
		 				<td></td>
		 				<td></td>
		 			</tr>
		 			<tr>
		 				<td>거래지역:</td>
		 				<td colspan="2"><i class="bi bi-building-check"></i>${resultMap.PRO_ADDRESS}</td>
		 				<td></td>
		 			</tr>	
		 			<tr>
		 				<td colspan="4">
		 					<c:if test="${empty sessionScope.MEM_ID }">
		 						<button class="btn btn-lg border" id="noUserBtn">찜
		 							<ion-icon name="heart-outline"/>
	 							</button>
	 						</c:if>	
	 						<c:if test="${not empty sessionScope.MEM_ID}">
			 					<button class="btn btn-lg border" id="likeBtn">찜
			 						<span id="likNo" style="display: none;">${resultMap.LIK_NO}</span>
			 						
									    <ion-icon id="yesLike" name="heart-sharp" style="color:#E21818;" 
									              ${resultMap.LIK_NO ne '0' ? '' : 'hidden="hidden"'}></ion-icon>
									    <ion-icon id="noLike" name="heart-outline" 
									              ${resultMap.LIK_NO eq '0' ? '' : 'hidden="hidden"'}></ion-icon> 
			 					</button>
		 					</c:if>
		 					<button class="btn btn-warning btn-lg">신청자 확인</button>
		 					<c:if test="${resultMap.PRO_TSC eq 'TM1'}">
		 					<button class="btn btn-success btn-lg" id="shareApplication">나눔신청</button>
		 					</c:if>
		 				</td>
<!-- 			 			<td><button class="btn btn-danger btn-lg">찜</button></td> -->
<!-- 			 			<td><button class="btn btn-warning btn-lg">채팅</button></td> -->
<!-- 			 			<td><button class="btn btn-success btn-lg">바로구매</button></td> -->
<!-- 			 			<td></td> -->
		 			</tr>	 			
		 		</table>
		 	</div>
		 	<div id="shareList" style="width: 70%; height: auto; display: none;">
		 	<div class="input-group mb-3" style="width: 320px;">
				<input type="text" class="form-control" id="divApplicant" placeholder="" aria-label="" aria-describedby="apply" value="${sessionScope.MEM_ID}" readonly>
				<button class="btn btn-primary" type="button" id="apply">신청</button>
			</div>
<!-- 		 		<div> -->
<%-- 		 			<input type="text" value="${sessionScope.MEM_ID}" readonly><button id="apply">신청</button> --%>
<!-- 		 		</div> -->
		 		<div>
		 			<textarea id="appTxt" style="resize: none; " cols="40" rows="3" placeholder="나눔 신청 사유 또는 이유를 적어주세요."></textarea>
		 		</div>
		 	</div>
			<div class="mt-3" style="width: 70%; height: auto;">
			    <table class="table">
			        <tr>
			            <td colspan="7">연관상품</td>
			        </tr>
			        <tr>
			            <td colspan="7">
			                <div style="display: flex; flex-wrap: wrap;">
			                    <c:forEach var="img" items="${relatedImg}">
			                        <div style="margin-right: 10px; margin-bottom: 10px;">
			                            <a href="${pageContext.request.contextPath}/board/divideDetail?proWr=${img.PRO_WR}&proDate=${img.PRO_DATE}">
			                                <img src="${pageContext.request.contextPath}/resources/img/uploads/${img.IMG_NAME}" style="width: 134px; height: 134px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'">
			                            </a>
			                        </div>
			                    </c:forEach>
			                </div>
			            </td>
			        </tr>
			    </table>
			</div>
		 	<div style="width: 70%; height: auto;">
		 		<table class="table">
		 			<tr><td colspan="6">상품 상세 정보</td><tr>
		 			<tr><td colspan="6"><textarea rows="10" cols="90" readonly>${resultMap.PRO_CONTENT}</textarea></td></tr>
<!-- 		 			<tr style="text-align: center;"> -->
<!-- 		 				<td colspan="3"></td> -->
<!-- 		 				<td colspan="3"></td> -->
<!-- 		 			</tr> -->
		 		</table>
		 		<c:forEach var="applicant" items="${selectDivList}">
		 			<input type="hidden" class="divApp" value="${applicant.DIV_APPLICANT}">
		 		</c:forEach>
		 		<c:if test="${sessionScope.MEM_ID eq resultMap.PRO_WR}">
		 		<table class="table">
		 			<tr><td colspan="1">신청자 정보</td><td colspan="2">신청 이유</td><td colspan="3"></tr><tr>
	 				<c:forEach var="applicant" items="${selectDivList}">
			 			<tr>
				 			<td colspan="1">${applicant.MEM_NICK}</td>
				 			<td colspan="3">${applicant.DIV_REASON}</td>
				 			<td colspan="1"><button class="divideChatStartBtn chat-button btn btn-warning mx-4">채팅하기</button></td>
				 			<td colspan="1"><button class="btn delBtn">x</button></td>
			 			</tr>
		 			</c:forEach>
		 		</table>
		 		</c:if>
		 		<c:if test="${sessionScope.MEM_ID eq resultMap.PRO_WR}">
			 		<c:if test="${resultMap.PRO_TSC ne 'TM3'}">
				 		<div class="d-grid gap-2">
						  <button class="btn btn-secondary" type="button" id="updateBtn">글 수정</button>
						</div>
					</c:if>
				</c:if>
		 	</div>
		<div style="width: 30%; height: auto;">
			 <table class="table" style="text-align: center;">
			   <tr>
			     <td colspan="2">게시자 정보</td>
			   </tr>
			   <tr>
			     <td><img src="${pageContext.request.contextPath}/resources/img/uploads/${resultMap.MEM_IMAGE}" style="width: 60px; height: 60px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></td>
			     <td>${resultMap.PRO_WR}<br>(<small>상품 ${resultMap.count}</small>)</td>
			   </tr>
			 </table>
			 
			 <div style="display: flex; flex-wrap: wrap;">
			   <c:forEach var="board" items="${allBoard}">
			     <div style="width: 50%; padding: 5px; box-sizing: border-box;">
			     	<c:if test="${board.TABLENAME eq 'PRODUCT'}">
			     		<c:if test="${board.TRADE eq 'MM3'}">
				      	 <a href="${pageContext.request.contextPath}/board/divideDetail?proWr=${board.WRITER}&proDate=${board.POSTING_DATE}"><img alt="" src="${pageContext.request.contextPath}/resources/img/uploads/${board.IMG_NAME}" style="width: 150px; height: 150px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></a>
			     		</c:if>
			     		<c:if test="${board.TRADE ne 'MM3'}">
				      	 <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${board.WRITER}&proDate=${board.POSTING_DATE}"><img alt="" src="${pageContext.request.contextPath}/resources/img/uploads/${board.IMG_NAME}" style="width: 150px; height: 150px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></a>
			     		</c:if>
			     	</c:if>
			     	<c:if test="${board.TABLENAME eq 'AUCTION'}">
			      	 <a href="${pageContext.request.contextPath}/board/auctionDetail?aucSeller=${board.WRITER}&aucDate=${board.POSTING_DATE}"><img alt="" src="${pageContext.request.contextPath}/resources/img/uploads/${board.IMG_NAME}" style="width: 150px; height: 150px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></a>
			     	</c:if>
			     </div>
			   </c:forEach>
			 </div>
		</div>

	</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/divideDetail.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/startChat.js"></script>
<script type="text/javascript">

</script>
<jsp:include page="../template/Footer.jsp"/>
</html>