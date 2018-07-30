<%-- 
    Document   : newjsp
    Created on : May 15, 2018, 7:20:42 PM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
header {
	border: 3px solid #ddd;
}
</style>

</head>
<body>
	<%
		HttpSession se = request.getSession();

		String n = (String) se.getAttribute("Uname");
		String pass = (String) se.getAttribute("pass");
		se.setAttribute("name", n);
	%>

	<header>
		<img src="Image/Spectralogo.jpg " width="200">
		<p id="header-title"></p>
	</header>
	<script
		src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
	<script src="assets/js/jquery.session.js"></script>
	<script>
		$(document).ready(function() {
			var headerTitle = $("#header-title");
			var username = $.session.get('username');
			if (username == null) {
				window.location.replace("Login.jsp");
			} else {
				headerTitle.text('Welcome ' + username);
			}

		});
	</script>