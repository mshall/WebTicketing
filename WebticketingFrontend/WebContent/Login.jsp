<%-- 
    Document   : Login
    Created on : May 16, 2018, 12:05:08 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/form-elements.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"
	type="text/css" />
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<title>Login</title>


</head>
<body>



	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<img src="Image/Spectralogo.jpg " width="400">
								<h3>Login to our site</h3>

							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div>
							<p id="form-message" style="font-size: 1.2em;">
							</p>
						</div>
						<div class="form-bottom">
							<form action="Login" Method="POST" class="login-form">
								<div class="form-label-group">
									<label class="sr-only">Username</label> <input type="text"
										required="true" id="uname" name="uname"
										placeholder="Username..." class="form-username form-control"
										id="form-username">
								</div>
								<br>
								<div class="form-label-group">
									<label class="sr-only">Password</label> <input type="password"
										required="true" id="password" name="psw"
										placeholder="Password..." class="form-password form-control"
										id="form-password">
								</div>
								<br>
								<button type="button" onclick="performLogin()"
									class="btn btn-lg btn-primary btn-block">Sign in!</button>


							</form>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<!-- <script src="assets/js/jquery-1.11.1.min.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="assets/js/jquery.session.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="assets/js/operations/login.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<script src="assets/js/scripts.js" type="text/javascript"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->




</body>
</html>
