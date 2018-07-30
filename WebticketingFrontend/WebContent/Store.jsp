<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : shimaa
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Store</title>
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
<link href="MyCss.css" rel="stylesheet" type="text/css" />
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
							<div class="col-sm-8" id="allStores"></div>
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
