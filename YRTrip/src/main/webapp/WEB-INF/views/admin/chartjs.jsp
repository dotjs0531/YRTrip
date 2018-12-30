<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>your REAL trip 관리자페이지</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="resources/admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/admin/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="resources/admin/vendors/css/vendor.bundle.addons.css">
  <script src="//www.google.com/jsapi"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="resources/admin/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/admin/images/favicon.png" />
<script>
var options = {
		title : '부서별 사원수',
		width : 400,
		height : 500,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
google.setOnLoadCallback(function() {
//차트에 넣을 data를 ajax 요청해서 가져옴
$.ajax({
			url : "./getTinfoChart",
			method : "get",
			type : "json",
			success : function(data) {
				//ajax결과를 chart에 맞는 data 형태로 가공
				var chartData = [];
				chartData.push([ '장소명', '등록수', {type: 'string', role: 'tooltip'} ])
				for (i = 0; i < data.length; i++) {
					var tooltip = data[i].name+ " : " +data[i].cnt
					var subarr = [ data[i].name, parseInt(data[i].cnt), tooltip ];
					chartData.push(subarr);
				}
				//챠트 그리기
				var chart = new google.visualization.ColumnChart(document
						.querySelector('#chart_div'));
				chart.draw(google.visualization.arrayToDataTable(chartData),
						options);
				
				//이벤트
				google.visualization.events.addListener(chart, 'select', selectHandler);
				
				function selectHandler(e) {
					  alert('알림창입니당');
			}
			}
		});
	});
</script>
</head>

<body>
  
   <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Line chart</h4>
           <canvas id="lineChart" style="height:250px"></canvas>
         </div>
       </div>
     </div>
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Bar chart</h4>
           <canvas id="barChart" style="height:230px"></canvas>
         </div>
       </div>
     </div>
   </div>
   <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Area chart</h4>
           <canvas id="areaChart" style="height:250px"></canvas>
         </div>
       </div>
     </div>
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Doughnut chart</h4>
           <canvas id="doughnutChart" style="height:250px"></canvas>
         </div>
       </div>
     </div>
   </div>
   <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Pie chart</h4>
           <canvas id="pieChart" style="height:250px"></canvas>
         </div>
       </div>
     </div>
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Scatter chart</h4>
           <canvas id="scatterChart" style="height:250px"></canvas>
         </div>
       </div>
     </div>
     <div id="chart_div"></div>
   </div>
          
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="resources/admin/vendors/js/vendor.bundle.base.js"></script>
  <script src="resources/admin/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="resources/admin/js/off-canvas.js"></script>
  <script src="resources/admin/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="resources/admin/js/chart.js"></script>
  <!-- End custom js for this page-->
</body>

</html>