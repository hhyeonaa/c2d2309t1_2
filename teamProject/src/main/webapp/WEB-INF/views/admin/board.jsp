<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트관리-게시판관리</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link href="${pageContext.request.contextPath}/resources/css/admin/board.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<form action="">
<div class="container" id="boardDiv">
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>현재 저장된 헤더</b></h4></div>
    </div>
    <div class="preview mb-5">
		<div class="row align-middle">
			<nav class="navbar navbar-expand-lg navbar-light p-3">
				<div class="collapse navbar-collapse mainHeader" id="navbarTogglerDemo01">
					<img src="${pageContext.request.contextPath}/resources/img/member/logo.jpg" alt="로고" style="width: 150px; height: 70px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<c:forEach var="board" items="${mapList}">
							<c:if test="${board.HIDE eq '0'}">
								<li class="menu">
							 		<a class="nav-link" href="#">${board.CODE }</a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<form class="d-flex">
						<div class="input-group" style="flex-wrap: nowrap;">
					      <select class="form-select" aria-label="boardSelect">
					      	<c:forEach var="board" items="${mapList}">
					      		<c:if test="${board.HIDE eq '0'}">
					      			<option value="${board.CO_NO }">${board.CODE }</option>
					      		</c:if>
				          	</c:forEach>
				          </select>
					      <input
					        class="form-control me-2"
					        type="search"
					        placeholder="찾고 싶은 물품을 검색해 보세요."
					        aria-label="Search"
					        id="search"
					    />
					    <button class="btn" id="searchButton"><ion-icon name="search-outline"></ion-icon></button>
					    </div>
					</form>
				</div>
				<div class="writeBtnBox" style="width: 100px; display:flex; justify-content: center;">
					<span class="material-symbols-outlined addIcon">add_circle</span>
					<a class="nav-link writeBtn" href="#">상품 등록</a>
				</div>
				<div class="btn-group">
			  	<button class="btn borderNone" type="button" data-bs-toggle="dropdown" id="button">
					<img src="${pageContext.request.contextPath}/resources/img/common/user.png" alt="로그인" onclick="" style="width: 40px; height: 40px;">
				</button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">프로필</a></li>
				    <li><a class="dropdown-item" href="#">거래내역</a></li>
				    <li><a class="dropdown-item" href="#">글목록</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="#">로그아웃</a></li>
				  </ul>
				</div>
			</nav>
		</div>
    </div>
    <div class="row align-items-center mb-4">
        <div><h4 class="card-title"><b>게시판 목록</b></h4></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table id="boardList" class="table project-list-table table-nowrap align-middle table-borderless text-center">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">게시판명</th>
                                <th scope="col">게시판 유형</th>
                                <th scope="col">글쓰기 입력폼</th>
                                <th scope="col">순서</th>
                                <th scope="col">숨김 여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="board" items="${mapList}">
                            <tr>
                            	<th>${board.SEQ }</th>
                                <td>${board.CODE }</td>
                                <td>
                                	<div align="center">
	                                	<select class="form-select">
											<option selected disabled>게시판 선택</option>
											<option value="1">글</option>
											<option value="2">글+사진</option>
											<option value="3">공지사항</option>
										</select>
									</div>
								</td>
                                <td><a href="#" id="insertForm">설정하기</a></td>
                                <td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
			                                <c:if test="${board.HIDE eq '1'}">
												<input class="form-check-input" type="checkbox" id="active" checked>
			                                </c:if>
		                           	       	<c:if test="${board.HIDE eq '0'}">
												<input class="form-check-input" type="checkbox" id="active">
			                                </c:if>
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
    
    
    <!-- 게시판 입력폼 모달창 -->
	<div id="inputModal" class="modal">
	  <div class="modal-content mt-5" id="modal-content">
	     <div class="modal-header" id="modal-header">
		     <h3 class="modal-title" id="modal-title"><b>판매게시판 입력폼</b></h3>
		     <button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
		     	&times;</button>
	     </div>
	     <div class="modal-body" id="modal-body">
		    <div class="boardEdit">
				<table class="table text-center mb-4">
					<thead class="tableHr align-middle ">
						<tr>
							<th scope="col" >라벨명</th>
							<th scope="col">타입</th>
							<th scope="col">순서</th>
							<th scope="col">숨김 여부</th>
						</tr>
					</thead>
					<tbody class="tableHr" id="tbody">
						<tr>
							<td align="center">
								<div class="form-outline">
								  	<input type="text" name="" class="form-control" value="글제목"/>
								</div>
							</td>
							<td align="center">
                               	<select class="form-select">
									<option disabled>타입 선택</option>
									<option value="1" selected><ion-icon name="remove-outline"></ion-icon>단답형</option>
									<option value="2"><ion-icon name="reader-outline"></ion-icon>장문형</option>
									<option value="3"><ion-icon name="radio-button-on-outline"></ion-icon>단일선택</option>
									<option value="4"><ion-icon name="checkbox-outline"></ion-icon>체크박스</option>
									<option value="5"><ion-icon name="caret-down-outline"></ion-icon>목록 선택형</option>
									<option value="6"><ion-icon name="download-outline"></ion-icon>파일 첨부형</option>
									<option value="7"><ion-icon name="calendar-number-outline"></ion-icon>날짜/시간</option>
								</select>
							</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>
								<div class="form-outline">
								  	<input type="text" name="" class="form-control" value="작성일"/>
								  	<input type="date" name="" class="form-control" value=""/>
								</div>
							</td>
					        <td align="center">
                               	<select class="form-select">
									<option disabled>타입 선택</option>
									<option value="1" >단답형</option>
									<option value="2">장문형</option>
									<option value="3">단일선택</option>
									<option value="4">체크박스</option>
									<option value="5">목록 선택형</option>
									<option value="6">파일 첨부형</option>
									<option value="7" selected>날짜/시간</option>
								</select>
							</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>
								<div class="form-outline align-top text-start">
								  	<input type="text" name="" class="form-control" value="상품 종류"/>
								  	<input type="text" name="" class="form-control-plaintext border-bottom ms-1" value="식품"/>
								  	<input type="text" name="" class="form-control-plaintext border-bottom ms-1" value="의류"/>
								  	<input type="text" name="" class="form-control-plaintext border-bottom ms-1" value="전자제품"/>
								  	<input type="text" name="" class="form-control-plaintext border-bottom ms-1" value="잡화"/>
								  	<input type="text" name="" class="form-control-plaintext border-bottom ms-1" value="기타"/>
								  	<a class="m-3" href="#"> 옵션 추가</a>
								</div>
							</td>
							<td align="center">
                               	<select class="form-select">
									<option  disabled>타입 선택</option>
									<option value="1">단답형</option>
									<option value="2">장문형</option>
									<option value="3">단일선택</option>
									<option value="4">체크박스</option>
									<option value="5" selected>목록 선택형</option>
									<option value="6">파일 첨부형</option>
									<option value="7">날짜/시간</option>
								</select>
							</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>
								<div class="form-outline">
								  	<input type="text" name="" class="form-control" value="이미지 등록"/>
								</div>
							</td>
							<td align="center">
                               	<select class="form-select">
									<option  disabled>타입 선택</option>
									<option value="1">단답형</option>
									<option value="2">장문형</option>
									<option value="3">단일선택</option>
									<option value="4">체크박스</option>
									<option value="5">목록 선택형</option>
									<option value="6" selected>파일 첨부형</option>
									<option value="7">날짜/시간</option>
								</select>
							</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
						<tr>
							<td>
								<div class="form-outline">
								  	<input type="text" name="" class="form-control" value="상세내용"/>
								</div>
							</td>
							<td align="center">
                               	<select class="form-select">
									<option  disabled>타입 선택</option>
									<option value="1">단답형</option>
									<option value="2" selected>장문형</option>
									<option value="3">단일선택</option>
									<option value="4">체크박스</option>
									<option value="5">목록 선택형</option>
									<option value="6">파일 첨부형</option>
									<option value="7">날짜/시간</option>
								</select>
							</td>
							<td><button id="btn"><ion-icon name="caret-up-outline" id="btnTop"></ion-icon></button></td>
							<td><input type="checkbox" class="form-check-input" id="contacusercheck4" /></td>
						</tr>
					</tbody>
				</table>
				<div class="mt-4" align="center">
					<button id="btn"><h1><ion-icon name="add-circle-outline" aria-hidden = "false" style = "color: gray;"></ion-icon></h1></button>
			    </div>
		    </div>		
	     </div>
	     
	     <div class="modal-footer" id="modal-footer">
   			<button type="button" class="btn btn-dark" id="cancelBtn">취소</button>
    		<button type="button" class="btn btn-light">저장</button>
	     </div>
	  </div>
	</div>
    
    
    <div class="row g-0 pb-4">
    	<div class="mb-4" align="right">
			<button type="reset" class="btn btn-secondary" id="resetBtn">취소</button>
			<button type="button" class="btn btn-outline-danger" id="saveBtn">저장</button>
		</div>
		<div class="demo">
		    <nav class="pagination-outer"  aria-label="Page navigation">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div> 
    </div>
</div>
</form>



</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
</html>