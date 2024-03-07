<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<style>
.input-file-button, #att_zone {
/*     display: inline-block; */
}
#att_zone {
/*   width: 660px; */
  width: auto;
  min-height: 150px;
  padding: 10px;
  border: 1px dotted #00f;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}

#input-file-button{
  padding: 10px 25px;
  background-color: white;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<form action="${pageContext.request.contextPath}/board/writeBoardPro" method="post" enctype="multipart/form-data">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="width: 100%;">
			<div class="container">
			  <div class="row">
			    <div class="col-12 d-flex justify-content-between mt-4">
<%-- 			    <c:forEach var="oldImgName" items="${imgList}" varStatus="i"> --%>
<%-- 				    <input type="text" id="oldImg${i.count}" value="${oldImgName}"> --%>
<%-- 			    </c:forEach> --%>
				<input type="text" id="oldImgs" name="oldImgs" value="${resultMap.IMG_NAMES}">
				<select id="proTc" name="proTc" style="width: 100px;">
				    <c:forEach var="menu" items="${menu}">
				    <c:set var="menuCode" value="${menu.CO_TYPE}${menu.CO_NO}" />
				        <c:choose>
				            <c:when test="${menuCode eq resultMap.PRO_TC}">
				                <option value="${menu.CO_TYPE}${menu.CO_NO}" selected>${menu.CODE}</option>
				            </c:when>
				            <c:otherwise>
				                <option value="${menu.CO_TYPE}${menu.CO_NO}">${menu.CODE}</option>
				            </c:otherwise>
				        </c:choose>
				    </c:forEach>
				</select>
<!-- 				<select id="proTsc" name="proTsc" style="width: 100px;"> -->
<%-- 					<c:forEach var="proTsc" items="${trade}"> --%>
<%-- 						<option value="${proTsc.CO_TYPE}${proTsc.CO_NO}">${proTsc.CODE}</option> --%>
<%-- 					</c:forEach> --%>
<!-- 				</select> -->

			      <c:if test="${empty resultMap.PRO_DATE}">
				  <input type="hidden" id="proTsc" name="proTsc" value="">
				  <h2>상품 등록</h2>					
			      </c:if>
			      <c:if test="${!empty resultMap.PRO_DATE}">
				  <input type="hidden" id="proTsc" name="proTsc" value="${resultMap.PRO_TSC}">					
			      <h2>상품 수정</h2>
			      </c:if>
			      <input type="hidden" id="proWr" name="proWr" value="${sessionScope.MEM_ID}">
			      <select id="selectPreBoard">
			      	<option value="" selected>임시저장글</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      	<option>[구매] 이거 삼삼삼 24.02.08</option>
			      	<option>[판매] 이거 팜팜팜 24.02.08</option>
			      	<option>[판매] 이거 팜팜팜 24.02.08</option>
			      	<option>[나눔] 이거 눔눔눔 24.02.08</option>
			      	<option>[나눔] 이거 눔눔눔 24.02.08</option>
			      	<option>[경매] 이거 경경경 24.02.08</option>
			      	<option>[경매] 이거 경경경 24.02.08</option>
			      </select>
			    </div>
			  </div>
			  <hr>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <label class="btn btn-warning input-file-button" for="btnAtt" id="input-file-button"><img src="${pageContext.request.contextPath}/resources/img/board/addPhoto.png"></label>
			      <input type='file' id='btnAtt' multiple style="display: none;"/>
			      <button id="resetImg"><i class="bi bi-trash"></i></button>
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center">
			      <div id='att_zone' class="mt-3" data-placeholder="파일을 첨부 하려면 이미지등록 버튼을 클릭하거나 드래그앤드롭 하세요 이미지 총 6장까지 하나당 5mb까지"></div>
			    </div>
			  </div>
			  <div class="row">
			    <div class="col-12 d-flex justify-content-center pt-3">
			      <p></p>
			    </div>
			  </div>
			  <hr>
			<div class="row">
			    <div>
					<div class="input-group" style="width: 90%;">
					    <span class="input-group-text" id="basic-addon1">상품명</span>
					    <c:if test="${empty resultMap.PRO_DATE}">
					    <input type="text" class="form-control" id="proName" name="proName" placeholder="상품명 입력" aria-label="ItemName" aria-describedby="basic-addon1">
						</c:if>
					    <c:if test="${!empty resultMap.PRO_DATE}">
					    <input type="text" class="form-control" id="proName" name="proName" value="${resultMap.PRO_NAME}" placeholder="상품명 입력" aria-label="ItemName" aria-describedby="basic-addon1">
						</c:if>
					</div>
		    	</div>
		  	</div>
		  	<hr>
		  	<div class="row justify-content-center">
			  	<div class="col-1 flex-fill text-center" style="border: 1px solid black; height: 50px;"><table><tr><th>거래상태<br>선택<th></tr></table></div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 50px; overflow: auto;">
					<select name="proTsc" id="proTsc" style="width: 100%; height: 100%; border: none; padding: 0; margin: 0;">
						<c:forEach var="tsc" items="${trade}">
						<c:set var="tradeCode" value="${tsc.CO_TYPE}${tsc.CO_NO}"/>
							<c:choose>
								<c:when test="${tradeCode eq resultMap.PRO_TSC}">
									<option value="${tsc.CO_TYPE}${tsc.CO_NO}" selected>${tsc.CODE}</option>
								</c:when>
								<c:otherwise>
									<option value="${tsc.CO_TYPE}${tsc.CO_NO}">${tsc.CODE}</option>  
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			  	<div class="col-1 flex-fill text-center" style="border: 1px solid black; height: 50px;"><table><tr><th>카테고리<br>선택<th></tr></table></div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 50px; overflow: auto;">
					<select name="category1" id="category1" style="width: 100%; height: 100%; border: none; padding: 0; margin: 0;">
						<c:forEach var="cate" items="${category}">
							<c:set var="cateCode" value="${cate.CO_TYPE}${cate.CO_NO}"/>
							<c:choose>
								<c:when test="${cateCode eq resultMap.PRO_CATE}">
									<option value="${cate.CO_TYPE}${cate.CO_NO}" selected>${cate.CODE}</option>
								</c:when>
								<c:otherwise>
									<option value="${cate.CO_TYPE}${cate.CO_NO}">${cate.CODE}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
				   	<select id="selectAddress">
				   		<c:forEach var="add" items="${selectAddress}">
				   			<option value="${add.ADD_NO},${add.ADD_POST},${add.ADD_NAME},${add.ADD_DETAIL}">${add.ADD_NICK}</option>
				   		</c:forEach>
				   	</select>
				   	<span>거래지역</span>
