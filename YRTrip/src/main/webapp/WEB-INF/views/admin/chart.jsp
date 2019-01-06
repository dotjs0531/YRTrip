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
var options1 = {
		width : 590,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData1);

function ajaxData1() {
	
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
			chartData.push([ '여행지명', '방문회원수', {type: 'string', role: 'tooltip'} ])
			for (i = 0; i < data.length; i++) {
				var tooltip = data[i].ranktinfoid+ " : " +data[i].counttinfoid
				var subarr = [ data[i].ranktinfoid, parseInt(data[i].counttinfoid), tooltip ];
				chartData.push(subarr);
			}
			//챠트 그리기
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div1'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options1);

		}
		
	});
}
var options2 = {
		width : 590,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData2);

function ajaxData2() {
	
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	var day = s_year+"/"+s_month;
	$.ajax({
		type : 'GET',
		data : {day:day},
		url : './getSellerChart',
		dataType : 'json',
		success : function(data) {
			var chartData = [];
			chartData.push([ '판매자', '판매량', {type: 'string', role: 'tooltip'} ])
			for (i = 0; i < data.length; i++) {
				var tooltip = data[i].rankseller+ " : " +data[i].countseller
				var subarr = [ data[i].rankseller, parseInt(data[i].countseller), tooltip ];
				chartData.push(subarr);
			}
			//챠트 그리기
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div2'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options2);

		}
		
	});
}
var options3 = {
		width : 590,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData3);

function ajaxData3() {
	
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	var day = s_year+"/"+s_month;
	$.ajax({
		type : 'GET',
		data : {day:day},
		url : './getDayChart',
		dataType : 'json',
		success : function(data) {
			var chartData = [];
			chartData.push([ '요일', '거래량', {type: 'string', role: 'tooltip'} ])
			for (i = 0; i < data.length; i++) {
				var tooltip = data[i].rankday+ " : " +data[i].countday
				var subarr = [ data[i].rankday, parseInt(data[i].countday), tooltip ];
				chartData.push(subarr);
			}
			//챠트 그리기
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div3'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options3);

		}
		
	});
}
var options4 = {
		width : 590,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
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
				var tooltip = data[i].ranktime+ " : " +data[i].counttime
				var subarr = [ data[i].ranktime, parseInt(data[i].counttime), tooltip ];
				chartData.push(subarr);
			}
			//챠트 그리기
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div4'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options4);
		}
		
	});
}
/* var options5 = {
		width : 590,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData5);

function ajaxData5() {
	
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	var day = s_year+"/"+s_month;
	$.ajax({
		type : 'GET',
		data : {day:day},
		url : './getOrderPriceChart',
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
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div5'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options5);
		}
		
	});
}
var options6 = {
		width : 590,
		height : 250,
		colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	
	google.setOnLoadCallback(ajaxData6);

function ajaxData6() {
	
	var s_year = document.getElementById('year').value;
	var s_month = document.getElementById('month').value; 
	var day = s_year+"/"+s_month;
	$.ajax({
		type : 'GET',
		data : {day:day},
		url : './getOrderIdChart',
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
			var chart = new google.visualization.PieChart(document.querySelector('#chart_div6'));
			chart.draw(google.visualization.arrayToDataTable(chartData),
					options6);
			
		}
		
	});
} */
</script>
</head>

<body>
<div style="padding: 30px 0;">
<input type="text" style="width: 50px;" id="year" value="2019">년 &nbsp;&nbsp; 
<input type="text" style="width: 30px;" id="month" value="01">월  &nbsp;&nbsp; 
<input type="button" value="보기" onclick="searchChart()"> 
</div>
   <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 최다 방문 여행지</h4>
           <div id="chart_div1"></div>
         </div>
       </div>
     </div>
   </div>
      <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 최다 판매자</h4>
           <div id="chart_div2"></div>
         </div>
       </div>
     </div>
   </div>
      <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 최다 거래 요일</h4>
           <div id="chart_div3"></div>
         </div>
       </div>
     </div>
   </div>
      <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 최다 거래 시간대</h4>
           <div id="chart_div4"></div>
         </div>
       </div>
     </div>
   </div>
      <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 총 거래액</h4>
           <div id="chart_div5"></div>
         </div>
       </div>
     </div>
   </div>
      <div class="row">
     <div class="col-lg-6 grid-margin stretch-card">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">월별 총 거래량</h4>
           <div id="chart_div6"></div>
         </div>
       </div>
     </div>
   </div>

</body>

</html>