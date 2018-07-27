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
            header{
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

        <header >
            <img src="Image/Spectralogo.jpg " width="200">
            <b>Welcome <% out.print(n);%> </b>
        </header>

        <%--
        <div class="page-header bg-grey">
            <img src="Image/Spectralogo.jpg " width="200">
            img {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 5px;
    width: 200px;
    
}
        </div> 
    
        --%>