<!-- 				   	<button class="btn btn-outline-secondary">내 위치</button> -->
<!-- 				   	<button class="btn btn-outline-secondary">최근 지역</button> -->
				   	<button class="btn btn-outline-secondary" id="searchRegion">주소 검색</button>
<!-- 				   	<button class="btn btn-outline-secondary" id="noRegion">지역설정안함</button> -->
				   	</div>
				</div>
				<div class="col-12 d-flex justify-content-center pt-3">
				<c:if test="${empty resultMap.PRO_DATE}">
					<input type="hidden" id="addNo" value="">
					<input class="col-2 text-center" type="text" id="regionNick" value="" placeholder="주소닉네임">
					<input class="col-1 text-center" type="text" id="regionCode" value="" placeholder="우편번호">
					<input class="col-7 text-center" type="text" id="inputRegion" value="" placeholder="거래지역 선택" readonly>
					<input class="col-2 text-center" type="text" id="detailRegion" value="" placeholder="상세주소 입력">
				</c:if>
				<c:if test="${!empty resultMap.PRO_DATE}">
					<input type="hidden" id="addNo" value="${resultMap.PRO_ADDRESS}">
					<input class="col-2 text-center" type="text" id="regionNick" value="${resultMap.ADD_NICK}" placeholder="주소닉네임">
					<input class="col-1 text-center" type="text" id="regionCode" value="${resultMap.ADD_POST}" placeholder="우편번호">
					<input class="col-7 text-center" type="text" id="inputRegion" value="${resultMap.ADD_NAME}" placeholder="거래지역 선택" readonly>
					<input class="col-2 text-center" type="text" id="detailRegion" value="${resultMap.ADD_DETAIL}" placeholder="상세주소 입력">
				</c:if>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
				   	<span>상품 상태</span>
				   	<c:forEach var="ps" items="${productStatus}" varStatus="i">
						<div>
							<c:set var="psCode" value="${ps.CO_TYPE}${ps.CO_NO}"/>
							<c:choose>
								<c:when test="${psCode eq resultMap.PRO_STATUS}">
								    <input name="itemStatus" id="item${i.count}" type="radio" value="${ps.CO_TYPE}${ps.CO_NO}" checked>
								    <label for="item${i.count}">${ps.CODE}</label>
								</c:when>
								<c:otherwise>
								    <input name="itemStatus" id="item${i.count}" type="radio" value="${ps.CO_TYPE}${ps.CO_NO}">
								    <label for="item${i.count}">${ps.CODE}</label>
								</c:otherwise>
							</c:choose>
						</div>
				   	</c:forEach>
				   	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<!-- 판매 구매일 때만 보일 것들 시작 -->
				<div id="saleBuy">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">가격</span>
						    <c:if test="${empty resultMap.PRO_DATE}">
						    <input type="text" id="proPrice" class="form-control" placeholder="가격 입력" aria-label="ItemCost" aria-describedby="basic-addon1">
							</c:if>
							<c:if test="${!empty resultMap.PRO_DATE}">
							<input type="text" id="proPrice" class="form-control" value="${resultMap.PRO_PRICE}" placeholder="가격 입력" aria-label="ItemCost" aria-describedby="basic-addon1">
							</c:if>
						</div>
			    	</div>
		    	</div>
		    	<div class="row">
