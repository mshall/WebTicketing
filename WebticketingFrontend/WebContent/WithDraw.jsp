<%-- 
    Document   : WithDraw
    Created on : May 25, 2018, 6:31:31 AM
    Author     : shimaa
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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

<link href="BootStrap/MyCss.css" rel="stylesheet" type="text/css" />



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
						<h4 class="panel-title">Terminal Withdraw</h4>
					</div>

					<div class="panel-body">
						<form name="WithDraw" action="TWithDraw" method="POST"
							class="form-horizontal" id="myForm">

							<div class="form-group">
								<label class="col-sm-4 control-label"> Merchant ID</label>
								<div class="col-sm-8" id="dMerchantId">
									<select class="form-control" name="sMerchantId"
										id="sMerchantId" style="width: 50%">
										<option value="0">Select Merchant ID</option>;

										<option value=""></option>




									</select>
								</div>
							</div>



							<div class="form-group">
								<label class="col-sm-4 control-label"> Terminal</label>
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
									<input type="button" value="Submit" name="submit"
										class="btn btn-primary" onclick="withdrawTerminal()"/> <input type="reset" value="Cancel"
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
