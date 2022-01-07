<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: var(- -button-bg-color);
	color: var(- -button-color);
	margin: 0;
	padding: 0.5rem 1rem;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1rem;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	border: none;
	border-radius: 4px;
	display: inline-block;
	width: auto;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
	color: white;
}

button.chartbtn { -
	-button-bg-color: #b5dfdb; -
	-button-hover-bg-color: #ccc6ff;
}

button:active, button:hover, button:focus {
	background: var(- -button-hover-bg-color);
	outline: 0;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		console.log("초기 = " + $("select[name='chart'] option:selected").text());
	})
</script>
</head>

<body>
	<div class="col-md-6 grid-margin transparent">
		<div class="row">
			<div class="col-md-6 mb-4 stretch-card transparent">
				<div class="card card-tale">
					<div class="card-body">
						<p class="mb-4">2022년 전체 매출</p>
						<p id="mytotalamount" class="fs-30 mb-2">4006</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-4 stretch-card transparent">
				<div class="card card-dark-blue">
					<div class="card-body">
						<p id="myhostid" class="mb-4">호스트 매출</p>
						<p id="myhostamount" class="fs-30 mb-2">₩0원</p>
					</div>
				</div>
			</div>
		</div>

		<select name="chart" id="selectchart" size="1" style="width: 200px;">
			<option value="선택">선택</option>
			<c:forEach items="${names }" var="name">
				<option value="${name }">${name }
			</c:forEach>
		</select>
		<button type="button" class="chartbtn" onclick="createChart()">확인</button>

	</div>

	<div style="width: 1100px; height: 900px;" id="chartid">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>




	</div>











	<script type="text/javascript">
		var myChart;
		createChart();
		
		function createChart() {
			if(myChart != null) {
				myChart.destroy();
			}
			
			console.log($('#myChart').length);
			
			var context = document.getElementById('myChart').getContext('2d');
			
			myChart = new Chart(context, {
				type: 'bar', // 차트의 형태
				data: { // 차트에 들어갈 데이터
					labels: [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
					datasets: [{ 
							label: '전체데이터', //차트 제목
							fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : testFnc(),							
							backgroundColor: [
								//색상
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)', 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
							],
							borderColor: [
								//경계선 색상
								'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)', 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)'
							],
							borderWidth: 1
							//경계선 굵기
						}]
						/* ,
												   {
													   label: 'test2',
													   fill: false,
													   data: [
														   8, 34, 12, 24
													   ],
													   backgroundColor: 'rgb(157, 109, 12)',
													   borderColor: 'rgb(157, 109, 12)'
												   } */
				},
				options: {
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
					}
				}
			});
		}
	
			function testFnc() {
				var temp = $("select[name='chart'] option:Selected").val();
				
				
				if(temp == "host1") {
					console.log("host1이 맞아");
				} else {
					console.log("Tq");
				}
				console.log($("select[name='chart'] option:selected").val());
				
				if($("select[name='chart'] option:selected").val() == "선택") {
					var ret = [0,0,0,0,0,0,0,0,0,0,0,0];
					
					// ret = 월별 총 금액을 구해서 저장하는 친구. -> 결국 Chart의 data에 들어가는 친구.
					
					const url = "yearchart.do";
					$.ajax(url, {
						dataType : "json",
						async : false
					})
					.done(function(datas) {
						// 아마 이 datas에는 ChartVO 정보가 모두 저장되어 넘어올것임.
						// Object(4)... 넘어올거에요.
						var sum = 0;
						for(data of datas) {
							var month = data["salsedate"].substring(5).substring(0, 2);
							// salsedate라는 속성에서 5개 짜르고, 5개에서 2개만 짤라서 월을 구함.
							console.log(month);
							ret[month - 1] += parseInt(data["money"]);
							sum += parseInt(data["money"]);
							console.log(ret[month-1]);
						}
						$("#mytotalamount").text("₩"+sum.toString()
								  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +"원") ;
					});
					
					return ret;
					
				} else {
					var ret = [0,0,0,0,0,0,0,0,0,0,0,0];	
					const url = "getHostChartData.do";
					$.ajax(url, {
						data : { hostId : temp },
						dataType : "json",
						async : false
					})
					.done(function(datas) {
						// 아마 이 datas에는 ChartVO 정보가 모두 저장되어 넘어올것임.
						// Object(4)... 넘어올거에요.
						var sum =0;
						for(data of datas) {
							console.log(data);
							var month = data["salsedate"].substring(5).substring(0, 2);
							// salsedate라는 속성에서 5개 짜르고, 5개에서 2개만 짤라서 월을 구함.
							console.log(month);
							ret[month - 1] += parseInt(data["money"]);
							sum += parseInt(data["money"]);
							console.log(ret[month-1]);
						}
						$("#myhostid").text(temp +" 매출") ;
						$("#myhostamount").text("₩"+sum.toString()
								  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") +"원") ;
					});
					return ret;
				}
				
			}
			


			
	
		</script>

</body>

</html>