<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<html>
<head>

<title><fmt:message key="merchants" /></title>
<style>
td, th {
	size: 10px;
}

table {
	size: 100px;
}
</style>
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
								href="#collapseOne"><fmt:message key="merchants" /></a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<div>
								<div>
									<a href="editMerchant.jsp">
										<button class="btn btn-default">
											<span class="glyphicon glyphicon-plus"></span>
											<fmt:message key="add_merchant" />
										</button>
									</a>
								</div>
							</div>
							<br> <br> <br>
							<div class="panel-body">
								<table id='merchantsTable' class='table responsive' border='1'>
									<thead>
										<tr>
											<th><fmt:message key="merchant_name"/></th>
											<th><fmt:message key="active"/></th>
											<th><fmt:message key="mcc"/></th>
											<th><fmt:message key="class"/></th>
											<th><fmt:message key="operations"/></th>
										</tr>
									</thead>
									<tbody id="allMerchants">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<script src="assets/js/operations/admin/merchants.js"></script>
		<script>
			$(document).ready(function() {
				getAllMerchants();
			});
		</script>
		
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
