<%-- 
    Document   : Login
    Created on : May 16, 2018, 12:05:08 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/form-elements.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"
	type="text/css" />
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<title><fmt:message key="login" /></title>


</head>
<body>

<form>
            <select id="language" name="language" onchange="submit()">
                <option value="en_US" ${language == 'en_US' ? 'selected' : ''}>English</option>
                <option value="ar_EG" ${language == 'ar_EG' ? 'selected' : ''}>Arabic</option>               
            </select>
     </form>

	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<img src="Image/Spectralogo.jpg " width="400">
								<h3><fmt:message key="login_to_our_site" /></h3>

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
									<label class="sr-only"><fmt:message key="username" /></label> <input type="text"
										required="true" id="uname" name="uname"
										placeholder="Username..." class="form-username form-control"
										id="form-username">
								</div>
								<br>
								<div class="form-label-group">
									<label class="sr-only"><fmt:message key="password" /></label> <input type="password"
										required="true" id="password" name="psw"
										placeholder="Password..." class="form-password form-control"
										id="form-password">
								</div>
								<br>
								<button type="button" onclick="performLogin()"
									class="btn btn-lg btn-primary btn-block"><fmt:message key="signin" /></button>


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
