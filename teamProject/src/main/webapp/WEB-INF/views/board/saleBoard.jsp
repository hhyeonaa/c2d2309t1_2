<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.card img {
    cursor: pointer;
}
</style>
</head>
<jsp:include page="../template/header.jsp"/>
	
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
<!-- 		<div style="border: 1px solid black; width: 100%; height: 1000px;"> -->
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
				<c:forEach var="map" items="${resultList}">
					<option>${map['PRO_WR']}</option>
				</c:forEach>
            </select>
        </div>
        <!-- 각 카드를 이 위치에 반복 배치 -->
        <div class="col">
            <div class="card h-100">
                <a href="${pageContext.request.contextPath}/board/boardDetail"><img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."></a>
                <div class="card-body">
                    <span class="state1">판매</span>
                    <span class="state2">판매중</span><br>
                    <p>제목명</p>
                    <h5><b>10,000원</b></h5>
                </div>
            </div>
        </div>

        <!-- 여기까지 반복 -->
		<c:forEach var="map" items="${resultList}">
	        <div class="col">
	            <div class="card h-100">
	                <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="${map['IMG_NAME'] }" onerror="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg">
	                <div class="card-body">
	                    <span class="state1">${map['PRO_TC']}</span>
	                    <span class="state2">${map['PRO_TSC']}</span><br>
	                    <p>${map['PRO_NAME']}</p>
	                    <h5><b>${map['PRO_PRICE']}</b></h5>
	                </div>
	            </div>
	        </div>
		</c:forEach>
<!--         <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복     -->
<!--         <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--                 <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--                 <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--                 <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--                 <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--         <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--         <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         여기까지 반복  -->
<!--         <div class="col"> -->
<!--             <div class="card h-100"> -->
<%--                 <img src="${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg" class="card-img-top" alt="..."> --%>
<!--                 <div class="card-body"> -->
<!--                     <span class="state1">판매</span> -->
<!--                     <span class="state2">판매중</span><br> -->
<!--                     <p>제목명</p> -->
<!--                     <h5><b>10,000원</b></h5> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!-- 여기까지 반복 -->                             
		  
<!-- 		</div> -->

	</div>
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>