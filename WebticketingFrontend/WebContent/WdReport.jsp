<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : Mohamed S. El-Shall
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
<link href="Report.css" rel="stylesheet" type="text/css" />
<title><fmt:message key="withdrawal_report" /></title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<div id="content">

			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="withdrawal_report" /></h4>
					</div>

				</div>
				<br>
				<div class="row">
					<label class="col-sm-2"><fmt:message key="serial_number" /></label> <input type="text"
						required="true" id="itSerialNumber" name="itSerialNumber"
						placeholder="Serial number..." class="col-sm-4"
						style="border-radius: .5rem" id="itSerialNumber"
						oninput="activateSearch(this,2)" />
				</div>
				<br>
				<div class="row">
					<label class="col-sm-2"><fmt:message key="tid" /></label> <input type="text"
						required="true" id="itTid" name="itTid"
						placeholder="Terminal id..." class="col-sm-4"
						style="border-radius: 1rem" id="itSerialNumber"
						oninput="activateSearch(this,3)" />
				</div>
				<br>
				<div class="row" id="dMerchantId">
					<label class="col-sm-2"><fmt:message key="merchant" /></label> <select id="sMerchants"
						name="sMerchants" class="col-sm-4">
					</select>
				</div>
				<br>
				<button class="btn btn-primary" onclick="exportToExcel()"><fmt:message key="export_excel" /></button>
				<button class="btn btn-success"
					onclick="print($('#dWithdrawalsLogs'))"><fmt:message key="print_report" /></button>
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
