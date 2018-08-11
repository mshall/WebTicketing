<%-- 
    Document   : WithDrawLogs
    Created on : May 25, 2018, 6:35:31 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
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
<link href="MyCss.css" rel="stylesheet" type="text/css" />


</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="wrapper ">
		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">All Withdraw</h4>
					</div>

					<div class="panel-body" id="dWithdrawalsLogs"></div>

				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/operations/admin/withdrawals.js"></script>
	<script>
		$(document).ready(function() {
			getWithdrawalsLogs();
		});
	</script>
</body>
</html>
