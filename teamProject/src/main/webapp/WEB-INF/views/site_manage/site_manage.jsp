<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>관리자-사이트관리</title>

<style>
body{margin-top:20px;
background-color:#eee;
}
.project-list-table {
    border-collapse: separate;
    border-spacing: 0 12px
}

.project-list-table tr {
    background-color: #fff
}

.table-nowrap td, .table-nowrap th {
    white-space: nowrap;
}
.table-borderless>:not(caption)>*>* {
    border-bottom-width: 0;
}
.table>:not(caption)>*>* {
    padding: 0.75rem 0.75rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}

.avatar-sm {
    height: 2rem;
    width: 2rem;
}
.rounded-circle {
    border-radius: 50%!important;
}
.me-2 {
    margin-right: 0.5rem!important;
}
img, svg {
    vertical-align: middle;
}

a {
    color: #3b76e1;
    text-decoration: none;
}

.badge-soft-danger {
    color: #f56e6e !important;
    background-color: rgba(245,110,110,.1);
}
.badge-soft-success {
    color: #63ad6f !important;
    background-color: rgba(99,173,111,.1);
}

.badge-soft-primary {
    color: #3b76e1 !important;
    background-color: rgba(59,118,225,.1);
}

.badge-soft-info {
    color: #57c9eb !important;
    background-color: rgba(87,201,235,.1);
}

.avatar-title {
    align-items: center;
    background-color: #3b76e1;
    color: #fff;
    display: flex;
    font-weight: 500;
    height: 100%;
    justify-content: center;
    width: 100%;
}
.bg-soft-primary {
    background-color: rgba(59,118,225,.25)!important;
}
</style>
</head>
<body>
<jsp:include page="../template/store_sidebar_open.jsp"/>
<jsp:include page="../template/store_sidevar_close.jsp"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />

<div class="container">
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="mb-3">
                <h5 class="card-title">관리자 목록</h5>
            </div>
        </div>
        <div class="col-md-6">
            <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                <div>
                    <a href="#" data-bs-toggle="modal" data-bs-target=".add-new" class="btn btn-primary"><i class="bx bx-plus me-1"></i>관리자 추가</a>
                </div>
            </div>
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
                                <th scope="col">ID</th>
                                <th scope="col">이름</th>
                                <th scope="col">활동 여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            	<td>1</td>
                                <td><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-sm rounded-circle me-2" /><a href="#" class="text-body">admin1</a></td>
                                <td><span class="badge badge-soft-success mb-0">Full Stack Developer</span></td>
                                <th scope="row">
                                    <input type="checkbox" class="form-check-input" id="contacusercheck1" />
                                </th>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-sm rounded-circle me-2" /><a href="#" class="text-body">admin2</a></td>
                                <td><span class="badge badge-soft-info mb-0">Frontend Developer</span></td>
                                <th scope="row">
                                    <input type="checkbox" class="form-check-input" id="contacusercheck2" />
                                </th>
                            </tr>
                            <tr>
                          		<td>3</td>
                                <td>
                                    <div class="avatar-sm d-inline-block me-2">
                                        <div class="avatar-title bg-soft-primary rounded-circle text-primary"><i class="mdi mdi-account-circle m-0"></i></div>
                                    </div>
                                    <a href="#" class="text-body">admin3</a>
                                </td>
                                <td><span class="badge badge-soft-danger mb-0">UI/UX Designer</span></td>
                                <th scope="row">
                                    <input type="checkbox" class="form-check-input" id="contacusercheck3" />
                                </th>
                            </tr>
                            <tr>
                            	<td>4</td>
                                <td><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-sm rounded-circle me-2" /><a href="#" class="text-body">admin4</a></td>
                                <td><span class="badge badge-soft-primary mb-0">Backend Developer</span></td>
                                <th scope="row">
                                    <input type="checkbox" class="form-check-input" id="contacusercheck4" />
                                </th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-0 pb-4">
    	<div class="justify-content-end">
			<button type="button" class="btn btn-light">Light</button>
			<button type="button" class="btn btn-dark">Dark</button>
		</div>
		<div>
		    <ul class="pagination mb-sm-0 justify-content-center">
		        <li class="page-item disabled">
		            <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
		        </li>
		        <li class="page-item active"><a href="#" class="page-link">1</a></li>
		        <li class="page-item"><a href="#" class="page-link">2</a></li>
		        <li class="page-item"><a href="#" class="page-link">3</a></li>
		        <li class="page-item"><a href="#" class="page-link">4</a></li>
		        <li class="page-item"><a href="#" class="page-link">5</a></li>
		        <li class="page-item">
		            <a href="#" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
		        </li>
		    </ul>
		</div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>