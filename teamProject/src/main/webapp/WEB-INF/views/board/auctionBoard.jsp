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
<style type="text/css">
/*  #main {
    display: flex;
    flex-direction: column;
}*/
.nameP {
	text-align: left;
	padding-bottom: 2%;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
<div>
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
        <!-- 각 카드를 이 위치에 반복 배치 -->
        <c:forEach var="map" items="${resultList}">
	   <div class="col boardlist">
			<div class="card h-100">
			  <a href="${pageContext.request.contextPath}/board/auctionDetail?aucSeller=${map.AUC_SELLER}&aucDate=${map.AUC_DATE}"><img src="${pageContext.request.contextPath}/resources/img/uploads/${map['IMG_NAME']}" class="card-img-top" alt="${map['IMG_NAME'] }" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></a>
				<div class="card-body" style="padding-top: 10px;">
					<span class="state1">${map.AUC_TC_CODE}</span>
					<span class="state2">${map.AUC_TSC_CODE}</span>
					<span style="font-size: 12px;font-style: oblique;">게시자: </span>
					<a href="#" style="font-size: 12px;">${map.AUC_SELLER}</a>
                    <span style="float: right; font-size: 23px;">
				      <a id=likeBtn class="profile_btn">
		 		     	<ion-icon id="noLike" name="heart-outline"></ion-icon> 
				      </a>
                    </span>
					<br>
					   <p class="nameP">${map.AUC_NAME}</p>
					<h6 style="margin-bottom: 0px;"><small style="font-size: 10px;">현재가</small><b>${map.AUC_BP}원</b></h6>
					<span style="font-size: 12px;">입찰자: 10</span> 
					<fmt:parseDate value="${map.AUC_DATE}" pattern="yyyyMMddHHmmss" var="parsedDate" />
					<span style="font-size: 12px;"><img src="https://pics.auction.co.kr/listing/used/2014/txt2_watch.gif" style="height: 13px;width: 13px;padding-bottom: 3px;"><fmt:formatDate value="${parsedDate}" pattern="M/d HH:mm" /></span><br>
			    </div>
		  	</div>
		</div>
		</c:forEach>

        
	</div>
		<div class="demo">
		    <nav class="pagination-outer"  aria-label="Page navigation">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div>
	</div>		
</div>
</body>
<script type="text/javascript">
	$(() => {
		paging("#main .boardlist", 12, 0);
	})
</script>
<jsp:include page="../template/Footer.jsp"/>
</html>