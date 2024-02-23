<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래상태 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<style>
    .insert:hover {
    	background-color: rgb(42, 188, 180, 0.2);
    }
    .save:hover {
    	background-color: rgb(124, 252, 0, 0.3);
    }
    .delete:hover {
    	background-color: rgb(255, 0, 0, 0.3);
    }
</style>
</head>
<body> 
	<jsp:include page="../template/store_sidebar_open.jsp"/>
		<main style="background: #f0f0f3; padding: 200px;">
			<h4 class="mb-5"><b>메세지 문구 관리</b></h4>
			<div>
				<table class="table table-hover table align-middle table table-sm mt-5">
					<thead>
						<tr>
							<th scope="col" class="text-center" style="width: 220px;">
								<div class="form-check form-switch" style="display: flex; justify-content: center; align-items: center;">
								  	<input class="form-check-input" type="checkbox" role="switch" id="totalCheck" style="width: 50px; height: 25px;">&nbsp;
								  	<label class="form-check-label" for="totalCheck">전체 선택</label>
								</div>
							</th>
							<th scope="col" class="text-center">코드 번호</th>
							<th scope="col" class="text-center">메세지 문구</th>
							<th scope="col" class="text-center" colspan="2">
								<div style="display: flex; justify-content: center;">
									<span style="font-size: 33px; color:#2ABCB4; border: 1px solid #2ABCB4;" class="insert material-symbols-outlined">add</span>
								</div>	
							</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<th scope="row" class="text-center"><input type="checkbox" style="width: 25px; height: 25px;"></td>
							<td class="text-center">AM01</td>
							<td class="text-center">{0}이(가) 성공하였습니다.</td>
							<td class="text-center" style="width: 75px;"><span style="font-size: 33px; color: green; border: 1px solid green;" class="save material-symbols-outlined">done</span></td>
							<td class="text-center" style="width: 75px;"><span style="font-size: 33px; color: red; border: 1px solid red;" class="delete material-symbols-outlined">delete</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="demo">
			    <nav class="pagination-outer"  aria-label="Page navigation">
			        <ul class="pagination" id="pagination"></ul>
			    </nav>
			</div> 
		</main>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/muchang_js/trade.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>