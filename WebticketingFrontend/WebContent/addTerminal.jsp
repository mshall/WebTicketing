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
<title>Add Terminal</title>
</head>
<body>
	<script>
		$(function() {
			$('input[name=dob]').datepicker();
		});
	</script>
	<%@include file="Header.jsp"%>
	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseOne"
								href="#collapseOne"> Add Terminal </a>
						</h4>
					</div>


					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body   ">
							<form action="TerminalControll" method="POST"
								class="form-horizontal">

								<div class="form-group ">
									<label class="control-label col-sm-4">Terminal ID </label>
									<div class="col-sm-8">
										<input type="number" class="form-control" id="terminalId"
											placeholder="Terminal ID " />
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4">Store</label>
									<div class="col-sm-8" id="storesList">
										
									</div>
								</div>
								
								<div class="form-group ">
									<label class="control-label col-sm-4">Tender</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="tender"
											placeholder="Tender" />
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4">Model </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="model"
											placeholder="Terminal Model">
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4">Serial Number</label>
									<div class="col-sm-8">
										<input type="number" class="form-control"
											id="terminalSerialNumber" placeholder="Serial Number"]>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4"> Condition </label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="condition"
											placeholder="Condition">
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-sm-4">Class</label>
									<div class="col-sm-8">
										<select id="terminalClass">
											<option value="">select...</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4">Currency</label>
									<div class="col-sm-8">
										<select name="currency">
										 <option value="">select... </option>
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
									<label class="control-label col-sm-4">Terminal Feature</label>
								</div>
								<div class="form-group ">
									<div class="col-sm-8 col-sm-offset-2">
										<table class="table responsive ">
											<tr>
												<td clas="col-sm-4"><input type="checkbox" id="sale"
													 /> <label>Sale</label></td>
												<td clas="col-sm-4"><input type="checkbox"
													id="onlineRefund"  /> <label>online
														Refund</label></td>
											</tr>

											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													id="offlineRefund"  /> <label> offline
														Refund </label></td>


												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="offlineSale"  /> <label>
														offline Sale </label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="onlineVoid"  /><label>
														OnLine Void </label></td>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="offlineVoid"  /> <label>
														OffLine Void </label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="preauth"  /> <label>
														Preauth </label></td>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="amex"  /><label>
														Amex </label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="installments"  /> <label>
														Instatiment </label></td>

												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="prepaidServices"  /> <label>
														Prepaid Services </label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="diners"  /> <label>
														Diners </label></td>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="premuim"  /> <label>
														Premuim </label></td>
											</tr>
											<tr>
												<td clas="col-sm-4"><input type="checkbox"
													name="Feature" id="manualEntry" clas="col-sm-1"
													 /> <label clas="col-sm-3"> Manual
														Entry </label></td>
											</tr>

										</table>


									</div>



								</div>


								<div class="form-group ">
									<div class="col-sm-offset-4 col-sm-8">
										<input type="button" value="submit" id="submit"
											class="btn btn-primary" onclick="addTerminal()" /> 
										<input type="reset" value="cancel" name="cancel"
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
			/* $("#submit").click(function() {
				var selectedFreature = new Array();
				$('input[name="Feature"]:checked').each(function() {
					selectedFreature.push(this.value);
				});

			}); */
			getStoresDropdown();
		});

		function Formreset() {
			/* document.getElementById("myForm").reset(); */
			window.location.replace("Terminals.jsp");
		}
	</script>
</body>

</html>
