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
<title>Terminal Report</title>
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
						<h4 class="panel-title">All Terminals</h4>
					</div>

					<div class="panel-body">
						<div>
						<label class="control-label col-sm-2">serial</label>
							<input type="text" id="serialNum"
								placeholder="Enter Terminal serial" class="input-sm" /> 
						</div>
						<div>
									<label class="control-label col-sm-2">Status</label>
									
										<select name="status">
											<option value=""></option>
											<option value="EUR">Deployed</option>
											<option value="ss">Stock</option>
											<option value="pp">Defected</option>
											<option value="sss">Lost</option>
											<option value="pp">Transited</option>
											<option value="sss">Under Preparation</option>
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
						
						<br> <br> <br>
						<div id="allTerminals"></div>
					</div>
				</div>
				<div></div>
			</div>
		</div>
		<script src="assets/js/operations/admin/reports/terminals-report.js"></script>
		<script>
			$(document).ready(function() {
				getAllTerminals();
			});
		</script>
</body>
</html>
