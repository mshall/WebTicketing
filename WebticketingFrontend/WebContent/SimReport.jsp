<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="sim_report" /></title>
<link href="Report.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="all_sim" /></h4>
					</div>
				</div>
				<br>
				<div class="panel-body">
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message key="sim_number" /></label> <input
							type="text" id="serialNum" placeholder="Enter SIM serial number"
							class="col-sm-4" style="border-radius: .5rem"
							oninput="activateSearch(this,$('#simTable'),0);" />
					</div>
					<br>
					<div class="row">
						<label class="control-label col-sm-2"><fmt:message key="operator" /></label> <select
							id="operator" class="col-sm-4" style="border-radius: .5rem"
							onchange="activateSearch(this,$('#simTable'),5);">
							<option value="">select...</option>
							<option value="vodafone">Vodafone</option>
							<option value="etisalat">Etisalat</option>
							<option value="orange">Orange</option>
							<option value="we">We</option>
						</select>
					</div>
					<div>
						<br>
						<button class="btn btn-primary" onclick="exportToExcel()"><fmt:message key="export_excel" /></button>
						<button class="btn btn-success" onclick="print($('#allSim'))"><fmt:message key="print_report" /></button>

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
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
