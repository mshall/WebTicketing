<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : Mohamed S. El-Shall
--%>

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
								href="#dAllRollpapersForVendors"><fmt:message key="all_rollpapers_logs_for_vendors" /></a>
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="collapse" id="dAllRollpapersForVendors"
						style="align-content: center" data-parent="#accordion"></div>
				</div>

			</div>
			<!-- ------------------ All roll papers for merchants ------------------------ -->
			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#dAllRollpapersForMerchants"><fmt:message key="all_rollpapers_logs_for_merchants" /></a>
						</h4>
					</div>
				</div>
				<div class="panel-body">
					<div class="collapse" id="dAllRollpapersForMerchants"
						style="align-content: center" data-parent="#accordion"></div>
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
