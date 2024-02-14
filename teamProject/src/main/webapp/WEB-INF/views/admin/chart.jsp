<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js" width="350" height="350"></script>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5" style="padding-top: 100px;"><b>통계</b></h4></div>
    </div>
	
	
	<div style="display: flex; justify-content: center; align-items: center;">

	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="border: 1px solid black; width: 1200px; height: 650px;">
			
			<div class="container border-bottom toptitle" data-aos="fade-up">
				<div class="container text-center">
					<div class="row">
						<div class="col coll">
							<a href="#bar-chart" class="more fs-3">카테고리별 거래량</a>
						</div>
						<div class="col coll">
							<a href="#" class="more fs-3">성별</a>
						</div>
						<div class="col coll">
							<a href="#" class="more fs-3">총거래 건수 & 금액</a>
						</div>
					</div>
				</div>
			</div>
			
			<div style="width: 700px; height: 500px; margin-top: 40px; margin-left: 250px;">
				<canvas id="bar-chart" width="300" height="230"></canvas>
			</div>
			
<!-- 			<div style="width: 550px; height: 200px; margin-top: 30px; margin-left: 250px;"> -->
<!-- 				<canvas id="pie-chart" width="250" height="250"></canvas> -->
<!-- 			</div> -->
			
<!-- 			<div style="width: 550px; height: 200px; margin-top: 30px; margin-left: 250px;"> -->
<!-- 				<canvas id="pie-chart" width="250" height="250"></canvas> -->
<!-- 			</div> -->
			
		</div>
	</div>
</div>
	
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>

<script type="text/javascript">

new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [2478,5267,734,784,433]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});

</script>