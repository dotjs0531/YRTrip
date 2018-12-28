<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin Free Bootstrap Admin Dashboard Template</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="resources/admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/admin/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="resources/admin/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="resources/admin/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/admin/images/favicon.png" />
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