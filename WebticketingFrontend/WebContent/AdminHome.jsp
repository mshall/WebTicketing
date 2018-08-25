<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="home" /></title>
<script src="BootStrap/js/glm-ajax.js" type="text/javascript"></script>
<a href="bootStrap/fonts/glyphicons-halflings-regular.svg"></a>

</head>
<body>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
	
		<jsp:include page="AlertMessage.jsp"></jsp:include>
		
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseOne"
								href="#collapseOne"><fmt:message key="stores" /> </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<table id="storesTable" class="table responsive" border="1"> 
										<thead> <tr><th><fmt:message key="store_id"/></th>
											<th><fmt:message key="store_name"/></th>
											<th><fmt:message key="address"/></th>
												<th><fmt:message key="details"/></th>
												<th></th></tr>
												</thead>
									<tbody id="allStores">	
							</tbody>
							</table>
						</div>	
					</div>
				</div>

				<br> <br> <br> <br>

				<div class="panel panel-primary" id="panel2">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseTwo"
								href="#collapseTwo"><fmt:message key="tickets" /> </a>
						</h4>

					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body">
							 <table id="allTicketsTable" class="table responsive" border="1">
										<thead> <tr><th><fmt:message key='ticket_id' /></th>
										<th><fmt:message key='ticket_date' /></th>
										<th><fmt:message key="details"/></th> 
										<th></th></tr></thead>
								<tbody id="allTickets">		
							</tbody>
							</table>
							</div>	
					</div>

				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
	<script src="assets/js/jquerysession.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<script src="assets/js/operations/admin/admin-home.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>
	<script src="assets/js/operations/admin/tickets.js"></script>
	<script>
		$(document).ready(function() {
			getAllStores();
			getAllComplaints();
		});
	</script>

<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>
