<%-- 
    Document   : addSIM
    Created on : May 24, 2018, 6:25:24 PM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<title>Add SIM</title>
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
								href="#collapseOne"> Add Sim </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<form action="" method="POST" class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-4"> Serial Number</label>
									<div class="col-sm-8">
										<input class="form-control" type="text" id="simSerial"
											name="serial" placeholder="Serial" required/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">Operator </label>
									<div class="col-sm-8">
										<select id="operator">
											<option value="">Operator</option>
											<option value="vodafone">vodafone</option>
											<option value="orange">Orange</option>
											<option value="etisalat">Etisalat ></option>
											<option value="we">We</option>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4">Status</label>
									<div class="col-sm-8">
										<select id="status">
											<option value="">status</option>
											<option value="Active">Active</option>
											<option value="InActive">In Active</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">Condition</label>
									<div class="col-sm-8">
										<input class="form-control" type="text"
											id="condition" placeholder="Condition" required/>
									</div>
								</div>
									
								<div class="form-group">
									<label class="control-label col-sm-4">Terminal Id</label>
									<div class="col-sm-8">
										<input class="form-control" type="text" id="terminalId"
									 placeholder="terminalId" required />
									</div>
								</div>
									
								<div class="form-group ">
									<label class="control-label col-sm-4">Store</label>
									<div class="col-sm-8" id="storesList">
										
									</div>
								</div>
								
								
								<div class="form-group ">
									<label class="control-label col-sm-4">Merchant</label>
									<div class="col-sm-8" id="merchantList">										
									</div>
								</div>
								
									
								<div class="form-group ">
									<div class="col-sm-offset-4 col-sm-8">
										<input type="button" value="Submit" onclick="save()"
											class="btn btn-primary" /> <input type="reset"
											value="Cancel" name="cancel" onclick="Formreset()"
											class="btn btn-danger" />
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="assets/js/operations/admin/sim.js"></script>
<script src="assets/js/operations/admin/stores.js"></script>
<script src="assets/js/operations/admin/merchants.js"></script>
	<script>
	
	$(document).ready(function() {
		console.log($.urlParam('simId'));
		if($.urlParam('simId')!=null||$.urlParam('simId')!=undefined){
			getSimById();
		}
		getStoresDropdown();
		getMerchantsDropdown();
	});
	
		function Formreset() {
			window.location.replace("SIM.jsp");
		}

		function save(){
			console.log($.urlParam('simId'));
			if($.urlParam('simId')==null||$.urlParam('simId')==undefined){
				console.log("add sim");
				saveSim('http://localhost:8082/v1/sim/');
			}else{
				console.log("update sim");
				saveSim('http://localhost:8082/v1/sim/update');
			}
		}
	</script>
</body>
</html>
