<%-- 
    Document   : DeployToMerchant
    Created on : May 27, 2018, 10:24:35 PM
    Author     : Mohamed S. El-Shall
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Deploy To Merchant</title>
<style>
</style>
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
								href="#collapseOne"> Deploy to Merchant </a>
						</h4>
					</div>

				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body   ">
						<form name="" action="DeploymentControll" method="POST"
							class="form-horizontal">

							<div class="form-group ">
								<label class="control-label col-sm-4">MID</label>
								<div class="col-sm-8" id="merchantId"></div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">Terminal-ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="terminalId"
										placeholder="Terminal ID" required="">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">SIM 1</label>
								<div class="col-sm-7">
									<select name="sim1" id="firstSimSerialOperator"
										onchange="getSimByOperatorDropdown($(this).val(),'firstSimSerialList','firstSimSerial')" >
										<option value="none">Operator</option>
										<option value="vodafone">vodafone</option>
										<option value="orange">Orange</option>
										<option value="etisalat">Etisalat ></option>
										<option value="we">We</option>
									</select>
									<div id="firstSimSerialList"></div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4">SIM 2</label>
								<div class="col-sm-7">
									<select name="sim2" id="secondSimSerialOperator" onchange="getSimByOperatorDropdown($(this).val(),'secondSimSerialList','secondSimSerial')">
										<option value="none">Operator</option>
										<option value="vodafone">vodafone</option>
										<option value="orange">Orange</option>
										<option value="etisalat">Etisalat ></option>
										<option value="we">We</option>
										</select>
										<div id="secondSimSerialList"></div>
								</div>
							</div>

							<div class="form-group ">
								<div class="col-sm-offset-4 col-sm-8">
									<input type="submit" value="Submit" name="submit"
										class="btn btn-primary" /> <input type="reset" value="Cancel"
										name="cancel" onclick="Formreset()" class="btn btn-danger" />
								</div>
							</div>


						</form>


					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				
			});
			function Formreset() {
				document.getElementById("myForm").reset();
			}
		</script>
</body>

</html>
