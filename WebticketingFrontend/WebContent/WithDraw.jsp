<%-- 
    Document   : WithDraw
    Created on : May 25, 2018, 6:31:31 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="terminal_withdraw" /></title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="wrapper ">
		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
			<div class="alert alert-success" id="successUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Sucess!
				</strong> Terminal has been withdrawn successfully
			</div>
			<div class="alert alert-danger" id="errorUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Warning!
				</strong> Couldn't withdraw terminal!
			</div>
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title"><fmt:message key="terminal_withdraw" /></h4>
					</div>

					<div class="panel-body">
						<form name="WithDraw" action="TWithDraw" method="POST"
							class="form-horizontal" id="myForm">

							<div class="form-group">
								<label class="col-sm-4 control-label"><fmt:message key="merchant" /></label>
								<div class="col-sm-8" id="dMerchantId">
									<select class="form-control" name="sMerchantId"
										id="sMerchantId" style="width: 50%">
										<option value="0">Select Merchant ID</option>;
										<option value=""></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label"><fmt:message key="terminal" /></label>
								<div class="col-sm-8" id="dTerminalSerial">
									<select class="form-control" name="sTerminalSerial"
										style="width: 50%" id="sTerminalSerial">
										<option value="0">Select Terminal serial</option>;
										<option value=""></option>

									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-8">
									<input type="button" value="<fmt:message key="submit" />" name="submit"
										class="btn btn-primary" onclick="withdrawTerminal()"/> 
								<input type="button" value="<fmt:message key="cancel" />"
										name="cancel" onclick="Formreset()" class="btn btn-danger" />
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="assets/js/operations/admin/withdrawals.js"></script>
		<script>
			$(document).ready(function() {
				$("#successUpdate").hide();
				$("#errorUpdate").hide();
				getAllMerchantsForWithdrawal();
				getAllTerminalSerialsForWithdrawal();
			});
		</script>
</body>
</html>
