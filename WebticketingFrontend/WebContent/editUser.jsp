<%-- 
    Document   : addTechnical
    Created on : May 17, 2018, 4:06:06 AM
    Author     : Mohamed S. El-Shall
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="update_user" /></title>
</head>
<body>

	<div class="wrapper">
		<%@include file="AdminSideBar.jsp"%>
		<div id="content">
			<jsp:include page="AlertMessage.jsp"></jsp:include>
			<div class="panel-group">

				<div class="panel panel-primary" id="panel1">
					<div class="panel-heading">
						<h4 class="panel-title">
							<fmt:message key="update_user" />

						</h4>
					</div>

				</div>
				<div>
						<form action="" method="POST" class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-sm-4"><fmt:message
										key="user_id" /> </label>
								<div class="col-sm-8">
									<input class="form-control" type="text" id="userId" readonly="" />
								</div>
							</div>
					
					<div class="form-group">
						<label class="control-label col-sm-4"><fmt:message
								key="email" /> </label>
						<div class="col-sm-8">
							<input class="form-control" type="email" id="email"
								placeholder="@example.com" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4"><fmt:message
								key="user_name" /> </label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="username"
								placeholder="UserName" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4"><fmt:message
								key="password" /> </label>
						<div class="col-sm-8">
							<input class="form-control" type="password" id="password"
								placeholder="Password" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4"><fmt:message
								key="confirm_password" /> </label>
						<div class="col-sm-8">
							<input class="form-control" type="password" id="password2"
								placeholder="Confirm Password"
								onkeyup="checkPass(); return false;" />
						</div>
					</div>
					<span id="confirmMessage" class="confirmMessage"></span>

					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							<input type="button" value="<fmt:message key="submit" />"
								id="submit" class="btn btn-primary" onclick="save()" /> <input
								type="button" value="<fmt:message key="cancel" />" id="cancel"
								onclick="window.location.replace('BlockedUsers.jsp');" class="btn btn-danger" />
						</div>
					</div>

					</form>

				</div>
			</div>

		</div>
	</div>
	</div>

	<script src="assets/js/operations/admin/users.js"></script>
	<script>
		$(document).ready(function() {
			var userId = getURLParameter('userId');
			console.log("userId:" + userId);
			if (userId != null) {
				console.log("getUserById");
				getUserById(userId);
			}
		});

		function checkPass() {
			//Store the password field objects into variables ...
			var pass1 = document.getElementById("password");
			var pass2 = document.getElementById("password2");
			//Store the Confimation Message Object ...
			var message = document.getElementById("confirmMessage");
			//Set the colors we will be using ...
			var goodColor = "#66cc66";
			var badColor = "#ff6666";
			//Compare the values in the password field 
			//and the confirmation field
			if (pass1.value === pass2.value) {
				//The passwords match. 
				//Set the color to the good color and inform
				//the user that they have entered the correct password 
				pass2.style.backgroundColor = goodColor;
				message.style.color = goodColor;
				message.innerHTML = "Passwords Match!";
			} else {
				//The passwords do not match.
				//Set the color to the bad color and
				//notify the user.
				pass2.style.backgroundColor = badColor;
				message.style.color = badColor;
				message.innerHTML = "Passwords Do Not Match!";
			}
		}

		function save() {
			var userId = getURLParameter('userId');
			if (userId != null) {
				updateUser();
			} else {

			}
		}
	</script>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
