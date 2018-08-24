<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>


<%@include file="Header.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="stores" /></title>

</head>
<body>

	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>

		<div id="content">

			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseOne"
								href="#collapseOne"><fmt:message key="stores" /></a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<div>

								<a href="addstore.jsp">
									<button class="btn btn-default">
										<span class="glyphicon glyphicon-plus"></span><fmt:message key="store" />
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
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
