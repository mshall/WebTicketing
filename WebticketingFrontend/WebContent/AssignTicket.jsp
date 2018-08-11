<%-- 
    Document   : AssignTicket
    Created on : May 25, 2018, 6:21:44 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page import="java.sql.Statement"%>
<%@page import="jdk.nashorn.internal.ir.TryNode"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="BootStrap/js/glm-ajax.js" type="text/javascript"></script>
<a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
<link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css" />
<script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="BootStrap/js/npm.js" type="text/javascript"></script>
<script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>

</head>
<body>
	<%@include file="Header.jsp"%>
	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
			<div class="alert alert-success" id="successUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Sucess!
				</strong> ticket is assigned successfully
			</div>
			<div class="alert alert-danger" id="errorUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Warning!
				</strong> Couldn't assign ticket!
			</div>
			<div class="panel-group">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">Assign Ticket</h4>
					</div>
				</div>
				<div class="panel-body   ">
					<form name="Assign" action="TicketAssign" method="POST"
						lass="form-horizontal" id="myForm">
						<br> <br>
						<div class="form-group">
							<label class="control-label col-sm-4"> Ticket ID</label>
							<div class="col-sm-8" id="dTickets">
								<select name="sTickets" id="sTickets">

								</select>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<label class="control-label col-sm-4"> Technician Name </label>
							<div class="col-sm-8" id="dTechnicians">
								<select name="sTechnicians" id="sTechnicians">

								</select>
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<input type="button" value="Submit" name="submit"
									class="btn btn-primary" onclick="assignTicket()"/> <input type="reset" value="Cancel"
									name="cancel" onclick="Formreset()" class="btn btn-danger" />
							</div>
						</div>
						<br>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script src="assets/js/operations/admin/tickets.js"></script>
	<script src="assets/js/operations/admin/technician.js"></script>
	<script>
		$(document).ready(function() {
			$("#successUpdate").hide();
			$("#errorUpdate").hide();
			getAllComplaintsByStatus('Open');
			getAllTechniciansForTicketing();
		});

		function Formreset() {
			document.getElementById("myForm").reset();
		}
	</script>

</body>
</html>
