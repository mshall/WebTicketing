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
<title>Maintenance Report</title>
<link href="Report.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<div id="content">
		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">Tickets</h4>
					</div>

					<div class="panel-body">
						<div>
						<label class="control-label col-sm-2">Terminal Id</label>
							<input type="text" id="terminalId"
								placeholder="Enter Terminal id" class="input-sm" /> 
						</div>
						<div>
						<label class="control-label col-sm-2">Ticket Id</label>
							<input type="text" id="ticketId"
								placeholder="Enter Ticket Id " class="input-sm" /> 
						</div>
						<div>
							<label class="control-label col-sm-2">Status</label>
								<select id="status">
									<option value=""></option>
									<option value="open">open</option>
									<option value="closed">closed</option>
								</select>	
							</div>		
						<div>	
									<br>
				<button class="btn btn-primary" onclick="exportToExcel()">Export
					Excel</button>
				<button class="btn btn-success"
					onclick="print($('#allTickets'))">Print Report</button>
		
				<textarea id="taTicketsJson" style="visibility: hidden;"></textarea>
						</div>
						
						<br> <br> <br>
						<div class="panel-body" id="allTickets"></div>
					</div>
					</div>
				</div>
				<div></div>
			</div>
		</div>
		<script src="assets/js/operations/admin/reports/reports-util.js"></script>
		<script src="assets/js/operations/admin/reports/tickets-report.js"></script>
		<script>
			$(document).ready(function() {
				getAllComplaintsByStatus('Closed');
			});
		</script>

</body>
</html>