<!-- 					<div class="mt-3"> -->
<!-- 						<input name="offeredPrice" id="offeredPrice" type="checkbox" value="제안받기" checked> -->
<!-- 					   	<label for="offeredPrice">가격 제안받기</label> -->
<!-- 					</div> -->
		    	</div>
		    	</div>
		    	<!-- 판매 구매일 때만 보일 것들 끝 -->
		    	<!-- 경매일 때만 보일 것들 시작 -->
		    	<div id="auctionOnly" style="display: none;">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">시작가</span>
						    <input type="text" class="form-control" id="aucSp" placeholder="가격 입력" aria-label="startCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">즉시구매가</span>
						    <input type="text" class="form-control" id="aucInp" placeholder="가격 입력" aria-label="directCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">최소 입찰가</span>
						    <input type="text" class="form-control" id="aucBp" placeholder="가격 입력" aria-label="minCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
		    	<span>경매는 글 등록한 후 24시간 동안 진행됩니다.</span>
		    	</div>
		    	<!-- 경매일 때만 보일 것들 끝 -->
		    	<!-- 나눔일 때만 보일 것들 시작 -->
		    	<div id="divideOnly" style="display: none;">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">나눔 조건</span>
						    <input type="text" class="form-control" placeholder="조건 입력" aria-label="divideCondition" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
		    	<span>나눔은 글 작성자 분이 나눔하고 싶은 분에게 먼저 채팅을 거셔야 합니다.</span>
		    	</div>
		    	<!-- 나눔일 때만 보일 것들 끝 -->
		  	</div>
		  	<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
					   	<span>배송비</span>
					   	<div>
						   	<input name="deliveryCharge" id="includeDeliCharge" type="radio" value="포함" checked>
						   	<label for="includeDeliCharge">배송비 포함</label>
					   	</div>
					   	<div>
						   	<input name="deliveryCharge" id="separateDeliCharge" type="radio" value="별도">
						   	<label for="separateDeliCharge">배송비 별도</label>
					   	</div>
				   	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				<div class="mb-3">
					<label for="proContent" class="form-label">상세 설명</label>
					<c:if test="${empty resultMap.PRO_DATE}">
					<textarea class="form-control" id="proContent" name="proContent" rows="5" cols="200" placeholder="${detailTxt.dTxt2}"></textarea>
					</c:if>
					<c:if test="${!empty resultMap.PRO_DATE}">
					<textarea class="form-control" id="proContent" name="proContent" rows="5" cols="200" placeholder="${detailTxt.dTxt2}">${resultMap.PRO_CONTENT}</textarea>
					</c:if>					
				</div>
				<span>0/2000</span>
				</div>
			</div>
			<hr>
<!-- 			<div class="row"> -->
<!-- 				<div class="row"> -->
<!-- 				    <div> -->
<!-- 						<div class="input-group" style="width: 90%;" > -->
<!-- 						    <span class="input-group-text" id="basic-addon1">태그</span> -->
<!-- 						    <input type="text" class="form-control" placeholder="태그 입력" aria-label="InputTag" aria-describedby="basic-addon1"> -->
<!-- 						</div> -->
<!-- 			    	</div> -->
<!-- 		    	</div> -->
<!-- 		    	<div class="row"> -->
<!-- 					<div class="mt-3"> -->
<!-- 						<div><span>태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있어요.</span></div> -->
<!-- 						<div><span>내 상품을 다양한 태그로 표현해 보세요.</span></div> -->
<!-- 						<div><span>사람들이 내 상품을 더 잘 찾을 수 있어요.</span></div> -->
<!-- 						<div><span>상품과 관련 없는 태그를 입력할 경우, 판매에 제재를 받을 수 있어요.</span></div> -->
<!-- 					</div> -->
<!-- 		    	</div> -->
<!-- 		  	</div> -->
<!-- 		  	<hr> -->
<!-- 			<div class="row"> -->
<!-- 			    <div> -->
<!-- 					<div class="input-group" style="width: 90%;" > -->
<!-- 					    <span class="input-group-text" id="basic-addon1">수량</span> -->
<!-- 					    <input type="text" class="form-control" placeholder="숫자만 입력" aria-label="InputCount" aria-describedby="basic-addon1"> -->
<!-- 					</div> -->
<!-- 		    	</div> -->
<!-- 		  	</div> -->
<!-- 		  	<hr> -->
		  	<div id="noDivide">
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div class="mb-3">
						<input type="checkbox" id="payOk" value="payOk">
						<label for="payOk">안전결제 환영</label>
						<textarea class="form-control" id="itemPay" rows="5" cols="100" readonly>${detailTxt.dTxt1}</textarea>
					</div>
				</div>
			</div>
			</div>
			<div class="row p-3" style="position: sticky; bottom: 0; z-index: 99999; background-color: black;">
			    <div class="d-flex justify-content-evenly">
					<button class="btn btn-light" id="tempSave">임시저장</button>
					<button class="btn btn-warning" id="submitBtn">등록하기</button>
		    	</div>
		  	</div>
						
			</div>
		</div> <!-- border안  -->
	</div>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/writeBoard.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"></script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>