<%-- 
    Document   : WithDraw
    Created on : May 25, 2018, 6:31:31 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="terminal_withdraw" /></title>
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
										name="cancel" onclick="window.history.go(-1);" class="btn btn-danger" />
								</div>
							</div>


						</form>
					</div>
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
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
