
<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<jsp:include page="AlertMessage.jsp"></jsp:include>
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
										<span class="glyphicon glyphicon-plus"></span>
										<fmt:message key="add_store" />
									</button>
								</a>
							</div>
							<br> <br>
							<div class="panel-body">
								<table id='storesTable' class="table responsive" border="1">
									<thead>
										<tr>
											<th><fmt:message key="store_id" /></th>
											<th><fmt:message key="store_name" /></th>
											<th><fmt:message key="address" /></th>
											<th><fmt:message key="details" /></th>
											<th></th>
										</tr>
									</thead>
									<tbody id="allStores">
										<!-- <div class="panel-body" id="allStores"></div> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="col-sm-2"></div>

		</div>
		</div>
		<script src="assets/js/operations/admin/stores.js"></script>
		<script>
			$(document).ready(function() {
				getAllStores();
			});
		</script>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
