<%-- 
    Document   : newjsp
    Created on : May 17, 2018, 3:25:19 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit Merchant</title>
<style>
</style>
</head>
<body>
	<script>
		/* $(function() {
			$('input[name=dob]').datepicker();
		}); */
	</script>
	<%@include file="Header.jsp"%>
	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
			<div class="alert alert-success" id="successUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Sucess!
				</strong> Merchant is updated successfully
			</div>
			<div class="alert alert-danger" id="errorUpdate">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>Warning!
				</strong> Couldn't update merchant!
			</div>
			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-target="#collapseOne"
								href="#collapseOne"> Edit Merchant </a>
						</h4>
					</div>

				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body   ">
						<form action="" method="POST" class="form-horizontal">
							<div class="form-group ">
								<label class="control-label col-sm-4">MID</label>
								<div class="col-sm-8">
									<input class="form-control" type="text" name="itMerchantId"
										id="itMerchantId" readonly="">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Merchant Name</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="itMerchantName"
										id="itMerchantName" placeholder="Merchant Name" required>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Contact Person</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="itContactPerson"
										id="itContactPerson" placeholder="Contact Person">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Phone 1</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="itPhone1"
										id="itPhone1" placeholder="Phone 1" required>
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Phone 2</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="itPhone2"
										id="itPhone2" placeholder="Phone 2">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Email</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" name="itEmail"
										id="itEmail" placeholder="@example.com">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">City</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="itCity"
										id="itCity" placeholder="City">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Street</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="itStreet"
										id="itStreet" placeholder="Street">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">AMex Merchant ID </label>
								<div class="col-sm-8">
									<input type="number " class="form-control"
										name="itAmexMerchantId" id="itAmexMerchantId"
										placeholder="AMes Merchant ID ">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Premium ID</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="itPremiumId"
										id="itPremiumId" placeholder="Premium ID">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">MCC</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="itMCC"
										id="itMCC" placeholder="MCC">
								</div>
							</div>
							<div class="form-group ">
								<label class="control-label col-sm-4">Class</label>
								<div class="col-sm-8">
									<select name="sClass" id="sClass">
										<option value="none"></option>
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
									<select name="sCurrency" id="sCurrency">
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
								<label class="control-label col-sm-4">Status</label>
								<div class="col-sm-8">
									<select name="sStatus" id="sStatus">
										<option value="none"></option>
										<option value="active">Active</option>
										<option value="inactive">In Active</option>

									</select>
								</div>
							</div>
							<div class="form-group ">
								<div class="col-sm-offset-4 col-sm-8">
									<input type="button" value="Submit" name="submit"
										class="btn btn-primary" onclick="updateMerchant()" /> <input
										type="reset" value="Cancel" name="cancel"
										onclick="Formreset()" class="btn btn-danger" />
								</div>
							</div>


						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/operations/util.js"></script>
	<script src="assets/js/operations/admin/merchants.js"></script>
	<script>
		$(document).ready(function() {
			$("#successUpdate").hide();
			$("#errorUpdate").hide();
			var merchantId = getURLParameter('merchantId');
			populateEditMerchantForm(merchantId);
		});
		function Formreset() {
			document.getElementById("myForm").reset();
		}
	</script>
</body>

</html>
