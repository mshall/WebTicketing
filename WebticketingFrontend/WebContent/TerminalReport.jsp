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
<title><fmt:message key="terminals" /></title>
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
						<h4 class="panel-title"><fmt:message key="terminals" /></h4>
					</div>
				</div>
				<br />
				<div class="panel-body">
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message key="serial_number" /></label> <input
							type="text" id="serialNum" placeholder="Enter Terminal serial"
							class="col-sm-4" style="border-radius: .5rem"
							oninput="activateSearch(this,$('#terminalsTable'),2);" />
					</div>
					<br>
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message key="status" /></label> <select
							name="status" class="col-sm-4" style="border-radius: .5rem"
							onchange="activateSearch(this,$('#terminalsTable'),5);">
							<option value="">Select...</option>
							<option value="Deployed">Deployed</option>
							<option value="Stock">Stock</option>
							<option value="Defected">Defected</option>
							<option value="Lost">Lost</option>
							<option value="Transient">Transient</option>
							<option value="Under Preparation">Under Preparation</option>
						</select>

					</div>
					<div>
						<br>
						<button class="btn btn-primary" onclick="exportToExcel()"><fmt:message key="export_excel" /></button>
						<button class="btn btn-success"
							onclick="print($('#allTerminals'))"><fmt:message key="print_report" /></button>

						<textarea id="taDeploymentsJson" style="visibility: hidden;"></textarea>
					</div>

					<br> <br> <br>
					<div id="allTerminals"></div>
				</div>

				<div></div>
			</div>
		</div>
		<script src="assets/js/operations/admin/reports/reports-util.js"></script>
		<script src="assets/js/operations/admin/reports/terminals-report.js"></script>
		<script>
			$(document).ready(function() {
				getAllTerminals();
			});
		</script>
</body>
</html>
