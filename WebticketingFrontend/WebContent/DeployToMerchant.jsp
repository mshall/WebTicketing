<%-- 
    Document   : DeployToMerchant
    Created on : May 27, 2018, 10:24:35 PM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="deploy_to_merchant" /></title>
<style>
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
								href="#collapseOne"><fmt:message key="deploy_to_merchant" /></a>
						</h4>
					</div>

				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body   ">
						<form name="" action="DeploymentControll" method="POST"
							class="form-horizontal">

							<div class="form-group ">
								<label class="control-label col-sm-4"><fmt:message key="mid" /></label>
								<div class="col-sm-8" id="merchantList"></div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4"><fmt:message key="currency" /></label>
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
								<label class="control-label col-sm-4"><fmt:message key="class" /></label>
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
								<label class="control-label col-sm-4"><fmt:message key="status" /></label>
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
								<label class="control-label col-sm-4"><fmt:message key="terminal_id" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="terminalId"
										placeholder="Terminal ID" required="">
								</div>
							</div>


							<div class="form-group ">
								<label class="control-label col-sm-4"><fmt:message key="branch" /></label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="branch"
										placeholder="branch" required="">
								</div>
							</div>

							<div class="form-group ">
								<label class="control-label col-sm-4"><fmt:message key="deployment_date" /></label>
								<div class="col-sm-8">
									<input type="datetime-local" class="form-control"
										id="deploymentDate" placeholder="date" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4"><fmt:message key="sim1" /></label>
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
								<label class="control-label col-sm-4"><fmt:message key="sim2" /></label>
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
								<label class="control-label col-sm-4"><fmt:message key="terminal_feature" /></label>
							</div>
							<div class="form-group ">
								<div class="col-sm-8 col-sm-offset-2">
									<table class="table responsive ">
										<tr>
											<td clas="col-sm-4"><input type="checkbox" id="sale" />
												<label><fmt:message key="sale" /></label></td>
											<td clas="col-sm-4"><input type="checkbox"
												id="onlineRefund" /> <label><fmt:message key="online_refund" /></label></td>
										</tr>

										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												id="offlineRefund" /> <label><fmt:message key="offline_refund" /> </label></td>


											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="offlineSale" /> <label><fmt:message key="offline_sale" />  </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="onlineVoid" /><label><fmt:message key="onLine_void" />
													 </label></td>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="offlineVoid" /> <label><fmt:message key="offLine_void" /> 
													 </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="preauth" /> <label><fmt:message key="preauth" /> </label></td>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="amex" /><label><fmt:message key="amex" /> </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="installments" /> <label>
												<fmt:message key="instatiment" /> </label></td>

											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="prepaidServices" /> <label>
												<fmt:message key="prepaid_services" /> </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="diners" /> <label><fmt:message key="diners" />  </label></td>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="premuim" /> <label><fmt:message key="premuim" />  </label></td>
										</tr>
										<tr>
											<td clas="col-sm-4"><input type="checkbox"
												name="Feature" id="manualEntry" clas="col-sm-1" /> <label
												clas="col-sm-3"><fmt:message key="manual_entry" /> </label></td>
										</tr>

									</table>
								</div>
							</div>

							<div class="form-group ">
								<div class="col-sm-offset-4 col-sm-8">
									<input type="button" value="<fmt:message key="submit" />" onclick="addDeployment()"
										class="btn btn-primary" /> <input type="button" value="<fmt:message key="cancel" />"
										name="cancel" onclick="Formreset()" class="btn btn-danger" />
								</div>
							</div>

						</form>


					</div>
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
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
