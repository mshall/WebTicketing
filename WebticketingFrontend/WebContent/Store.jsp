<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Store</title>

</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>

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
						<div class="panel-body">
							<div>

								<a href="addstore.jsp">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> Store
									</button>
								</a>
							</div>
							<br> <br>
							<div id="allStores"></div>
						</div>

					</div>


				</div>



			</div>

			<div class="col-sm-2"></div>

		</div>
		<script>
			$(document).ready(function() {
				getAllStores();
			});
		</script>
</body>
</html>
