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
								<div class="col-sm-8" id="merchantList"></div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">Currency</label>
								<div class="col-sm-8">
									<select id="currency">
										<option value="">select...</option>
										<option value="EGP">EGP</option>
										<option value="EUR">EUR</option>
										<option value="USD">USD</option>
										<option value="SAR">SAR</option>
										<option value="AED">AED</option>
										<option value="JPY">JPY</option>
										<option value="HKD">HKD</option>
										<option value="MOP">MOP</option>
										<option value="CNY">CNY</option>
										<option value="GBP">GBP</option>
									</select>
								</div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">Class</label>
								<div class="col-sm-8">
									<select id="terminalClass">
										<option value="none"></option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
									</select>
								</div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">ٍStatus</label>
								<div class="col-sm-8">
									<select id="status">
										<option value="">Select...</option>
										<option value="Deployed">Deployed</option>
										<option value="Stock">Stock</option>
										<option value="Defected">Defected</option>
										<option value="Lost">Lost</option>
										<option value="Transited">Transited</option>
										<option value="UnderPreparation">Under Preparation</option>
									</select>
								</div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">Terminal-ID</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="terminalId"
										placeholder="Terminal ID" required="">
								</div>
							</div>


							<div class="form-group ">
								<label class="control-label col-sm-4">Branch</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="branch"
										placeholder="branch" required="">
								</div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">Branch</label>
								<div class="col-sm-8">
									<input type="datetime-local" class="form-control"
										id="deploymentDate" placeholder="date" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">SIM 1</label>
								<div class="col-sm-7">
									<select name="sim1" id="firstSimSerialOperator"
										onchange="getSimByOperatorDropdown($(this).val(),'firstSimSerialList','firstSimSerial')">
										<option value="">Select...</option>
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
									<select name="sim2" id="secondSimSerialOperator"
										onchange="getSimByOperatorDropdown($(this).val(),'secondSimSerialList','secondSimSerial')">
										<option value="">Select...</option>
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
									<input type="button" value="Submit" onclick="addDeployment()"
										class="btn btn-primary" /> <input type="reset" value="Cancel"
										name="cancel" onclick="Formreset()" class="btn btn-danger" />
								</div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4">Terminal Feature</label>
							</div>
							<div class="form-group ">
								<div class="col-sm-8 col-sm-offset-2">
									<table class="table responsive ">
										<tr>
											<td clas="col-sm-4"><input type="checkbox" id="sale" />
												<label>Sale</label></td>
											<td clas="col-sm-4"><input type="checkbox"
												id="onlineRefund" /> <label>online Refund</label></td>
										</tr>

										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												id="offlineRefund" /> <label> offline Refund </label></td>


											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="offlineSale" /> <label> offline
													Sale </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="onlineVoid" /><label> OnLine
													Void </label></td>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="offlineVoid" /> <label> OffLine
													Void </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="preauth" /> <label> Preauth </label></td>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="amex" /><label> Amex </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="installments" /> <label>
													Instatiment </label></td>

											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="prepaidServices" /> <label>
													Prepaid Services </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="diners" /> <label> Diners </label></td>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="premuim" /> <label> Premuim </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="manualEntry" clas="col-sm-1" /> <label
												clas="col-sm-3"> Manual Entry </label></td>
										</tr>

									</table>
								</div>
							</div>


						</form>


					</div>
				</div>
			</div>
		</div>
		<script src="assets/js/operations/util.js"></script>
		<script src="assets/js/operations/admin/deployment.js"></script>
		<script src="assets/js/operations/admin/merchants.js"></script>
		<script src="assets/js/operations/admin/sim.js"></script>
		<script>
			$(document).ready(function() {
				getMerchantsDropdown()

				var terminalId = getURLParameter('terminalId');
				if (terminalId != null) {
					getTerminalById(terminalId);
				}
			});

			function Formreset() {
				/* document.getElementById("myForm").reset(); */
				window.location.replace("DeployToMerchant.jsp");
			}
		</script>
</body>

</html>
