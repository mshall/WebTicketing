<%-- 
    Document   : AssignTicket
    Created on : May 25, 2018, 6:21:44 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<titl> <fmt:message key="assign_tickets" />
</title>
</head>
<body>
	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
			<jsp:include page="AlertMessage.jsp"></jsp:include>
			<div class="panel-group">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<fmt:message key="assign_ticket" />
						</h4>
					</div>
				</div>
				<div class="panel-body   ">
					<form name="Assign" action="TicketAssign" method="POST"
						lass="form-horizontal" id="myForm">
						<br> <br>
						<div class="form-group">
							<label class="control-label col-sm-4"> <fmt:message
									key="ticket_id" /></label>
							<div class="col-sm-8" id="dTickets">
								<select name="sTickets" id="sTickets">

								</select>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<label class="control-label col-sm-4"><fmt:message
									key="technician_name" /> </label>
							<div class="col-sm-8" id="dTechnicians">
								<select name="sTechnicians" id="sTechnicians">

								</select>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<input type="button" value="<fmt:message key="submit" />"
									name="submit" class="btn btn-primary" onclick="assignTicket()" />
								<input type="reset" value="<fmt:message key="cancel" />"
									name="cancel" onclick="window.history.go(-1);"
									class="btn btn-danger" />
							</div>
						</div>
						<br>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script src="assets/js/operations/admin/tickets.js"></script>
	<script src="assets/js/operations/admin/technician.js"></script>
	<script>
		$(document).ready(function() {
			//$("#successUpdate").hide();
			//$("#errorUpdate").hide();
			getAllComplaintsByStatus('Open');
			getAllTechniciansForTicketing();
		});

		function Formreset() {
			document.getElementById("myForm").reset();
		}
	</script>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
