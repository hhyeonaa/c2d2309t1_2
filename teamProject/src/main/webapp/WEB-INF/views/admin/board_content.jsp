<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top: 100px;">
<head>
<meta charset="UTF-8">
<title>게시판 글 관리</title>
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5"><b>게시판 목록</b></h4></div>
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
                                <th scope="col">삭제</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <tr>
                            	<th>1</th>
                                <td>제목1</td>
                                <td>글쓴이</td>
                                <td>글쓴시간</td>
                                <th scope="row">
                                	<div>
										<button class="btn btn-dark">삭제</button>
									</div>
                                </th>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td>제목2</td>
                                <td>글쓴이</td>
                                <td>글쓴시간</td>
                                <th scope="row">
                                	<div>
										<button class="btn btn-dark">삭제</button>
									</div>
                                </th>
                            </tr>
                            <tr>
                          		<th>3</th>
                                <td>제목2</td>
                                <td>글쓴이</td>
                                <td>글쓴시간</td>
                                <th scope="row">
                            	    <div>
										<button class="btn btn-dark">삭제</button>
									</div>
                                </th>
                            </tr>
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