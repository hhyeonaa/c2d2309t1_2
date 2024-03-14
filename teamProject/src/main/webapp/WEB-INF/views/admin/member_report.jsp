<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5" style="padding-top: 100px;"><b>신고 목록</b></h4></div>
    </div>
	
	
	<div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">신고자</th>
                                <th scope="col">신고 대상</th>
                                <th scope="col">신고 종류</th>
                                <th scope="col">신고 날짜</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        <c:forEach var="report" items="${reportList}">
                            <tr>
                                <td>${report.RPT_NO}</td>
                                <td>${report.USER_NO}</td>
                                <td>${report.RPT_USER_NO}</td>
                                <td>${report.CODE}</td>
                                <td>${report.RPT_TIME}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
	<script src="${pageContext.request.contextPath}/resources/js/admin/member_report.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>