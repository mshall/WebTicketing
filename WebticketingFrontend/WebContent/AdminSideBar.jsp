<%-- 
    Document   : AdminSideBar
    Created on : May 23, 2018, 7:39:48 PM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
</head>


<body>
	<nav id="sidebar">
		<div class="sidebar-header">
			<button type="button" id="sidebarCollapse"
				class="btn btn-info navbar-btn  ">
				<i class="glyphicon glyphicon-align-right"></i> <span></span>
			</button>
		</div>
		<ul class="list-unstyled components">
			<li class="active"><a href="AdminHome.jsp"> <i
					class="glyphicon glyphicon-home"></i><fmt:message key="home" /> 
			</a></li>

			<li><a href="#homeSubmenu" data-toggle="collapse"
				aria-expanded="false" aria-controls="homeSubmenu"> <i
					class="glyphicon glyphicon-briefcase"></i><fmt:message key="accounts" /> 
			</a>
				<ul class="collapse list-unstyled" id="homeSubmenu">
					<li><a href="Technical.jsp"> <fmt:message key="technical" /></a></li>
					<li><a href="Merchant.jsp"><fmt:message key="merchant" /> </a></li>
					<li><a href="Store.jsp"><fmt:message key="store" /> </a></li>
					<li><a href="ChangePassword.jsp"><fmt:message key="change_password" /></a></li>
				</ul></li>
				
			<li><a href="#Terminal" data-toggle="collapse"
				data-target="#TerminalC" aria-expanded="false"
				aria-controls="TerminalC"> <i class="glyphicon glyphicon-phone"></i>
					<fmt:message key="terminals" />
			</a>
				<ul class="collapse list-unstyled" id="TerminalC">
					<li><a href="Terminals.jsp"><fmt:message key="terminals" /></a></li>
					<li><a href="Deployment.jsp"><fmt:message key="deployment" /></a></li>

				</ul></li>
			<li><a href="#SIM" data-toggle="collapse" aria-expanded="false">
					<i class="glyphicon glyphicon-duplicate"></i> <fmt:message key="sim" />
			</a>
				<ul class="collapse list-unstyled" id="SIM">
					<li><a href="SIM.jsp"> <fmt:message key="sim" /> </a></li>
				</ul></li>
			<li><a href="#RollPaper" data-toggle="collapse"
				aria-expanded="false"> <i class="glyphicon glyphicon-duplicate"></i>
					<fmt:message key="roll_paper" />
			</a>
				<ul class="collapse list-unstyled" id="RollPaper">
					<li><a href="MerchantRP.jsp"><fmt:message key="store_to_merchant" /></a></li>
				</ul></li>
			<li><a href="#Tickets" data-toggle="collapse"
				aria-expanded="false"> <i class="glyphicon glyphicon-duplicate"></i>
					<fmt:message key="tickets" />
			</a>
				<ul class="collapse list-unstyled" id="Tickets">
					<li><a href="InboxTickets.jsp"><fmt:message key="inbox_tickets" /></a></li>
					<li><a href="AssignTicket.jsp"><fmt:message key="assign_ticket" /></a></li>
					<li><a href="TicketsHistory.jsp"><fmt:message key="tickets_history" /></a></li>
				</ul></li>
			<li><a href="#Withdraw" data-toggle="collapse"
				aria-expanded="false"> <i class="glyphicon glyphicon-ban-circle"></i>
					<fmt:message key="withdraw" />
			</a>
				<ul class="collapse list-unstyled" id="Withdraw">

					<li><a href="WithDraw.jsp"><fmt:message key="add_new_withdraw" /></a></li>
					<li><a href="WithDrawLogs.jsp"><fmt:message key="withDraw_logs" /> </a></li>
				</ul></li>
			<li><a href="#Reports" data-toggle="collapse"
				aria-expanded="false"> <i class="glyphicon glyphicon-envelope"></i>
					<fmt:message key="reports" />
			</a>
				<ul class="collapse list-unstyled" id="Reports">
					<li><a href="TerminalReport.jsp"><fmt:message key="pos_report" /></a></li>
					<li><a href="SimReport.jsp"><fmt:message key="sim_report" /></a></li>
					<li><a href="MaintenanceReport.jsp"><fmt:message key="maintenance_report" /></a></li>
					<li><a href="DeploymentReport.jsp"><fmt:message key="deployment_report" /></a></li>
					<li><a href="TicketReport.jsp"><fmt:message key="tickets_report" /></a></li>
					<li><a href="WdReport.jsp"><fmt:message key="withdrawals_report" /></a></li>
					<li><a href="RpReport.jsp"><fmt:message key="rollpaper_report" /></a></li>
				</ul></li>

			<li><a onclick="logout()" href="#"> <i
					class="glyphicon glyphicon-log-out"></i><fmt:message key="logout" />
			</a></li>
		</ul>


	</nav>



	<script src="assets/js/jquery.session.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
	<script src="assets/js/jquery.session.js"></script>
	<script src="assets/js/operations/admin/admin-home.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>
	<script src="assets/js/operations/admin/tickets.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});

		// Activate the logout when clicked
		function logout() {
			$.session.clear();
			window.location.replace("Login.jsp");
		}
	</script>


</body>
</html>
