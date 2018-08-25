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
<title><fmt:message key="roll_paper_report" /></title>
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
							<a data-toggle="collapse" data-parent="#accordion"
								href="#dAllRollpapersForVendors"><fmt:message
									key="all_rollpapers_logs_for_vendors" /></a>
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="panel-body" style="align-content: center"
						data-parent="#accordion">
						<table id='tAllRollpapersForVendors' class='table responsive'
							border='1'>
							<thead>
								<tr>
									<th><fmt:message key="store_name" /></th>
									<th><fmt:message key="roll_size" /></th>
									<th><fmt:message key="total" /></th>
									<th><fmt:message key="out" /></th>
									<th><fmt:message key="rest" /></th>
									<th><fmt:message key="date" /></th>
								</tr>
							</thead>
							<tbody id="dAllRollpapersForVendors">
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<!-- ------------------ All roll papers for merchants ------------------------ -->
			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#dAllRollpapersForMerchants"><fmt:message
									key="all_rollpapers_logs_for_merchants" /></a>
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="panel-body" style="align-content: center" data-parent="#accordion">
						<table id='tAllRollpapersForMerchants' class='table responsive'
							border='1'>
							<thead>
								<tr>
									<th><fmt:message key="merchant_name" /></th>
									<th><fmt:message key="roll_size" /></th>
									<th><fmt:message key="out" /></th>
									<th><fmt:message key="meet_sla" /></th>
									<th><fmt:message key="note" /></th>
									<th><fmt:message key="date" /></th>
								</tr>
							</thead>
							<tbody id="dAllRollpapersForMerchants">
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
		</div>
		<script src="assets/js/operations/admin/reports/rollpaper-reports.js"></script>
		<script>
			$(document).ready(function() {
				getAllRollpapersForVendors();
				getAllRollpapersForMerchants();
			});
		</script>

		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
