<%-- 
    Document   : Technical
    Created on : May 24, 2018, 2:05:57 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="technicals" /></title>
</head>
<body>

	

	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>

		<div id="content">
		<jsp:include page="AlertMessage.jsp"></jsp:include>
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="technicals" /></h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">

							<div>
								<a href="addTechnical.jsp">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span><fmt:message key="technical" />
									</button>
								</a>
							</div>

							<br> <br>
							<div id="allTechnicals"></div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/operations/admin/technician.js"></script>
	<script>
		$(document).ready(function() {
			manageTechnicians();
		});
	</script>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
