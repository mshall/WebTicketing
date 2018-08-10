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
<link href="Report.css" rel="stylesheet" type="text/css" />
<title>Technical Report</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="wrapper ">

		<%@include file="AdminSideBar.jsp"%>

	<%-- 	<div id="content">

			<%
				//connect c = new connect();
				//  Connection con = c.getConn();
				// Statement s = con.createStatement();
				//ResultSet rs = s.executeQuery("SELECT * from technical");
				//RowSetDynaClass resultSet = new RowSetDynaClass(rs, false);
				//            s.close();
				//            con.close();
				//request.setAttribute("results", resultSet);
			%>

			<display:table name="requestScope.results.rows" export="true">


				<display:setProperty name="export.excel.filename"
					value="ActorDetails.xls" />
				<display:setProperty name="export.pdf.filename"
					value="ActorDetails.pdf" />
				<display:setProperty name="export.pdf" value="true" />
			</display:table>
			
		</div>
	</div>
 --%>


		<div id="content">
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">All Technical</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<br> <br>
							<div id="allTechnicals"></div>
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
	<script src="assets/js/operations/admin/technician.js"></script>
	<script>
		$(document).ready(function() {
			manageTechnicians();
		});
	</script>








</body>
</html>
