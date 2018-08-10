<%-- 
    Document   : Test
    Created on : Jun 24, 2018, 3:46:11 AM
    Author     : shimaa
--%>

<%@page import="org.apache.commons.beanutils.RowSetDynaClass"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sim Report</title>
<link href="Report.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="wrapper ">

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
						<label class="control-label col-sm-2">Sim Number</label>
							<input type="text" id="serialNum"
								placeholder="Enter Terminal ID " class="input-sm" /> 
						</div>
						<div>
							<label class="control-label col-sm-2">operator</label>
								<select id="operator">
									<option value=""></option>
									<option value="vodafon">vodafon</option>
									<option value="etisalat">etisalat</option>
									<option value="orange">orange</option>
									<option value="we">we</option>
								</select>	
							</div>	
						<div>	
								<button type="button" class="btn bg-primary" onclick="">
									<span class="glyphicon glyphicon-search"></span> Search
								</button>
								<button type="button" class="btn bg-primary" onclick="">
									<span class="glyphicon glyphicon-search"></span> Print All
								</button>
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

	<script src="assets/js/operations/admin/reports/sim-report.js"></script>
		<script>
			$(document).ready(function() {
				getAllSim();
			});
		</script>

</body>
</html>
