document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');


$(() => {
	
	targetColor($("#chart"));
	
	$.ajax({
		url: "getChartData",
		type: "GET",
	})
	.done(function(data){
		let memList = data.memList;
		let memLabels = memList.map((row) => row.MONTH);
		let memData = memList.map((row) => row.CNT);
		memChart(memLabels, memData);
		
		let cateList = data.cateList;
		let cateLabels = cateList.map((row) => row.CODE);
		let cateData = cateList.map((row) => row.CNT);
		cateChart(cateLabels, cateData);
		
		let tradeList = data.tradeList;
		let tradeLabels = tradeList.map((row) => row.MONTH);
		let tradeData = tradeList.map((row) => row.CNT);
		tradeChart(tradeLabels, tradeData);
	})
});

const memChart = (labels, data) => {
	new Chart(document.getElementById("bar-chart"), {
	    type: 'bar',
	    data: {
	      labels: labels,
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#e8c3b9","#c45850","#e8c3b9"],
	          data: data
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	      }
	    }
	});
} 

const cateChart = (labels, data) => {
	new Chart(document.getElementById("pie-chart"), {
	    type: 'pie',
	    data: {
	      labels: labels,
	      datasets: [{
	        label: "Population (millions)",
	        backgroundColor: ["#FF6666", "#FFFF99","#6699FF","#3cba9f","#e8c3b9"],
	        data: data
	      }]
	    },
	    options: {
	      title: {
	        display: true,
	      }
	    }
	});
}

const tradeChart = (labels, data) => {
	new Chart(document.getElementById("bar-chart2"), {
	    type: 'bar',
	    data: {
	      labels: labels,
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
	          data: data
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	      }
	    }
	});
}
