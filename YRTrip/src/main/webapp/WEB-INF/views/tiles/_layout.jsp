<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>YOUR REAL TRIP:-)</title>
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
  <div class="container-scroller">
    <!-- partial:../../tiles/_navbar.jsp -->
    <tiles:insertAttribute name="navbar" />
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../tiles/_sidebar.jsp -->
      <tiles:insertAttribute name="sidebar" />
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
	        <!-- content-wrapper ends -->
	        <tiles:insertAttribute name="content" />
        </div>
        
        <!-- partial:../../tiles/_footer.jsp -->
        <tiles:insertAttribute name="footer" />
        
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
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
  <!-- End custom js for this page-->
</body>

</html>
