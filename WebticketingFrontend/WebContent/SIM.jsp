<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<html>

<head>
<title><fmt:message key="sim" /></title>
</head>
<body>
	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">

			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseOne"
								href="#collapseOne"><fmt:message key="all_sim" /></a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">


							<div>
								</a> <a href="addSIM.jsp">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span>
										<fmt:message key="sim" />
									</button>
								</a>
							</div>

							<br> <br>

							<div class="panel-body">
								<table id='simTable' class='table responsive' border='1'>
									<thead>
										<tr>
											<th><fmt:message key="sim_serial" /></th>
											<th><fmt:message key="operator" /></th>
											<th><fmt:message key="condition" /></th>
											<th><fmt:message key="status" /></th>
											<th><fmt:message key="store" /></th>
											<th><fmt:message key="merchant" /></th>
											<th><fmt:message key="terminal" /></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="allSim">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/js/operations/admin/sim.js"></script>
	<script>
		$(document).ready(function() {
			getAllSim();
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

