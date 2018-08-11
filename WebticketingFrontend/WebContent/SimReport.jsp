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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sim Report</title>
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
						<h4 class="panel-title">All SIM</h4>
					</div>
				</div>
				<br>
				<div class="panel-body">
					<div class="row">
						<label class="control-label col-sm-2">Sim Number</label> <input
							type="text" id="serialNum" placeholder="Enter SIM serial number"
							class="col-sm-4" style="border-radius: .5rem"
							oninput="activateSearch(this,$('#simTable'),0);" />
					</div>
					<br>
					<div class="row">
						<label class="control-label col-sm-2">Operator</label> <select
							id="operator" class="col-sm-4" style="border-radius: .5rem"
							onchange="activateSearch(this,$('#simTable'),5);">
							<option value="">Select Operator</option>
							<option value="vodafone">Vodafone</option>
							<option value="etisalat">Etisalat</option>
							<option value="orange">Orange</option>
							<option value="we">We</option>
						</select>
					</div>
					<div>
						<br>
						<button class="btn btn-primary" onclick="exportToExcel()">Export
							Excel</button>
						<button class="btn btn-success" onclick="print($('#allSim'))">Print
							Report</button>

						<textarea id="taSimJson" style="visibility: hidden;"></textarea>
					</div>

					<br> <br> <br>
				</div>



				<br> <br>

				<div id="allSim" style="align-content: center"></div>


			</div>
		</div>
	</div>
	</div>
	<script src="assets/js/operations/admin/reports/reports-util.js"></script>
	<script src="assets/js/operations/admin/reports/sim-report.js"></script>
	<script>
		$(document).ready(function() {
			getAllSim();
		});
	</script>

</body>
</html>
