<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : shimaa
--%>

<%@page import="org.apache.commons.beanutils.RowSetDynaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>

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
						<h4 class="panel-title">Withdrawal report</h4>
					</div>


				</div>
				<br>
				<div class="row">
					<label class="col-sm-2">Serial number</label> <input type="text"
						required="true" id="itSerialNumber" name="itSerialNumber"
						placeholder="Serial number..." class="col-sm-4"
						style="border-radius: .5rem" id="itSerialNumber"
						oninput="activateSearch(this,2)" />
				</div>
				<br>
				<div class="row">
					<label class="col-sm-2">TID</label> <input type="text"
						required="true" id="itTid" name="itTid"
						placeholder="Terminal id..." class="col-sm-4"
						style="border-radius: 1rem" id="itSerialNumber"
						oninput="activateSearch(this,3)" />
				</div>
				<br>
				<div class="row" id="dMerchantId">
					<label class="col-sm-2">Merchant</label> <select id="sMerchants"
						name="sMerchants" class="col-sm-4">
					</select>
				</div>
				<br>
				<button class="btn btn-primary" onclick="exportToExcel()">Export
					Excel</button>
				<button class="btn btn-success"
					onclick="print($('#dWithdrawalsLogs'))">Print Report</button>
				<div class="panel-body" id="dWithdrawalsLogs"></div>
				<textarea id="taWithdrawalsJson" style="visibility: hidden;"></textarea>
			</div>
		</div>

	</div>
	</div>







	<script src="assets/js/operations/admin/reports/reports-util.js"></script>
	<script src="assets/js/operations/admin/reports/withdrawals-report.js"></script>
	<script>
		$(document).ready(function() {
			getAllMerchantsForWithdrawal();
			getWithdrawalsLogs();
		});
	</script>
</body>
</html>
