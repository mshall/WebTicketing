<%-- 
    Document   : Login
    Created on : May 16, 2018, 12:05:08 AM
    Author     : shimaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String lg = request.getAttribute("Lg").toString();
%>

<c:if test="${not empty lg}">
    <fmt:setLocale value="${lg}" scope="session"/>


</c:if>

<fmt:setBundle  basename="resource.Problem" scope="session"  /> 
<!DOCTYPE html>
<html>
    <head>
        <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/form-elements.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <title>Problem Submit</title>


    </head>
    <body > 
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 form-box">
                            <div class="form-top">
                                <div class="form-top-left ">
                                    <img src="Image/Spectralogo.jpg " width="200">
                                    <b >   Write Your Issue</b>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-question"></i>
                                </div>
                            </div>                        
                            
                            <div class="form-bottom">
                                <form action="ProbelmSubmit" Method ="POST" class=" form-horizontal">
                                    <div class="form-group">
                                        <label  name="TID"> <fmt:message key="TID"/> </label>
                                        <input type="text" name="TID" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label  name="MID"><fmt:message key="MID"/> </label>
                                        <input type="text" name="MID" class=" form-control">
                                    </div>

                                    <div class="form-group">
                                        <label  name="CP">Contact Name </label>
                                        <input type="text" name="CP"  class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label  name="Mob">Mobile</label>
                                        <input type="text" name="Mob" class=" form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label  name="PD"> Problem Details</label>
                                        <input type="text" name="PD" class=" form-control">
                                    </div>
                                    <button type="submit" class="btn btn-lg btn-primary btn-block" value="submit">Submit</button>
                                </form>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>

        <script src="assets/js/jquery.backstretch.min.js" type="text/javascript"></script>
        <script src="assets/js/scripts.js" type="text/javascript"></script>

        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->




    </body>
</html>
