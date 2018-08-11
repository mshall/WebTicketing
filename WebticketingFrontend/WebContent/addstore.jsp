<%-- 
    Document   : addstore
    Created on : May 17, 2018, 4:05:50 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>Store</title>
</head>
<body>

	<%@include file="Header.jsp"%>
	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
			<div class="panel-group">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">Store</h4>
					</div>

				</div>

				<div class="panel-body   ">
					<form action="StoreControll" method="POST" class="form-horizontal">
						<div class="form-group ">
							<label class="control-label col-sm-4"> Store ID</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="storeId"
									placeholder="Store ID" readonly="readonly">
							</div>
						</div>

						<div class="form-group ">
							<label class="control-label col-sm-4"> Store Name</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="storeName"
									placeholder="Store Name">
							</div>
						</div>
						<div class="form-group ">
							<label class="control-label col-sm-4">Store Address</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="store_address"
									placeholder="Store Address">
							</div>
						</div>
						

						<div class="form-group ">
							<label class="control-label col-sm-4"> Status</label>
							<div class="col-sm-8">
								<select id="status" style="width: 50%">
									<option value="active">Active</option>
									<option value="inactive">In Active</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<input type="button" value="Submit" name="submit"
									class="btn btn-primary" onclick="save()" /> <input type="reset"
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

	<script src="assets/js/operations/util.js"></script>
	<script src="assets/js/operations/admin/stores.js"></script>

	<script>
		$(document).ready(function() {
			var storeId = getURLParameter('storeId');
			if (storeId != null) {
				getStoreById(storeId);
			}
		});

		function save() {
			var storeId = getURLParameter('storeId');
			if (storeId != null) {
				updateStore();
			} else {
				addStore();
			}
		}

		function Formreset() {
			window.location.replace("Store.jsp");
		}
	</script>
</body>
</html>
