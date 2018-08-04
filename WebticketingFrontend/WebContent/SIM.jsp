
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>

<head>

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
								href="#collapseOne"> All SIM </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">


							<div>
								<input type="text" name="ID" value="" placeholder="Sim serial "
									class="input-sm" /> <a
									href="SimControll?action=search&search=<c:out value="ID"/>">
									<button type="submit" class="btn bg-primary">
										<span class="glyphicon glyphicon-search"></span> Search
									</button>
								</a> <a href="SimControll?action=insert">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span> SIM
									</button>
								</a>
							</div>

							<br> <br>

							<div id="allSim" style="align-content: center">
								<div class="allSim"></div>
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

</body>


</html>

