<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top: 100px;">
<head>
<meta charset="UTF-8">
<title>통계</title>
</head>
<body>
	<jsp:include page="../template/store_sidebar_open.jsp"/>
	
	<div class="container">
    <div class="row align-items-center">
        <div><h4 class="card-title mb-5"><b>통계</b></h4></div>
    </div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js" width="350" height="350"></script>
	<div style="width: 300px; height: 300px;">
		<canvas id="pie-chart" width="250" height="250"></canvas>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/manager.js"></script>
	<jsp:include page="../template/store_sidevar_close.jsp"/>
</body>
</html>

<script type="text/javascript">
new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
        data: [2478,5267,734,784,433]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});
</script>