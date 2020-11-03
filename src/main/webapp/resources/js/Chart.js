var myChart = document.getElementById('myChart');
var chartData = {
                "type": "horizontalBar",
                "data": {
                    "labels": [],
                    "datasets": [{
                        "label": "아티스트별 후원 내역",
                        "data": [],
                        "fill": false,
                        "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"],
                        "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"],
                        "borderWidth": 1,
                    }]
                },
                "options": {
                    maintainAspectRatio: true,
                    "scales": {
                        "yAxes": [{
                            "ticks": {
                                "beginAtZero": true
                            }
                        }]
                    }
                }
            }

var chart = new Chart(myChart, chartData);

var myChart_1 = document.getElementById('myChart-1');
var chartData_1 = {
                "type": "bar",
                "data": {
                    "labels": [],
                    "datasets": [{
                        "label": "후원 받은 내역",
                        "data": [],
                        "fill": false,
                        "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
										    "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "rgba(52, 152, 219, 0.2)", "rgba(155, 89, 182, 0.2)", "rgba(230, 126, 34, 0.2)",
											"rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
										    "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "rgba(52, 152, 219, 0.2)", "rgba(155, 89, 182, 0.2)", "rgba(230, 126, 34, 0.2)",
											"rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
										    "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "rgba(52, 152, 219, 0.2)", "rgba(155, 89, 182, 0.2)", "rgba(230, 126, 34, 0.2)",
						 					"rgba(255, 99, 132, 0.2)"], 
                        "borderColor":  ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)",
									    "rgb(153, 102, 255)", "rgb(201, 203, 207)", "rgb(52, 152, 219)", "rgb(155, 89, 182)", "rgb(230, 126, 34)",
										"rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)",
									    "rgb(153, 102, 255)", "rgb(201, 203, 207)", "rgb(52, 152, 219)", "rgb(155, 89, 182)", "rgb(230, 126, 34)",
										"rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)",
									    "rgb(153, 102, 255)", "rgb(201, 203, 207)", "rgb(52, 152, 219)", "rgb(155, 89, 182)", "rgb(230, 126, 34)",
										"rgb(255, 99, 132, 0.2)"],
                        "borderWidth": 1,
                    }]
                },
                "options": {
                    maintainAspectRatio: true,
                    "scales": {
                        "yAxes": [{
                            "ticks": {
                                "beginAtZero": true
                            }
                        }]
                    }
                }
            }

var chart_1 = new Chart(myChart_1, chartData_1);

function horizonBar(c){
	c.type = 'bar';
	chart.update();
	chart_1.update();
}

function pie(c){
	c.type = 'pie';
	chart.update();
	chart_1.update();
}


