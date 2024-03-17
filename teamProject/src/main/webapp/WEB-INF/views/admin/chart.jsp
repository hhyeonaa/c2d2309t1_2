<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
</head>

<style>

.main input[type=radio] {
	display: none;
}
#tab-1:checked ~ .tab label:nth-child(1),
#tab-2:checked ~ .tab label:nth-child(2),
#tab-3:checked ~ .tab label:nth-child(3) {
	background-color: rgb(250,128,114, 0.4);
  box-shadow: none;
}
.content > div {
	display: none;
}
#tab-1:checked ~ .content div:nth-child(1),
#tab-2:checked ~ .content div:nth-child(2),
#tab-3:checked ~ .content div:nth-child(3) {
	display: block;
}
.main {
  margin: 0 auto;
  main-width:1200px;
  max-width: 100%;
}
.tab {
  overflow: hidden;
}
.tab label {
    font-size: 18px;
    cursor: pointer;
    float: left;
    width: 33.33%;
    text-align: center;
    padding: 15px 0;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
.content {
  background-color: rgba(0, 0, 0, 0);
  min-height: 250px;
}
.content > div{
   padding: 30px;
   line-height: 1.5;
   font-size: 17px;
}

</style>

<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5" style="padding-top: 100px;"><b>통계</b></h4></div>
    </div>
	
	
	<div class="p-3 rounded-4 shadow" style="display: flex; justify-content: center; align-items: center;">

		<div style="width: 1200px; height: 649px;">
			
			<div class="main">
			  <input type="radio" id="tab-1" name="show" checked/>
			  <input type="radio" id="tab-2" name="show" />
			  <input type="radio" id="tab-3" name="show" />
			  <div class="tab p-3 rounded-4 shadow">
			    <label for="tab-1">가입자 수</label>
			    <label for="tab-2">카테고리별 거래량</label>
			    <label for="tab-3">총거래량</label>
			  </div>
			  <div class="content">
			    <div class="content-dis">
			      <div style="width: 700px; height: 530px; margin-left: 230px;">
			      		<h3 style="text-align: center;">가입자 수</h3>
						<canvas id="bar-chart" width="300" height="215"></canvas>
					</div>
			    </div>
			    <div class="content-dis">
			      <div style="width: 500px; height: 510px; margin-top:20px; margin-left: 320px;">
						<h3 style="text-align: center;">카테고리별 거래량</h3>
						<canvas id="pie-chart" width="250" height="235"></canvas>
					</div>
			    </div>
			    <div class="content-dis">
			      <div style="width: 700px; height: 530px; margin-left: 230px;">
						<h3 style="text-align: center;">총거래량</h3>
						<canvas id="bar-chart2" width="300" height="215"></canvas>
					</div>
			    </div>
			  </div>
			</div>
			
		</div>
	</div>
</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>