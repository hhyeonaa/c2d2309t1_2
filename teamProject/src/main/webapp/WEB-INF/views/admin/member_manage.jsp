<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5" style="padding-top: 100px;"><b>게시판 목록</b></h4></div>
    </div>
	
	
	<div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">이름</th>
                                <th scope="col">이메일</th>
                                <th scope="col">가입일</th>
                                <th scope="col">정지일</th>
                                <th scope="col">탈퇴</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        <c:forEach var="mem" items="${memList}">
                        <fmt:parseDate var="data" value="${mem.MEM_DATE}" pattern="yyyyMMddHHmmss"/>
                            <tr>
                                <td>${mem.MEM_NO}</td>
                                <td>${mem.MEM_NICK}</td>
                                <td>${mem.MEM_NAME}</td>
                                <td>${mem.MEM_EMAIL}</td>
                                <td><fmt:formatDate var="memDate" value="${data}" pattern="yyyy-MM-dd"/>${memDate}</td>
                                <td>정지일</td>
                                <th scope="row">
                                	<div>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
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
    <div class="row g-0 pb-4">
		<div class="demo">
		    <nav class="pagination-outer"  aria-label="Page navigation">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div> 
    </div>
</div>
	<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>