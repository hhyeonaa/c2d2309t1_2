<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 table{ 
 	border-collapse : collapse; /*이중선 제거*/
 	margin-top: 30px; 
 }  
 th,td{
      width: 100px;
      height: 50px;
      text-align: center;
      border: 1px solid black !important;
      
      vertical-align: top;	/* 위 */
      vertical-align: bottom;   /* 아래 */
      vertical-align: middle;   /* 가운데 */
 }
</style>
</head>
<jsp:include page="template/header.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/excelJS/excelTest.js"></script>

<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="border: 1px solid black; width: 100%; height: 1000px; display: flex; flex-direction: column;">
			<table>
				<tr>
					<th scope="col">날짜</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
				</tr>
				<tr>
					<td>11/15</td>
					<td>김우직</td>
					<td>남</td>
				</tr>
				<tr>
					<td>11/14</td>
					<td>박수진</td>
					<td>여</td>
				</tr>
			</table>
			<div style="display: flex; margin-top: 5px;">
				<button id="dlBtn" style="margin-left: auto;">다운로드</button>
			</div>
		</div>
	</div>
</div>
</body>
<jsp:include page="template/Footer.jsp"/>
</html>