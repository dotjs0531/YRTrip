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
var options4 = {
		width : 900,
		height : 450,
		colors: ['#0A2229', '#0B4C5F', '#086A87', '#01A9DB', '#58D3F7']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData4);

function ajaxData4() {
	
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	var day = s_year+"/"+s_month;
	$.ajax({
		type : 'GET',
		data : {day:day},
		url : './getTimeChart',
		dataType : 'json',
		success : function(data) {
			var chartData = [];
			chartData.push([ '시간대', '거래량', {type: 'string', role: 'tooltip'} ])
			for (i = 0; i < data.length; i++) {
				var tooltip = data[i].ranktime+ "시 : " +data[i].counttime +"건"
				var subarr = [ data[i].ranktime, parseInt(data[i].counttime), tooltip ];
				chartData.push(subarr);
			}
			//챠트 그리기
			var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div4'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options4);
		}
		
	});
}
</script>
</head>

<body>
<div style="padding-left:100px;">
<button onclick="location.href='./chart'" class="btn btn-default mr-2">월별 최다 방문 여행지</button>
<button onclick="location.href='./manageChart2'" class="btn btn-default mr-2">월별 최다 판매자</button>
<button onclick="location.href='./manageChart3'" class="btn btn-default mr-2">월별 최다 거래 요일</button>
<button onclick="location.href='./manageChart4'" class="btn btn-default mr-2">월별 최다 거래 시간대</button>
<button onclick="location.href='./manageChart5'" class="btn btn-default mr-2">월별 총 거래액</button>
<button onclick="location.href='./manageChart6'" class="btn btn-default mr-2">월별 총 거래량</button>
</div>
<div style="padding: 30px 540px;">
<input type="text" style="width: 50px;" id="year" value="2019">년 &nbsp;&nbsp; 
<input type="text" style="width: 30px;" id="month" value="01">월  &nbsp;&nbsp; 
<input type="button" value="보기" onclick="searchChart()"> 
</div>
      <div class="row">
     <div class="col-lg-6 grid-margin stretch-card" style="padding-left:170px;">
       <div class="card">
         <div style="width:950px; background-color:#fff;">
           <h4 class="text-center">월별 최다 거래 시간대</h4>
           <div id="chart_div4"></div>
         </div>
       </div>
     </div>
   </div>

</body>

</html>