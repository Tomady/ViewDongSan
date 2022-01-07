<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Amiri:ital,wght@1,700&family=Bakbak+One&family=Cinzel:wght@700&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
   $(function() {
      console.log("초기 = " + $("select[name='chart'] option:selected").text());
   })
</script>

<style>
   #legend{
      font-family: 'Amiri', serif;
      font-size: 40px;
        color: navy;
   }
   fieldset{
      border: 2px solid navy;
      font-family: 'IBM Plex Sans KR', sans-serif;
      color: navy;
      width: 1000px;
   }
   #myChart{
      padding-left: 45px;
   }

</style>
</head>

<body>
<fieldset>
   <legend id="legend">My Sales</legend>
   <div style="width: 900px; height: 500px;" id="chartid">
      <!--차트가 그려질 부분-->
      <canvas id="myChart"></canvas>
         
   </div>
</fieldset>
  
   
   <input type="hidden" id="curLoginID" value="${id }">
   <script type="text/javascript">
         createChart();
         function createChart() {
         var context = document.getElementById('myChart').getContext('2d');
         var myChart = new Chart(context, {
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
            var temp = $("#curLoginID").val();
            console.log(temp);
            
            if(temp == "host50") {
               console.log("host150이 맞아");
            } else {
               console.log("Tq");
            }
               var ret = [0,0,0,0,0,0,0,0,0,0,0,0];   
               // ret = 월별 총 금액을 구해서 저장하는 친구. -> 결국 Chart의 data에 들어가는 친구.
               
               const url = "getHostChartData1.do";
               $.ajax(url, {
                 data : { hostId : temp },
                  dataType : "json",
                  async : false
               })
               .done(function(datas) {
                  // 아마 이 datas에는 ChartVO 정보가 모두 저장되어 넘어올것임.
                  // Object(4)... 넘어올거에요.
                  for(data of datas) {
                     var month = data["salsedate"].substring(5).substring(0, 2);
                     // salsedate라는 속성에서 5개 짜르고, 5개에서 2개만 짤라서 월을 구함.
                     // console.log(month);
                     ret[month - 1] += parseInt(data["money"]);
                     // console.log(ret[month]);
                  }
               });
               return ret;
            } 
            
         


         
   
      </script>
      
</body>

</html>