<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><tiles:getAsString name="title"/></title>
<!-- plugins:css -->
<link rel="stylesheet" href="resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="resources/text/css"
	href="js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="resources/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="resources/images/viewlogo1.png" />

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
	<style>
	</style>
</head>
<body>
	<table>
		<tr>
			<td height="100px;"><tiles:insertAttribute name="header" /></td>

		</tr>
		<tr>
		<td>
			<tiles:insertAttribute name="menu" />
		</td>
		<td style="width:100%" ><tiles:insertAttribute name="body" /></td>
		</tr>
	</table>






	<!-- plugins:js -->
	<script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="resources/vendors/chart.js/Chart.min.js"></script>
	<script src="resources/vendors/datatables.net/jquery.dataTables.js"></script>
	<script
		src="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="resources/js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/template.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="resources/js/dashboard.js"></script>
	<script src="resources/js/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->
	
			<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="js/demo/datatables-demo.js"></script>
</body>
</html>