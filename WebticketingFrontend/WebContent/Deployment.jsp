<%-- 
    Document   : Deployment
    Created on : May 25, 2018, 7:03:48 AM
    Author     : Mohamed S. El-Shall
--%>

<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="deployment" /></title>
</head>
<body>

	<div class="wrapper ">
		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="deployment" /> </h4>
					</div>


					<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						</a> <a href="DeployToMerchant.jsp">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-plus"></span><fmt:message key="deploy" /> 
							</button>
						</a>
					
						<br> <br> <br>
						<div id="allTerminals"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script src="assets/js/operations/admin/deployment.js"></script>
	<script>
		$(document).ready(function() {
			getTerminalsByStatus('Deployed');
		});
	</script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
