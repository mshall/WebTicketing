<%-- 
    Document   : Deployment
    Created on : May 25, 2018, 7:03:48 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="terminals" /></title>

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
						<h4 class="panel-title"><fmt:message key="terminals" /></h4>
					</div>

					<div class="panel-body">
							</a> <a href="addTerminal.jsp">
								<button class="btn btn-default">
									<span class="glyphicon glyphicon-plus"></span><fmt:message key="terminal" /></button>
							</a>
						</div>
						<br> <br> <br>
						<div id="allTerminals"></div>
					</div>
				</div>
				<div></div>
			</div>
		</div>
	<script src="assets/js/operations/admin/terminals.js"></script>
		<script>
			$(document).ready(function() {
				getAllTerminals();
			});
		</script>
</body>
</html>
