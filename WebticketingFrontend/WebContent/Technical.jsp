<%-- 
    Document   : Technical
    Created on : May 24, 2018, 2:05:57 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Technical</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>

		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">All Technical</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">

							<div>
								<a href="addTechnical.jsp">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> Technical
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


</body>
</html>
