<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<style type="text/css">
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
	                <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${map['PRO_WR']}&proDate=${map['PRO_DATE']}"><img src="${pageContext.request.contextPath}/resources/img/uploads/${map['IMG_NAME']}" class="card-img-top" alt="${map['IMG_NAME'] }" onerror="this.src='${pageContext.request.contextPath}/resources/img/member/noImage.jpg'"></a>
	                <div class="card-body">
	                    <span class="state1">${map.PRO_TC_CODE}</span>
	                    <span class="state2 PRO_STATE_${map.PRO_TSC}">${map.PRO_TSC_CODE}</span>
	                    <span style="float: right; font-size: 23px;">
					      <a id=likeBtn class="profile_btn">
			 		     	<ion-icon id="noLike" name="heart-outline"></ion-icon> 
					      </a>
	                    </span>
	                    <br>
	                    <p class="nameP">${map.PRO_NAME}</p>
	                    <h5><b>${map.PRO_PRICE}원</b></h5>
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