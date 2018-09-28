<%-- 
    Document   : addSIM
    Created on : May 24, 2018, 6:25:24 PM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><fmt:message key="add_sim" /></title>
</head>
<body>

	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
		`	<jsp:include page="AlertMessage.jsp"></jsp:include>
			<div class="panel-group" id="accordion">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 id="pageTitle" class="panel-title">
								
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<form action="" method="POST" class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-4"><fmt:message key="serial_number" /> </label>
									<div class="col-sm-8">
										<input class="form-control" type="text" id="simSerial"
											name="serial" placeholder="Serial" required/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"><fmt:message key="operator" /> </label>
									<div class="col-sm-8">
										<select id="operator">
											<option value="">select...</option>
											<option value="vodafone">vodafone</option>
											<option value="orange">Orange</option>
											<option value="etisalat">Etisalat ></option>
											<option value="we">We</option>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="status" /></label>
									<div class="col-sm-8">
										<select id="status">
											<option value="">select...</option>
											<option value="1">Stocked</option>
											<option value="0">Deployed</option>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="condition" /></label>
									<div class="col-sm-8">
										<select id="simCondition">
											<option value="">select...</option>
											<option value="1">Active</option>
											<option value="0">In Active</option>
										</select>
									</div>
								</div>	
								<div class="form-group">
									<label class="control-label col-sm-4"><fmt:message key="terminal_id" /></label>
									<div class="col-sm-8">
										<input class="form-control" type="text" id="terminalId"
									 placeholder="terminalId" required />
									</div>
								</div>
									
								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="store" /></label>
									<div class="col-sm-8" id="storesList">
										
									</div>
								</div>
								
								
								<div class="form-group ">
									<label class="control-label col-sm-4"><fmt:message key="merchant" /></label>
									<div class="col-sm-8" id="merchantList">										
									</div>
								</div>
								
									
								<div class="form-group ">
									<div class="col-sm-offset-4 col-sm-8">
										<input type="button" value="<fmt:message key="submit" />" onclick="save()"
											class="btn btn-primary" /> <input type="reset"
											value="<fmt:message key="cancel" />" name="cancel" onclick="Formreset()"
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

		getStoresDropdown();
		getMerchantsDropdown();
		
		console.log($.urlParam('simId'));
		
		if($.urlParam('simId')!=null||$.urlParam('simId')!=undefined){
			console.log("getsim");
			$('#pageTitle').html('<fmt:message key="edit_sim" />');
			getSimById();
		}else{
			$('#pageTitle').html('<fmt:message key="add_sim" />');
		}
	});
	
		function Formreset() {
			window.location.replace("SIM.jsp");
		}

		function save(){
			console.log($.urlParam('simId'));
			if($.urlParam('simId')==null||$.urlParam('simId')==undefined){
				console.log("add sim");
				saveSim(link+':8082/v1/sim/');
			}else{
				console.log("update sim");
				saveSim(link+':8082/v1/sim/update');
			}
		}
	</script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
