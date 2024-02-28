new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["11월", "12월", "1월", "2월", "3월"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [28,67,104,34,53]
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

new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["의류", "가전제품", "식품", "기타"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2","#e8c3b9","#c45850"],
        data: [1278,327,734,670]
      }]
    },
    options: {
      title: {
        display: true,
      }
    }
});

new Chart(document.getElementById("bar-chart2"), {
    type: 'bar',
    data: {
      labels: ["11월", "12월", "1월", "2월", "3월"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [98,197,234,384,233]
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