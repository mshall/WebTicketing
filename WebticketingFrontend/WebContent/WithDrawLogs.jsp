<%-- 
    Document   : WithDrawLogs
    Created on : May 25, 2018, 6:35:31 AM
    Author     : Mohamed S. El-Shall
--%>

<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title><fmt:message key="withdraw_logs" /></title>

</head>
<body>
	<div class="wrapper ">
		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="withdraw_logs" /></h4>
					</div>

					<div class="panel-body" id="dWithdrawalsLogs"></div>

				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/operations/admin/withdrawals.js"></script>
	<script>
		$(document).ready(function() {
			getWithdrawalsLogs();
		});
	</script>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
