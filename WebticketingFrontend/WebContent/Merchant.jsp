<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>

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
									<a href="addMerchant.jsp">
										<button class="btn btn-default">
											<span class="glyphicon glyphicon-plus"></span><fmt:message key="merchant" />
										</button>
									</a>
								</div>
							</div>
							<br> <br> <br>
							<div id="allMerchants"></div>
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
