<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<script src="BootStrap/js/glm-ajax.js" type="text/javascript"></script>
<a href="bootStrap/fonts/glyphicons-halflings-regular.svg"></a>


</head>
<body>



	<%@include file="Header.jsp"%>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseOne"
								href="#collapseOne"> Stores Information </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body" id="allStores"></div>
					</div>
				</div>


				<br> <br> <br> <br>


				<div class="panel panel-primary" id="panel2">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseTwo"
								href="#collapseTwo"> Tickets Information </a>
						</h4>

					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body" id="allTickets"></div>
					</div>


				</div>
			</div>



		</div>


	</div>


	<script
		src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
	<script src="assets/js/jquery.session.js"></script>
	<script src="assets/js/operations/admin/admin-home.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>
	<script src="assets/js/operations/admin/tickets.js"></script>
	<script>
		$(document).ready(function() {
			getAllStores();
			getAllComplaints();
		});
	</script>





</body>
</html>
