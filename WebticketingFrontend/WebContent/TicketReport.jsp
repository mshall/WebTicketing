<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="tickets_report" /></title>
<link href="Report.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>


		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<fmt:message key="tickets" />
						</h4>
					</div>
				</div>
				<br>
				<div class="panel-body">
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message
								key="terminal_id" /></label> <input type="text" id="terminalId"
							placeholder="Enter Terminal id" class="col-sm-4"
							style="border-radius: .5rem"
							oninput="activateSearch(this,$('#allTicketsTable'),3);" />
					</div>
					<br>
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message
								key="ticket_id" /></label> <input type="text" id="ticketId"
							placeholder="Enter Ticket Id " class="col-sm-4"
							style="border-radius: .5rem"
							oninput="activateSearch(this,$('#allTicketsTable'),0);" />
					</div>
					<br>
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message
								key="status" /></label> <select id="status" class="col-sm-4"
							style="border-radius: .5rem"
							onchange="activateSearch(this,$('#allTicketsTable'),1);">
							<option value="">Select...</option>
							<option value="Open">Open</option>
							<option value="Closed">Closed</option>
						</select>
					</div>
					<div>
						<br>
						<button class="btn btn-primary" onclick="exportToExcel()">
							<fmt:message key="export_excel" />
						</button>
						<button class="btn btn-success" onclick="print($('#allTickets'))">
							<fmt:message key="print_report" />
						</button>

						<textarea id="taTicketsJson" style="visibility: hidden;"></textarea>
					</div>

					<br> <br> <br>
					<div class="panel-body">
						<table id='allTicketsTable' class='table responsive' border='1'>
							<thead>
								<tr>
									<th><fmt:message key="ticket_id" /></th>
									<th><fmt:message key="status" /></th>
									<th><fmt:message key="serial_number" /></th>
									<th><fmt:message key="terminal_id" /></th>
									<th><fmt:message key="merchant_name" /></th>
									<th><fmt:message key="merchant" /></th>
									<th><fmt:message key="address" /></th>
									<th><fmt:message key="city" /></th>
									<th><fmt:message key="problem" /></th>
								</tr>
							</thead>
							<tbody id="allTickets">
							</tbody>
						</table>
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
			getAllComplaints();
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
