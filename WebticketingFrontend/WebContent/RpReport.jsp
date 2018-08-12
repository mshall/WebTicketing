<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="BootStrap/js/glm-ajax.js" type="text/javascript"></script>
<a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
<link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css" />
<script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="BootStrap/js/npm.js" type="text/javascript"></script>
<script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>
<link href="BootStrap/MyCss.css" rel="stylesheet" type="text/css" />
<link href="Report.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<div id="content">





			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#dAllRollpapersForVendors"> All Rollpapers Logs For
								Vendors </a>
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="collapse" id="dAllRollpapersForVendors"
						style="align-content: center" data-parent="#accordion"></div>
				</div>

			</div>
			<!-- ------------------ All roll papers for merchants ------------------------ -->
			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#dAllRollpapersForMerchants"> All Rollpapers Logs For
								Merchants </a>
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="collapse" id="dAllRollpapersForMerchants"
						style="align-content: center" data-parent="#accordion"></div>
				</div>

			</div>
		</div>
		<script src="assets/js/operations/admin/reports/rollpaper-reports.js"></script>
		<script>
			$(document).ready(function() {
				getAllRollpapersForVendors();
				getAllRollpapersForMerchants();
			});
		</script>
</body>
</html>
