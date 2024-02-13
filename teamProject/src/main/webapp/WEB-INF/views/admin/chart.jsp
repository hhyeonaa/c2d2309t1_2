<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top: 30px;">
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
	<div style="display: flex;">
		<div style="width: 300px; height: 200px; margin-left: 50px;">
			<canvas id="pie-chart" width="250" height="250"></canvas>
		</div>
		<div style="width: 300px; height: 200px; margin-left: 500px;">
			<canvas id="doughnut-chart" width="250" height="250"></canvas>
		</div>
	</div>
	
	
	<div style="width: 650px; height: 300px; margin-top: 200px; margin-left: 300px;">
		<canvas id="bar-chart" width="500" height="300"></canvas>
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


new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
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
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});


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