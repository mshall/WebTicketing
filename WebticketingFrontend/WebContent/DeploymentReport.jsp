<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="deployment_report" /></title>
<link href="Report.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<div id="content">

			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="deployment" /></h4>
					</div>
				</div>
				<br>

				<div class="panel-body">
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message key="serial_number" /></label> <input
							type="text" id="serialNum" placeholder="Enter terminal serial "
							class="col-sm-4" style="border-radius: .5rem"
							oninput="activateSearch(this,$('#terminalsTable'),2);" />
					</div>
					<br>
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message key="tid" /></label> <input
							type="text" id="terminalId" placeholder="Enter terminal id "
							class="col-sm-4" style="border-radius: .5rem"
							oninput="activateSearch(this,$('#terminalsTable'),3);" />
					</div>
					<br>
					<div class="row" id="dMerchantId">
						<label class="col-sm-2"><fmt:message key="merchant" /></label> <select id="sMerchants"
							name="sMerchants" class="col-sm-4" style="border-radius: .5rem"
							onchange="activateSearch(this,$('#terminalsTable'),4);">
						</select>
					</div>
					<br> <br>
					<button class="btn btn-primary" onclick="exportToExcel()"><fmt:message key="export_excel" /></button>
					<button class="btn btn-success" onclick="print($('#allTerminals'))"><fmt:message key="print_report" /></button>

					<textarea id="taDeploymentsJson" style="visibility: hidden;"></textarea>


					<br> <br> <br>
					<div id="allTerminals"></div>
				</div>
			</div>
			<div></div>
		</div>
	</div>
	<script src="assets/js/operations/admin/reports/reports-util.js"></script>
	<script src="assets/js/operations/admin/reports/terminals-report.js"></script>
	<script>
		$(document).ready(function() {
			getTerminalsByStatus('Deployed');
			getAllMerchantsForDeplyment();
		});
	</script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
