<%-- 
    Document   : newjsp
    Created on : May 19, 2018, 3:53:11 AM
    Author     : Mohamed S. El-Shall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<a href="BootStrap/fonts/glyphicons-halflings-regular.svg"></a>
<!-- <script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script> -->
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="BootStrap/css/bootstrap-theme.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<link href="BootStrap/css/mstyle.css" rel="stylesheet" type="text/css" /><!-- 
<script src="BootStrap/jquery-1.12.0.min.js" type="text/javascript"></script> -->
<script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="BootStrap/js/npm.js" type="text/javascript"></script>
<script src="BootStrap/js/bootstrap.js" type="text/javascript"></script>
</head>
<body>


	<nav id="sidebar">
		<button type="button" id="sidebarCollapse"
			class="btn btn-info navbar-btn  ">
			<i class="glyphicon glyphicon-align-right"></i> <span></span>
		</button>

		<ul class="list-unstyled components">
			<li class="active"><a href="TechnicalHome.jsp"> <i
					class="glyphicon glyphicon-home"></i><fmt:message key="home" />
			</a></li>


			<li><a href="#Terminal" data-toggle="collapse"
				aria-expanded="false"> <i class="glyphicon glyphicon-phone"></i>
					<fmt:message key="tickets" />
			</a>
				<ul class="collapse list-unstyled" id="Terminal">
					<li><a href="TechnicalTickets.jsp"><fmt:message key="tickets_history" /></a></li>
					<li><a href="MaintainedTickets.jsp"><fmt:message key="tickets_maintenance" /></a></li>

				</ul></li>


			<li><a onclick="logout()" href=""> <i class="glyphicon glyphicon-log-out"></i>
					<fmt:message key="logout" />
			</a></li>
		</ul>


	</nav>

	<script src="assets/js/jquerysession.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});

		// Activate the logout when clicked
		function logout() {
			$.session.clear();
			window.location.replace("Login.jsp");
		}
	</script>

</body>
</html>
