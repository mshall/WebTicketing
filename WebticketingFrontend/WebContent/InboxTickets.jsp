<%-- 
    Document   : InboxTickets
    Created on : May 25, 2018, 6:21:19 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.panel-heading a:after {
	font-family: 'Glyphicons Halflings';
	content: "\e114";
	float: right;
	color: #fff;
}

.panel-heading a.collapsed:after {
	content: "\e080";
}

panel {
	width: 100%;
}

table {
	width: 100%;
}
</style>
</head>
<body>

	<div class="wrapper ">
		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
		<jsp:include page="AlertMessage.jsp"></jsp:include>
			<div class="panel-group" id="accordion">


				<div class="panel panel-primary" id="panel2">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseTwo"
								href="#collapseTwo"> <fmt:message key="tickets" />
							</a>
						</h4>

					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body">
							<table id="allTicketsTable" class="table responsive" border="1">
								<thead>
									<tr>
										<th><fmt:message key='ticket_id' /></th>
										<th><fmt:message key='ticket_date' /></th>
										<th><fmt:message key="details" /></th>
										<th></th>
									</tr>
								</thead>
								<tbody id="allTickets">
								</tbody>
							</table>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>


	</div>
	<script src="assets/js/operations/admin/tickets.js"></script>
	<script>
		$(document).ready(function() {
			getAllComplaints();
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
