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
	background-color: rgba(4, 4, 4, 0.2);
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
  background-color: rgba(4, 4, 4, 0.2);
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
        <div><h4 class="card-title mb-5" style="padding-top: 100px; padding-bottom: 50px;"><b>통계</b></h4></div>
    </div>
	
	
	<div style="display: flex; justify-content: center; align-items: center;">

		<div style="border: 1px solid black; width: 1200px; height: 649px;">
			
			<div class="main">
			  <input type="radio" id="tab-1" name="show" checked/>
			  <input type="radio" id="tab-2" name="show" />
			  <input type="radio" id="tab-3" name="show" />
			  <div class="tab">
			    <label for="tab-1">카테고리별 거래량</label>
			    <label for="tab-2">성별</label>
			    <label for="tab-3">총거래 건수 & 금액</label>
			  </div>
			  <div class="content">
			    <div class="content-dis">
			      <div style="width: 700px; height: 530px; margin-left: 250px;">
			      		<h3 style="text-align: center;">카테고리별 거래량</h3>
						<canvas id="bar-chart" width="300" height="215"></canvas>
					</div>
			    </div>
			    <div class="content-dis">
			      <div style="width: 500px; height: 510px; margin-top:20px; margin-left: 300px;">
						<h3 style="text-align: center;">성별</h3>
						<canvas id="pie-chart" width="250" height="235"></canvas>
					</div>
			    </div>
			    <div class="content-dis">
			      <div style="width: 600px; height: 510px; margin-top:20px; margin-left: 250px;">
						<h3 style="text-align: center;">총거래 건수 & 금액</h3>
						<canvas id="line-chart" width="300" height="235"></canvas>
					</div>
			    </div>
			  </div>
			</div>
			
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

new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Africa", "North America"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd","#c45850"],
        data: [784,433]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});

new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
	    datasets: [{ 
	        data: [86,114,106,106,107,111,133,221,783,2478],
	        label: "Africa",
	        borderColor: "#3e95cd",
	        fill: false
	      }, { 
	        data: [282,350,411,502,635,809,947,1402,3700,5267],
	        label: "Asia",
	        borderColor: "#8e5ea2",
	        fill: false
	      }, { 
	        data: [168,170,178,190,203,276,408,547,675,734],
	        label: "Europe",
	        borderColor: "#3cba9f",
	        fill: false
	      }, { 
	        data: [40,20,10,16,24,38,74,167,508,784],
	        label: "Latin America",
	        borderColor: "#e8c3b9",
	        fill: false
	      }, { 
	        data: [6,3,2,2,7,26,82,172,312,433],
	        label: "North America",
	        borderColor: "#c45850",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: 'World population per region (in millions)'
	    }
	  }
	});

</script>