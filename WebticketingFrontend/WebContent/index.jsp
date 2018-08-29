<%-- 
    Document   : index
    Created on : May 15, 2018, 7:19:02 PM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
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
<link href="assets/css/component.css" rel="stylesheet" type="text/css" />
<link href="assets/css/default.css" rel="stylesheet" type="text/css" />
<title>WebTicketing</title>
</head>

<body>
	<%-- <form>
		<select id="language" name="language" onchange="submit()">
			<option value="en_US" ${language == 'en_US' ? 'selected' : ''}>English</option>
			<option value="ar_EG" ${language == 'ar_EG' ? 'selected' : ''}>Arabic</option>
		</select>
	</form> --%>
	<%@include file="Header.jsp"%>
	<div class="top-content">
		<div class="inner-bg ">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<img src="Image/Spectralogo.jpg " width="400">
								<h2>
									<fmt:message key="welcome" />
								</h2>
							</div>
							<div class="form-top-right">
								<i class="fa fa-home"></i>
							</div>

							<div class="grid cs-style-3">
								<div class="col-sm-4">
									<figure>
										<img src="Image/Login.jpg" alt="img04">
										<figcaption>
											<span><fmt:message key="webticketing_site" /></span> <a href="Login.jsp"><fmt:message key="enter"/></a>
										</figcaption>
									</figure>
								</div>
								<div class="col-sm-4">
									<figure>
										<img src="Image/ProblemSub.jpg" alt="img04">
										<figcaption>
											<fmt:message key="problem_submit"/> <a href="ProblemSubmitted.jsp"><fmt:message key="enter"/></a>
										</figcaption>
									</figure>
								</div>
								<div class="col-sm-4 ">
								<figure>
										<img src="Image/LiveChat.png" alt="img04">
										<figcaption>
											<span><fmt:message key="live_chat"/></span> <a href="Image/LiveChat.png"><fmt:message key="enter"/></a>
										</figcaption>
									</figure>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="assets/js/toucheffects.js"></script>
	<script src="assets/js/modernizr.custom.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>



	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
$(document).ready(function() {
		$.session.remove('userId');
			$.session.remove('username');
			$.session.remove('email');
			$.session.remove('userType');
			$.session.clear();
			Cookies.remove('user');
	});
	</script>

</body>
</html>
