<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="technical_tickets" /></title>
</head>
<body>
	<div class="wrapper ">
		<%@include file="TechnicalSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel2">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseTwo"
								href="#collapseTwo"> <fmt:message key="tickets_history" />
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body">
							<table id='allTicketsByTechnicianTable' class='table responsive'
								border='1'>
								<thead>
									<tr>
										<th><fmt:message key="ticket_id" /></th>
										<th><fmt:message key="vendor" /></th>
										<th><fmt:message key="serial_number" /></th>
										<th><fmt:message key="ticket_date" /></th>
										<th><fmt:message key="problem" /></th>
										<th><fmt:message key="mobile" /></th>
										<th><fmt:message key="status" /></th>
										<th></th>
									</tr>
								</thead>
								<tbody id="allTicketsByTechnician">
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script
		src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">

	<script src="assets/js/operations/admin/tickets.js"></script>
	<script>
		$(document).ready(function() {
			getComplaintsByTechnician();
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
