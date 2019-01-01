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
  <link rel="stylesheet" href="resources/admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/admin/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="resources/admin/vendors/css/vendor.bundle.addons.css">
  <link rel="stylesheet" href="resources/admin/css/style.css">
  <link rel="shortcut icon" href="resources/admin/images/favicon.png" />
  <script src="//www.google.com/jsapi"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
function searchChart(){
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	if(s_year == "" || s_month == ""){
		alert("빈칸을 입력하세요.")
	}else if(s_month > 12  || s_month <= 0){
		alert("1- 12월 사이의 숫자만 입력하세요");
	}else{
		ajaxData();
	}
}
var options = {
		width : 800,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData);

function ajaxData() {
	
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	var day = s_year+"/"+s_month;
	$.ajax({
		type : 'GET',
		data : {day:day},
		url : './getTinfoChart',
		dataType : 'json',
		success : function(data) {
			var chartData = [];
			chartData.push([ '사원명', '사원수', {type: 'string', role: 'tooltip'} ])
			for (i = 0; i < data.length; i++) {
				var tooltip = data[i].ranktinfoid+ " : " +data[i].counttinfoid
				var subarr = [ data[i].ranktinfoid, parseInt(data[i].counttinfoid), tooltip ];
				chartData.push(subarr);
			}
			//챠트 그리기
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options);
			
			//이벤트
			google.visualization.events.addListener(chart, 'select', selectHandler);
			
		}
		
	});
}
function selectHandler(e) {
	  alert('알림창입니당');
}
</script>
</head>

<body>
<div style="padding: 30px 0;">
<input type="text" style="width: 50px;" id="year" value="2018">년 &nbsp;&nbsp; 
<input type="text" style="width: 30px;" id="month" value="12">월  &nbsp;&nbsp; 
<input type="button" value="보기" onclick="searchChart()"> 
</div>
   <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 최다 방문 여행지</h4>
           <div id="chart_div"></div>
         </div>
       </div>
     </div>

   </div>

</body>

</html>