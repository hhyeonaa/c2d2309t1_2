<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
/*  #main {
    display: flex;
    flex-direction: column;
}*/
</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div class="status-check" style="margin-bottom: 20px; text-align: center; width: 100%;">
            <select>
            	<option>1</option>
            	<option>2</option>
            	<option>3</option>
            </select>
            <select>
            	<option>1</option>
            	<option>2</option>
            	<option>3</option>
            </select>
            <select>
            	<option>1</option>
            	<option>2</option>
            	<option>3</option>
            </select>
        </div>
<!-- 		<div style="border: 1px solid black; width: 100%; height: 1000px;"> -->
        <!-- 각 카드를 이 위치에 반복 배치 -->
        <div class="col">
		   <div class="card h-100">
		     <a href="${pageContext.request.contextPath}/board/auctionDetail"><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."></a>
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 -->
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 -->    
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 --> 
        <div class="col">
		   <div class="card h-100">
		     <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="...">
		     <div class="card-body" style="padding-top: 10px;">
		      <span class="state1">경매</span>
		      <span class="state2">경매중</span>
		      <span style="font-size: 12px;font-style: oblique;">게시자: </span>
		      <a href="#" style="font-size: 12px;">따봉도치</a><br>
		      <p>제목명</p>
			  <h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>10,000원</b></h6>
			  <span style="font-size: 12px;">입찰자: 10</span> 
			  <span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;">2/3 10:00</span><br>
		     </div>
		   </div>
		 </div>
        <!-- 여기까지 반복 -->                             
		  
<!-- 		</div> -->

	</div>
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>