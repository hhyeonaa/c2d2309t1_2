<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
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
            	<option>1</option>
            	<option>2</option>
            	<option>3</option>
            </select>
        </div>
        <!-- 각 카드를 이 위치에 반복 배치 -->
        <c:forEach var="buy" items="${buyList}">
        <div class="col">
            <div class="card h-100">
            <a href="${pageContext.request.contextPath}/board/boardDetail?proWr=${buy.PRO_WR}">
                <img src="${pageContext.request.contextPath}/resources/img/uploads/${buy.IMG_NAME}" class="card-img-top" alt="${buy.IMG_NAME}" onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'">
                <div class="card-body">
                    <span class="state1">${buy.CODE}</span>
                    <span class="state2">${buy.PRO_TSC}</span><br>
                    <p>${buy.PRO_NAME}</p>
                    <h5><b>${buy.PRO_PRICE}원</b></h5>
                </div>
            </a>
            </div>
        </div>
        </c:forEach>
		  
<!-- 		</div> -->

	</div>
</div>
</body>

<jsp:include page="../template/Footer.jsp"/>
</html>