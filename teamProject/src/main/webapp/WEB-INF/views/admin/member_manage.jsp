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
        <div><h4 class="card-title mb-5" style="padding-top: 100px;"><b>회원 목록</b></h4></div>
    </div>
	
	
	<div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">아이디</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">이름</th>
                                <th scope="col">이메일</th>
                                <th scope="col">가입일</th>
                                <th scope="col">누적신고</th>
                                <th scope="col">회원상태</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        <c:forEach var="member" items="${memList}">
                        <fmt:parseDate var="data" value="${member.MEM_DATE}" pattern="yyyyMMddHHmmss"/>
                            <tr>
                                <td>${member.MEM_NO}</td>
                                <td>${member.MEM_ID}</td>
                                <td>${member.MEM_NICK}</td>
                                <td>${member.MEM_NAME}</td>
                                <td>${member.MEM_EMAIL}</td>
                                <td><fmt:formatDate var="memDate" value="${data}" pattern="yyyy-MM-dd"/>${memDate}</td>
                                <td>${member.COUNT}</td>
                                <th scope="row">
                                	<div>
										<select class="state">
											<option value="0">정상</option>
											<option value="1">정지</option>
											<option value="2">탈퇴</option>
										</select>
										<input type="hidden" class="${member.MEM_NO}" value="${member.MEM_CAT}">
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
	<script src="${pageContext.request.contextPath}/resources/js/admin/member_manage.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>