<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트관리-게시판관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link href="${pageContext.request.contextPath}/resources/css/admin/board.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
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
                                <th scope="col">게시판명</th>
                                <th scope="col">게시판 유형</th>
                                <th scope="col">글쓰기 입력폼</th>
                                <th scope="col">표시 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            	<th>1</th>
                                <td>판매게시판</td>
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
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td>구매게시판</td>
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
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                          		<th>3</th>
                                <td>나눔게시판</td>
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
                                <th scope="row">
                            	    <div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
                            <tr>
                            	<th>4</th>
                            	<td>경매게시판</td>
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
                                <th scope="row">
                                	<div class="form-check form-switch justify-content-center">
										<input class="form-check-input" type="checkbox" id="active">
									</div>
                                </th>
                            </tr>
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
								  	<input type="text" name="" class="form-control" value="상품명"/>
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
    		<button type="button" class="btn btn-light">저장</button>
			<button type="button" class="btn btn-dark">취소</button>
	     </div>
	  </div>
	</div>
    
    
    <div class="row g-0 pb-4">
    	<div class="mb-4" align="right">
			<button type="button" class="btn btn-light">저장</button>
			<button type="button" class="btn btn-dark">취소</button>
		</div>
		<div class="demo">
		    <nav class="pagination-outer"  aria-label="Page navigation">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div> 
    </div>
</div>




</body>
<script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
</html>