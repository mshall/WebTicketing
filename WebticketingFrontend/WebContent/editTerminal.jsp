<%-- 
    Document   : TerminalUpdate
    Created on : May 25, 2018, 7:03:36 AM
    Author     : shimaa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="deployed_terminals" /></title>
</head>
<body>

	<div class="wrapper ">
		<%@include file="AdminSideBar.jsp"%>

		<%-- page Contenct --%>

		<div id="content">
		<jsp:include page="AlertMessage.jsp"></jsp:include>
			<div class="panel-group" id="accordion">
				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 id="pageTitle" class="panel-title"></h4>
					</div>

					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body   ">
							<form action="TerminalControll" method="POST"
								class="form-horizontal">

								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="terminal_id" /></label>
									<div class="col-sm-8">
										<input type="number" readonly="readonly" class="form-control" id="terminalId"
											placeholder="Terminal ID " />
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="store" /></label>
									<div class="col-sm-8" id="storesList"></div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="tender" /></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="tender"
											placeholder="Tender" />
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="model" /></label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="model"
											placeholder="Terminal Model">
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="serial_number" /></label>
									<div class="col-sm-8">
										<input type="number" class="form-control"
											id="terminalSerialNumber" placeholder="Serial Number"]>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="condition" /> </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="condition"
											placeholder="Condition">
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="class" /></label>
									<div class="col-sm-8">
										<select id="terminalClass">
											<option value="">Select...</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</select>
									</div>
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
													name="Feature" id="offlineSale" /> <label>
														<fmt:message key="offline_sale" /></label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="onlineVoid" /><label>
														<fmt:message key="online_void" /></label></td>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="offlineVoid" /> <label>
														<fmt:message key="offLine_oid" /> </label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="preauth" /> <label><fmt:message key="preauth" /> </label></td>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="amex" /><label><fmt:message key="amex" /></label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="installments" /> <label>
													<fmt:message key="instatiment" /> </label></td>

												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="prepaidServices" /> <label>
													<fmt:message key="prepaid_services" /></label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="diners" /> <label><fmt:message key="diners" /></label></td>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="premuim" /> <label><fmt:message key="premuim" /></label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="manualEntry" clas="col-sm-1" />
													<label clas="col-sm-3"><fmt:message key="manual_entry" /></label></td>
											</tr>

										</table>
									</div>
								</div>


								<div class="form-group ">
									<div class="col-sm-offset-4 col-sm-8">
										<input type="button" value="<fmt:message key="submit" />" id="submit"
											class="btn btn-primary" onclick="save()" /> <input
											type="reset" value="<fmt:message key="cancel" />" name="cancel"
											onclick="Formreset()" class="btn btn-danger" />
									</div>
								</div>


							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/operations/admin/terminals.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>

	<script>
		$(document).ready(function() {
			getStoresDropdown();
			var terminalId = getURLParameter('terminalId');
			if (terminalId != null) {
				$('#pageTitle').html('<fmt:message key="update_terminals" />');
				getTerminalById(terminalId);
			}else{
				$('#pageTitle').html('<fmt:message key="add_terminal" />');
			}

		});

		function save() {
			var terminalId = getURLParameter('terminalId');
			if (terminalId != null) {
				updateTerminal();
			} else {
				addTerminal();
			}
		}
		
		function Formreset() {
			/* document.getElementById("myForm").reset(); */
			window.location.replace("Terminals.jsp");
		}
	</script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
