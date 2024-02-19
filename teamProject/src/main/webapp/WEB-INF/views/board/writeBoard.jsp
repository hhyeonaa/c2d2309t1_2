<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
   			      <select id="proTc" name="proTc" style="width: 100px;">
			      	<option id="sale" value="판매" selected>판매</option>
			      	<option id="buy" value="구매">구매</option>
			      	<option id="divide" value="나눔">나눔</option>
			      	<option id="auction" value="경매">경매</option>
			      </select>
			      <input type="hidden" id="proWr" name="proWr" value="하정우">
			      <h2>상품 등록</h2>
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
			      <!-- input 요소는 숨겨져 있으므로, label 요소를 중앙 정렬합니다. -->
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
			<!--   <div class="row"> -->
			<!--     <div class="col-12 d-flex justify-content-center"> -->
			<!--       <input type="text" id="itemNm" name="itemNm" placeholder="상품명을 입력"> -->
			<!--     </div> -->
			<!--   </div> -->
			<div class="row">
<!-- 			    <div class="col-12 d-flex justify-content-center"> -->
			    <div>
					<div class="input-group" style="width: 90%;">
					    <span class="input-group-text" id="basic-addon1">상품명</span>
					    <input type="text" class="form-control" id="proName" name="proName" placeholder="상품명 입력" aria-label="ItemName" aria-describedby="basic-addon1">
					</div>
		    	</div>
		  	</div>
		  	<hr>
		  	<div class="row justify-content-center">
			  	<div class="col-1 flex-fill text-center" style="border: 1px solid black; height: 50px;"><table><tr><th>카테고리<br>선택<th></tr></table></div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 50px; overflow: auto;">
					<select name="category1" id="category1" style="width: 100%; height: 100%; border: none; padding: 0; margin: 0;">
						<option value="여성의류">여성의류</option>    
						<option>남성의류</option>     
						<option>신발</option>         
						<option>가방/지갑</option>     
						<option>시계</option>          
						<option>쥬얼리</option>       
						<option>디지털</option>        
						<option>가전제품</option>     
						<option>스포츠/레저</option>  
						<option>차량/오토바이</option>  
						<option>음반/악기</option>      
						<option>도서/티켓/문구</option> 
						<option>뷰티/미용</option>      
						<option>가구/인테리어</option>   
						<option>생활/주방용품</option>  
						<option>공구/산업용품</option>   
						<option>식품</option>          
						<option>유아동/출산</option>     
						<option>반려동물용품</option>    
						<option>기타</option>          
					</select>
				</div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 50px; overflow: auto;">
			  		<select name="category2" id="category2" style="width: 100%; height: 100%; border: none; padding: 0; margin: 0;">
					    <option value="아우터">아우터</option>
					    <option>상의</option>
					    <option>바지</option>
					    <option>치마</option>
					    <option>원피스</option>
					    <option>점프수트</option>
					    <option>셋업/세트</option>
					    <option>언더웨어/홈웨어</option>
					    <option>테마/이벤트</option>
					</select>
			  	</div>
			  	<div class="col-3 flex-fill" style="border: 1px solid black; height: 50px; overflow: auto;">
					<select name="category3" id="category3" style="width: 100%; height: 100%; border: none; padding: 0; margin: 0;">
					    <option value="패딩">패딩</option>
					    <option>점퍼</option>
					    <option>코트</option>
					    <option>자켓</option>
					    <option>가디건</option>
					    <option>조끼/베스트</option>
					</select>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
				   	<span>거래지역</span>
				   	<button class="btn btn-outline-secondary">내 위치</button>
				   	<button class="btn btn-outline-secondary">최근 지역</button>
				   	<button class="btn btn-outline-secondary">주소 검색</button>
				   	<button class="btn btn-outline-secondary">지역설정안함</button>
				   	</div>
				</div>
				<div class="col-12 d-flex justify-content-center pt-3">
				<input class="col-9 text-center" type="text" value="" placeholder="거래지역 선택하기" readonly>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
				   	<span>상품 상태</span>
				   	<div>
					   	<input name="itemStatus" id="item1" type="radio" value="새상품">
					   	<label for="item1">새상품<small>(사용하지 않은 상품)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item2" type="radio" value="사용감 없음">
					   	<label for="item2">사용감 없음<small>(사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item3" type="radio" value="사용감 적음">
					   	<label for="item3">사용감 적음<small>(눈에 띄는 흔적이나 얼룩이 약간 있음)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item4" type="radio" value="사용감 많음">
					   	<label for="item4">사용감 많음<small>(눈에 띄는 흔적이나 얼룩이 많이 있음)</small></label>
				   	</div>
				   	<div>
					   	<input name="itemStatus" id="item5" type="radio" value="고장/파손 상품">
					   	<label for="item5">고장/파손 상품<small>(기능 이상이나 외관 손상 등으로 수리/수선필요)</small></label>
				   	</div>
				   	</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
				   	<div>
					   	<span>교환</span>
					   	<div>
						   	<input name="changeItem" id="changeOk" type="radio" value="가능">
						   	<label for="changeOk">가능</label>
					   	</div>
					   	<div>
						   	<input name="changeItem" id="changeNot" type="radio" value="불가능" checked>
						   	<label for="changeNot">불가능</label>
					   	</div>
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
						    <input type="text" id="proPrice" class="form-control" placeholder="가격 입력" aria-label="ItemCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
		    	<div class="row">
					<div class="mt-3">
						<input name="offeredPrice" id="offeredPrice" type="checkbox" value="제안받기" checked>
					   	<label for="offeredPrice">가격 제안받기</label>
					</div>
		    	</div>
		    	</div>
		    	<!-- 판매 구매일 때만 보일 것들 끝 -->
		    	<!-- 경매일 때만 보일 것들 시작 -->
		    	<div id="auctionOnly" style="display: none;">
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">시작가</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="startCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">즉시구매가</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="directCost" aria-describedby="basic-addon1">
						</div>
			    	</div>
		    	</div>
				<div class="row">
				    <div>
						<div class="input-group" style="width: 90%;" >
						    <span class="input-group-text" id="basic-addon1">최소 입찰가</span>
						    <input type="text" class="form-control" placeholder="가격 입력" aria-label="minCost" aria-describedby="basic-addon1">
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
					<textarea class="form-control" id="proContent" name="proContent" rows="5" cols="200" placeholder="구매시기, 브랜드/모델명, 제품의 상태 (사용감, 하자 유무) 등을 입력해 주세요.
서로가 믿고 거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요."></textarea>
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
			<div class="row">
			    <div>
					<div class="input-group" style="width: 90%;" >
					    <span class="input-group-text" id="basic-addon1">수량</span>
					    <input type="text" class="form-control" placeholder="숫자만 입력" aria-label="InputCount" aria-describedby="basic-addon1">
					</div>
		    	</div>
		  	</div>
		  	<hr>
		  	<div id="noDivide">
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div class="mb-3">
						<input type="checkbox" id="payOk" value="payOk">
						<label for="payOk">안전결제 환영</label>
						<textarea class="form-control" id="itemPay" rows="5" cols="100" readonly>안전결제(OO페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.
내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.
OO페이 배지로 더 많은 관심을 받을 수 있어요.
• 거절 시, 이용 제재가 있을 수 있으니 주의해 주세요.
• OO페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.</textarea>
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
<script type="text/javascript"></script>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>