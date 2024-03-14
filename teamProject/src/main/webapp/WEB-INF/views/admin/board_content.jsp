<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>

<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
	    <div class="row align-items-center">
	        <div><h4 class="card-title mb-5"  style="padding-top: 100px;"><b>게시판 목록</b></h4></div>
	    	
	    	<div align="center">
		        <select id="boardCategory" class="form-select">
					<option value="MM1" selected>판매</option>
					<option value="MM2">구매</option>
					<option value="MM3">나눔</option>
					<option value="MM4">경매</option>
				</select>
			</div>
    	</div>
	
	<div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">글제목</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">글쓴시간</th>
                                <th scope="col">글삭제</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        <c:forEach var="content" items="${contentList}">
                            <tr>
                            	<th>${content.PRO_NO}</th>
                                <td>${content.PRO_NAME}</td>
                                <td>${content.PRO_WR}</td>
                                <td>${content.PRO_DATE}</td>
                                <th scope="row">
                                	<div>
                                		<button type="button" class="btn-close"
                                			onclick="location.href='${pageContext.request.contextPath}/admin/contentDelete?PRO_NO=${content.PRO_NO}'"></button>
									</div>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
	<script src="${pageContext.request.contextPath}/resources/js/admin/board_content.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>

