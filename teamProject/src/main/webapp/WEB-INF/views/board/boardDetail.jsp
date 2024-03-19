<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/board/boardDetail.css" rel="stylesheet">
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div class="d-flex flex-wrap" style="width: 100%;">
			<div class="pe-2" style="width: 40%;height: 400px;">
		 	 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			  	<c:forEach var="img" items="${imgList}" varStatus="status">
			  		<c:if test="${status.index eq 0}">
			  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" class="active" aria-current="true" aria-label="Slide ${status.count }"></button>
			  		</c:if>
			  		<c:if test="${status.index ne 0}">
			  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" aria-label="Slide ${status.count }"></button>
			  		</c:if>
			  	</c:forEach>
<!-- 			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button> -->
<!-- 			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button> -->
<!-- 			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
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
<!-- 			  		<div class="carousel-item"> -->
<%-- 				      <img src="${pageContext.request.contextPath}/resources/img/uploads/${img}" class="d-block w-100" alt="..."> --%>
<!-- 				    </div> -->
			  	</c:forEach>
<!-- 			    <div class="carousel-item active"> -->
<%-- 			      <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="d-block w-100" alt="..."> --%>
<!-- 			    </div> -->
<!-- 			    <div class="carousel-item"> -->
<%-- 			      <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="d-block w-100" alt="..."> --%>
<!-- 			    </div> -->
<!-- 			    <div class="carousel-item"> -->
<%-- 			      <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="d-block w-100" alt="..."> --%>
<!-- 			    </div> -->
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
		 	<input type="hidden" id="proNo" value="${resultMap.PRO_NO}">
		 	<input type="hidden" id="proTc" value="${resultMap.PRO_TC}">
		 	<input type="hidden" id="proWr" value="${resultMap.PRO_WR}">
		 	<input type="hidden" id="proDate" value="${resultMap.PRO_DATE}">
		 	<input type="hidden" id="memId" value="${sessionScope.MEM_ID}">
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
			 			<td><img src="${pageContext.request.contextPath}/resources/img/common/heart.png"> ${resultMap.LIKES_COUNT}</td>
			 			<td><i class="bi bi-eye"></i> ${resultMap.PRO_HITS}</td>
			 			<td><i class="bi bi-calendar3"></i><fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss "/>${newFormattedDateString }</td>
			 			<!-- 로그인 후 신고하기 버튼 보이기 -->
						<c:choose> 
						    <c:when test="${empty sessionScope.MEM_ID}">
						        <!-- 사용자가 로그인하지 않은 경우 -->
						    </c:when>
						    <c:when test="${sessionScope.MEM_ID ne resultMap.PRO_WR}">
						        <!-- 사용자가 로그인했지만, 게시물 작성자와 다른 경우 -->
						        <td><a id="pageReport" style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#exampleModalReport">
						            <img src="${pageContext.request.contextPath}/resources/img/board/report.png">신고하기</a></td>
						    </c:when>
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
		 					<button class="btn btn-warning btn-lg startChatBtn">채팅</button>
		 					<c:if test="${sessionScope.MEM_ID ne null}">
		 					<c:if test="${sessionScope.MEM_ID ne resultMap.PRO_WR}">
			 					<c:if test="${resultMap.PRO_TSC eq 'TM1' && resultMap.PRO_TC ne 'MM2'}">
			 						<button class="btn btn-success btn-lg" onclick="location.href ='${pageContext.request.contextPath}/pay/payment?buyer=${sessionScope.MEM_ID}&proWr=${resultMap.PRO_WR}&proDate=${resultMap.PRO_DATE}'">바로구매</button>
			 					</c:if>
		 					</c:if>
		 					</c:if>
		 				</td>
<!-- 			 			<td><button class="btn btn-danger btn-lg">찜</button></td> -->
<!-- 			 			<td><button class="btn btn-warning btn-lg">채팅</button></td> -->
<!-- 			 			<td><button class="btn btn-success btn-lg">바로구매</button></td> -->
<!-- 			 			<td></td> -->
		 			</tr>	 			
		 		</table>
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
			                        <div style="margin-right: 10px;">
			                            <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${img.PRO_WR}&proDate=${img.PRO_DATE}">
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
		 			<tr style="text-align: center;">
		 				<td colspan="3"></td>
		 				<td colspan="3"></td>
		 			</tr>
		 		</table>
		 		<c:if test="${sessionScope.MEM_ID eq resultMap.PRO_WR}">
			 		<!-- 거래 완료면 수정이 불가능하다. -->
			 		<c:if test="${resultMap.PRO_TSC ne 'TM3'}">
				 		<div class="d-grid gap-2">
						  <button class="btn btn-secondary" type="button" id="updateBtn">글 수정</button>
						</div>
					</c:if>
				</c:if>
		 	</div>
		 	<div style="width: 30%; height: auto;">
		 		<table class="table" style="text-align: center;">
		 			<tr><td colspan="2">게시자 정보</td></tr>
		 			<tr>
		 				<td><img src="${pageContext.request.contextPath}/resources/img/uploads/${resultMap.MEM_IMAGE}" style="width: 60px; height: 60px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></td>
			     		<td>${resultMap.PRO_WR}<br>(<small>상품 ${resultMap.count}</small>)</td>
		 				<input type="hidden" class="memNo" value="${resultMap.PRO_WR}">
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
		
		<!-- 신고하기 모달 -->
<!-- 		<div class="modal fade" id="exampleModal" tabindex="-1" -->
<!-- 		aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog modal-dialog-centered modal-lg"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<h2>신고목록</h2> -->
<!-- 					<div> -->
<!-- 						<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 							aria-label="Close"></button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div id="container"> -->
<!-- 						<aside> -->
<!-- 							<header> -->
<!-- 								<p class="fs-5"> -->
<%-- 									<c:forEach var="dcm" items="${dcm}" varStatus="v"> --%>
<%-- 										 <input type="radio" name="rd01" id="rd${v.index}" value="${dcm.CO_TYPE}${dcm.CO_NO}"><label for="rd${v.index}">${dcm.CODE}</label> <br> --%>
<%-- 								    </c:forEach> --%>
<!-- 							    </p> -->
<!-- 							</header> -->
<!-- 						</aside> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<button type="button" class="btn btn-primary" id="rptBtn">신고하기</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/boardDetail.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/startChat.js"></script>
<script type="text/javascript">

</script>
<jsp:include page="../template/Footer.jsp"/>
</html>